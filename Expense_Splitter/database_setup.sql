-- Expense Splitter Database Setup Script
-- Run this script in MySQL to create the database and tables

CREATE DATABASE IF NOT EXISTS expense_splitter;
USE expense_splitter;

-- Users table for authentication
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Expenses table
CREATE TABLE IF NOT EXISTS expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    paid_by VARCHAR(100) NOT NULL,
    participants INT NOT NULL,
    share DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data (optional - for testing)
-- INSERT INTO users (name, email, password) VALUES 
-- ('John Doe', 'john@example.com', 'password123'),
-- ('Jane Smith', 'jane@example.com', 'password123');

-- INSERT INTO expenses (amount, paid_by, participants, share) VALUES 
-- (1000.00, 'John Doe', 4, 250.00),
-- (500.00, 'Jane Smith', 2, 250.00);

SELECT 'Database setup completed successfully!' AS Status;

