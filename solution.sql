-- ============================================================
-- SQL Fundamentals: Querying the Products Database
-- ============================================================


-- 1. BASIC SELECT & COLUMN ALIASES
------------------------------------------------------------

-- Question 1: Write a query to select all columns from the products table.
SELECT * 
FROM products;

-- Question 2: Retrieve only the product_name and price of all products.
SELECT product_name, price 
FROM products;

-- Question 3: Display product_name as "Product Title" and price as "Retail Price" for all items.
SELECT 
    product_name AS "Product Title", 
    price AS "Retail Price" 
FROM products;

-- Question 4: Select distinct categories from the products table.
SELECT DISTINCT category 
FROM products;


-- 2. WHERE CLAUSE & COMPARISON OPERATORS
------------------------------------------------------------

-- Question 5: Find all products with a price greater than $100.
SELECT * 
FROM products 
WHERE price > 100;

-- Question 6: Retrieve all products in the "Electronics" category.
SELECT * 
FROM products 
WHERE category = 'Electronics';

-- Question 7: Find products where stock_quantity is less than or equal to 20.
SELECT * 
FROM products 
WHERE stock_quantity <= 20;

-- Question 8: List products that are NOT discontinued (is_discontinued = FALSE or 0).
SELECT * 
FROM products 
WHERE is_discontinued = FALSE;


-- 3. LOGICAL OPERATORS (AND, OR, NOT) & IN / BETWEEN
------------------------------------------------------------

-- Question 9: Find products in the "Electronics" category with a price under $200.
SELECT * 
FROM products 
WHERE category = 'Electronics' 
  AND price < 200;

-- Question 10: Retrieve products that belong to either "Clothing" or "Home & Kitchen".
SELECT * 
FROM products 
WHERE category IN ('Clothing', 'Home & Kitchen');

-- Question 11: Find products with a price between $50 and $150 (inclusive).
SELECT * 
FROM products 
WHERE price BETWEEN 50 AND 150;

-- Question 12: Select all products EXCEPT those in the "Beauty" or "Sports" categories.
SELECT * 
FROM products 
WHERE category NOT IN ('Beauty', 'Sports');


-- 4. ORDER BY & LIMIT
------------------------------------------------------------

-- Question 13: List all products sorted by price from lowest to highest.
SELECT * 
FROM products 
ORDER BY price ASC;

-- Question 14: List all products sorted by stock_quantity from highest to lowest.
SELECT * 
FROM products 
ORDER BY stock_quantity DESC;

-- Question 15: Retrieve the top 5 most expensive products.
SELECT * 
FROM products 
ORDER BY price DESC 
LIMIT 5;

-- Question 16: Retrieve 10 products, skipping the first 5 (OFFSET 5).
SELECT * 
FROM products 
LIMIT 10 OFFSET 5;


-- 5. LIKE & PATTERN MATCHING
------------------------------------------------------------

-- Question 17: Find all products whose product_name starts with 'Pro'.
SELECT * 
FROM products 
WHERE product_name LIKE 'Pro%';

-- Question 18: Find products whose product_name contains the word 'Wireless'.
SELECT * 
FROM products 
WHERE product_name LIKE '%Wireless%';

-- Question 19: Find products whose SKU ends with 'X'.
SELECT * 
FROM products 
WHERE sku LIKE '%X';


-- 6. AGGREGATE FUNCTIONS & GROUP BY
------------------------------------------------------------

-- Question 20: Count the total number of products in the table.
SELECT COUNT(*) AS total_products 
FROM products;

-- Question 21: Calculate the average price of all products.
SELECT AVG(price) AS average_price 
FROM products;

-- Question 22: Find the minimum and maximum price across all products.
SELECT 
    MIN(price) AS min_price, 
    MAX(price) AS max_price 
FROM products;

-- Question 23: Count how many products exist in each category.
SELECT 
    category, 
    COUNT(*) AS total_products 
FROM products 
GROUP BY category;

-- Question 24: Calculate the total value of stock per category (SUM(price * stock_quantity)).
SELECT 
    category, 
    SUM(price * stock_quantity) AS total_stock_value 
FROM products 
GROUP BY category;

-- Question 25: Find categories that have more than 10 products (HAVING clause).
SELECT 
    category, 
    COUNT(*) AS total_products 
FROM products 
GROUP BY category 
HAVING COUNT(*) > 10;