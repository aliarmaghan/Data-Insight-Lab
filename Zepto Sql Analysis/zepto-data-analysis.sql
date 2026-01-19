--sample data
SELECT * FROM zepto
LIMIT 10;
--drop table if exists zepto;
-- Create table
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
---######### DATA EXPLORATION ###########------------
--count of rows
select count(*) from zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

---######### DATA CLEANING ###########------------
--product with price  = 0
SELECT *
FROM zepto
WHERE MRP = 0 OR discountedsellingprice = 0;

Delete FROM zepto
where sku_id = 3607

-- convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0

SELECT mrp,discountedsellingprice from zepto;


-- Found top 10 best-value products based on discount percentage
SELECT DISTINCT name,category, discountpercent, discountedsellingprice,mrp
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10



-- Identified high-MRP products that are currently out of stock
SELECT DISTINCT name,category, mrp, weightingms
FROM zepto
WHERE outofstock = 'true' AND mrp > 300
ORDER BY mrp desc

-- Estimated potential revenue for each product category
SELECT category,SUM(discountedsellingprice * availableQuantity) as Total_Revenue
FROM zepto
GROUP BY category
ORDER BY total_Revenue


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT(name), mrp, discountpercent
FROM zepto
WHERE mrp > 500 and discountpercent < 10
ORDER BY discountpercent desc

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category , ROUND(AVG(discountpercent),2) as Max_discount
FROM zepto
GROUP BY category
ORDER BY Max_discount DESC
LIMIT 5

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT(NAME),weightInGms, discountedSellingPrice, 
ROUND((discountedsellingprice / weightingms),2) as Price_per_gram
FROM zepto
WHERE weightingms > 100
ORDER BY Price_per_gram DESC


--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT(name), weightInGms,
CASE 
	WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
END AS weight_category
FROM zepto

--Q8.What is the Total Inventory Weight Per Category 
SELECT category, SUM(weightInGms * availableQuantity) AS Total_Inventory_WT
FROM zepto
GROUP BY category
ORDER BY Total_Inventory_WT desc