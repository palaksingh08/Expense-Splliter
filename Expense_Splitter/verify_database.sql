-- Verify Database Structure
-- Run this to check if all columns are properly added

USE expense_splitter;

-- Check expenses table structure
DESCRIBE expenses;

-- Check if all new columns exist
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'expense_splitter'
  AND TABLE_NAME = 'expenses'
ORDER BY ORDINAL_POSITION;

-- Count total columns (should be 10: id, amount, paid_by, participants, share, created_at, trip_name, description, participants_list, category, expense_date)
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'expense_splitter'
  AND TABLE_NAME = 'expenses';

SELECT 'Verification complete! All columns should be present.' AS Status;

