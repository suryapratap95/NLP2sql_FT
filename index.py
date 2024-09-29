from transformers import AutoModelForSeq2SeqLM, AutoTokenizer
import torch
import sqlite3
import re

# Load a different pre-trained model from Hugging Face
model_name = "mrm8488/t5-small-finetuned-wikiSQL"
model = AutoModelForSeq2SeqLM.from_pretrained(model_name)
tokenizer = AutoTokenizer.from_pretrained(model_name)

# Connect to SQL database
conn = sqlite3.connect('customers.db')

def nlp_to_sql(nlp_query):
    inputs = tokenizer(nlp_query, return_tensors="pt", max_length=512, truncation=True)
    with torch.no_grad():
        outputs = model.generate(inputs['input_ids'], max_length=128, num_return_sequences=1)
    sql_query = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return sql_query

def execute_sql_query(sql_query):
    cursor = conn.cursor()
    cursor.execute(sql_query)
    result = cursor.fetchall()
    return result

def format_sql_result(result):
    if not result:
        return "No results found."
    if len(result) == 1 and len(result[0]) == 1:
        return str(result[0][0])
    return "\n".join([str(row) for row in result])

def get_column_names(sql_query):
    match = re.search(r"SELECT\s+(.+?)\s+FROM", sql_query, re.IGNORECASE)
    if match:
        columns = [col.strip() for col in match.group(1).split(',')]
        return columns
    return None

def chat():
    print("Welcome to the NLP-to-SQL chatbot! Ask me questions about the customer database.")
    print("Type 'exit' to quit, 'help' for assistance, or 'schema' to see the database structure.")

    while True:
        user_query = input("User: ").strip()
        
        if user_query.lower() == 'exit':
            print("Goodbye!")
            break
        elif user_query.lower() == 'help':
            print("You can ask questions like:")
            print("- How many customers do we have?")
            print("- What's the average age of our customers?")
            print("- List the names of customers from New York.")
            continue
        elif user_query.lower() == 'schema':
            print("Database Schema:")
            print("- Customers table: id, name, age, city, state")
            continue

        try:
            sql_query = nlp_to_sql(user_query)
            print(f"Generated SQL: {sql_query}")
            
            result = execute_sql_query(sql_query)
            columns = get_column_names(sql_query)
            
            if columns:
                print("Columns:", ", ".join(columns))
            
            formatted_result = format_sql_result(result)
            print(f"Result: {formatted_result}")
            
        except Exception as e:
            print(f"Error: {e}")
            print("I'm sorry, I couldn't process that query. Could you try rephrasing it?")

if __name__ == "__main__":
    chat()
