-- Profile Table Data
INSERT INTO profile (name, email) VALUES
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com'),
('Alice Johnson', 'alice@example.com'),
('Bob Williams', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com'),
('Diana Davis', 'diana@example.com'),
('Ethan Edwards', 'ethan@example.com'),
('Fiona Fisher', 'fiona@example.com'),
('George Graham', 'george@example.com'),
('Hannah Harris', 'hannah@example.com'),
('Ian Irving', 'ian@example.com'),
('Julia Jenkins', 'julia@example.com'),
('Kevin King', 'kevin@example.com'),
('Laura Lee', 'laura@example.com'),
('Mike Moore', 'mike@example.com');

-- Product Table Data
INSERT INTO product (name, price) VALUES
('Laptop', 799.99),
('Smartphone', 499.99),
('Tablet', 299.99),
('Desktop Computer', 999.99),
('Smartwatch', 199.99),
('Wireless Earbuds', 149.99),
('4K TV', 699.99),
('Gaming Console', 399.99),
('Digital Camera', 449.99),
('Bluetooth Speaker', 79.99),
('External Hard Drive', 89.99),
('Wireless Mouse', 29.99),
('Mechanical Keyboard', 109.99),
('Monitor', 249.99),
('Printer', 179.99);

-- Transaction Table Data
INSERT INTO trans (profile_id, product_id, amount) VALUES
(1, 1, 799.99),
(2, 2, 499.99),
(3, 3, 299.99),
(4, 4, 999.99),
(5, 5, 199.99),
(6, 6, 149.99),
(7, 7, 699.99),
(8, 8, 399.99),
(9, 9, 449.99),
(10, 10, 79.99),
(11, 11, 89.99),
(12, 12, 29.99),
(13, 13, 109.99),
(14, 14, 249.99),
(15, 15, 179.99);

-- Product Inventory Table Data
INSERT INTO product_inventory (product_id, quantity) VALUES
(3, 15),
(4, 5),
(5, 30),
(6, 50),
(7, 8),
(8, 12),
(9, 7),
(10, 40),
(11, 20),
(12, 100),
(13, 35),
(14, 18),
(15, 22);