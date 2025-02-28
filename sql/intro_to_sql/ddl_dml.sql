-- DDL

-- 1. Add a new column named rating to the Products table with an appropriate data type and a default value of 0.
ALTER TABLE Products
ADD Rating DECIMAL(2, 1) DEFAULT 0 NOT NULL; -- rating values 0.0 -> 10.0

-- 2. Modify the Category column (or the relevant table/column as applicable) to have a default value of 'new'.
ALTER TABLE Products
ADD CONSTRAINT Default_Category DEFAULT 'new' FOR Category;

-- 3. Drop the rating column from the Products table.
ALTER TABLE Products
DROP COLUMN Rating;

-- but first we drop the defualt constraint so the drop will work
-- ALTER TABLE Products
-- DROP CONSTRAINT DF__Products__Rating__4F7CD00D;

-- 4. Delete the Users table from the Social Media Platform database.
DROP TABLE Users;

-- 5. Drop the entire Social Media Platform database.
DROP DATABASE SocialMediaPlatform;



-- DML

-- 1. For the table that contains order information (e.g., an Orders table), update
--    the order date by setting it to the current date for all records where the order
--    id is greater than 0.
UPDATE Orders
SET OrderDate = GETUTCDATE()
WHERE OrderID > 0;

-- 2. Delete all rows from the Products table where the product name is not null
--    and not equal to "Null".
DELETE FROM Products
WHERE Name IS NOT NULL AND Name <> 'Null';