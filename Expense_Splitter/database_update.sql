-- Expense Splitter Database Update Script
-- Add new columns for enhanced expense tracking

USE expense_splitter;

-- Add new columns to expenses table (one by one to avoid errors if column already exists)
-- If column already exists, you'll get an error but can ignore it

-- Add trip_name column
ALTER TABLE expenses 
ADD COLUMN trip_name VARCHAR(200) DEFAULT NULL;

-- Add description column
ALTER TABLE expenses 
ADD COLUMN description TEXT DEFAULT NULL;

-- Add participants_list column
ALTER TABLE expenses 
ADD COLUMN participants_list TEXT DEFAULT NULL;

-- Add category column
ALTER TABLE expenses 
ADD COLUMN category VARCHAR(50) DEFAULT 'General';

-- Add expense_date column
ALTER TABLE expenses 
ADD COLUMN expense_date DATE DEFAULT (CURDATE());

-- Update existing records to have default values
UPDATE expenses 
SET trip_name = COALESCE(trip_name, 'General Expenses'),
    category = COALESCE(category, 'General'),
    expense_date = COALESCE(expense_date, CURDATE())
WHERE trip_name IS NULL OR category IS NULL OR expense_date IS NULL;

SELECT 'Database updated successfully!' AS Status;

