-- Profile Table
CREATE TABLE profile (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Product Table
CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Transaction Table
CREATE TABLE trans( id INT PRIMARY KEY, profile_id INT, product_id INT, amount DECIMAL(10, 2), FOREIGN KEY (profile_id) REFERENCES profile(id), FOREIGN KEY (product_id) REFERENCES product(id));

-- Product Inventory Table
CREATE TABLE product_inventory (
    product_id INT PRIMARY KEY,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Add Pseudo Data
INSERT INTO profile VALUES (1, 'John Doe', 'john@example.com');
INSERT INTO product VALUES (1, 'Laptop', 799.99), (2, 'Smartphone', 499.99);
INSERT INTO trans VALUES (1, 1, 1, 799.99);
INSERT INTO product_inventory VALUES (1, 10), (2, 25);
