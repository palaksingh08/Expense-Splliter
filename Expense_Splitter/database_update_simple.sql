-- Expense Splitter Database Update Script (Simple Version)
-- Run each ALTER statement one by one
-- If you get "Duplicate column name" error, skip that statement and continue

USE expense_splitter;

-- Add trip_name column (skip if already exists)
ALTER TABLE expenses ADD COLUMN trip_name VARCHAR(200) DEFAULT NULL;

-- Add description column (skip if already exists)
ALTER TABLE expenses ADD COLUMN description TEXT DEFAULT NULL;

-- Add participants_list column (skip if already exists)
ALTER TABLE expenses ADD COLUMN participants_list TEXT DEFAULT NULL;

-- Add category column (skip if already exists)
ALTER TABLE expenses ADD COLUMN category VARCHAR(50) DEFAULT 'General';

-- Add expense_date column (skip if already exists)
ALTER TABLE expenses ADD COLUMN expense_date DATE DEFAULT (CURDATE());

-- Update existing records
UPDATE expenses 
SET trip_name = COALESCE(trip_name, 'General Expenses'),
    category = COALESCE(category, 'General'),
    expense_date = COALESCE(expense_date, CURRENT_DATE)
WHERE trip_name IS NULL OR category IS NULL OR expense_date IS NULL;

SELECT 'Database updated successfully!' AS Status;

