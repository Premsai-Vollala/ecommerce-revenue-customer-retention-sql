schema.sql
-- =========================================================
-- E-Commerce Database Schema & Sample Data
-- =========================================================

DROP DATABASE IF EXISTS ecommerce_analytics;
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    signup_date DATE NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);

-- 2. Product Catalog Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    cost_price DECIMAL(10, 2) NOT NULL
);

-- 3. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) DEFAULT 'Delivered',
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Items Table (Relational Line Items)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========================================================
-- Sample Data Insertion
-- =========================================================

INSERT INTO customers (first_name, last_name, email, signup_date, city, state) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '2026-01-05', 'Hyderabad', 'Telangana'),
('Diya', 'Patel', 'diya.patel@example.com', '2026-01-12', 'Bengaluru', 'Karnataka'),
('Rohan', 'Verma', 'rohan.verma@example.com', '2026-01-18', 'Mumbai', 'Maharashtra'),
('Ananya', 'Reddy', 'ananya.reddy@example.com', '2026-02-02', 'Hyderabad', 'Telangana'),
('Vikram', 'Singh', 'vikram.singh@example.com', '2026-02-14', 'Delhi', 'Delhi'),
('Sneha', 'Nair', 'sneha.nair@example.com', '2026-03-01', 'Chennai', 'Tamil Nadu'),
('Karan', 'Mehta', 'karan.mehta@example.com', '2026-03-10', 'Pune', 'Maharashtra');

INSERT INTO products (product_name, category, unit_price, cost_price) VALUES
('Noise-Cancelling Headphones', 'Electronics', 149.99, 90.00),
('Mechanical Keyboard', 'Electronics', 89.99, 50.00),
('Ceramic Coffee Dripper', 'Home & Kitchen', 24.50, 10.00),
('Stainless Steel Water Bottle', 'Home & Kitchen', 19.99, 8.00),
('Organic Cotton Hoodie', 'Apparel', 45.00, 22.00),
('Running Shoes', 'Footwear', 110.00, 65.00);

INSERT INTO orders (customer_id, order_date, order_status, payment_method) VALUES
(1, '2026-01-10', 'Delivered', 'Credit Card'),
(1, '2026-02-20', 'Delivered', 'UPI'),
(1, '2026-04-05', 'Delivered', 'UPI'),
(2, '2026-01-15', 'Delivered', 'Debit Card'),
(2, '2026-03-15', 'Delivered', 'Credit Card'),
(3, '2026-01-20', 'Delivered', 'UPI'),
(4, '2026-02-05', 'Delivered', 'Net Banking'),
(4, '2026-02-28', 'Delivered', 'UPI'),
(5, '2026-02-18', 'Delivered', 'Credit Card'),
(6, '2026-03-05', 'Delivered', 'UPI'),
(7, '2026-03-12', 'Delivered', 'Cash on Delivery');

INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 149.99),
(1, 3, 2, 24.50),
(2, 2, 1, 89.99),
(3, 5, 2, 45.00),
(4, 6, 1, 110.00),
(5, 4, 3, 19.99),
(6, 1, 1, 149.99),
(7, 3, 1, 24.50),
(7, 5, 1, 45.00),
(8, 2, 1, 89.99),
(9, 6, 1, 110.00),
(10, 4, 2, 19.99),
(11, 5, 1, 45.00);
