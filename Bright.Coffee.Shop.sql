SELECT *
FROM .SHOP;
---------------------------------------------
--CHECKING NUMBER OF COFFEE STORE_LOCATION
SELECT DISTINCT(STORE_LOCATION)
FROM khoza.coffee.shop;
---------------------------------------------
--CHECKING PRODUCT CATEGORY
SELECT DISTINCT(PRODUCT_CATEGORY)
FROM khoza.coffee.shop;
--------------------------------------------
--CHECKING NUMBER OF PRODUCT TYPE
SELECT DISTINCT(PRODUCT_TYPE)
FROM khoza.coffee.shop;
--------------------------------------------
--DATE AND TIME FUNCTIONS-------------------
--Checking when was the last transaction date---
SELECT MAX(transaction_date) AS Last_transaction_date
FROM khoza.coffee.shop;
--------------------------------------------
SELECT transaction_date, 
DAYNAME (transaction_date) AS day_name
FROM khoza.coffee.shop;
--------------------------------------------
SELECT transaction_date,
DAYNAME (transaction_date) AS day_name,
CASE 
WHEN day_name IN ('sun', 'sat') THEN 'weekend'
ELSE 'weekday'
END AS day_classification,
MONTHNAME (transaction_date) AS month_name,

-- transaction_time.
CASE
WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'morning'
WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'afternoon'
WHEN transaction_time >= '17:00:00' THEN 'evening'
END AS time_classification,
store_location,
product_category,
product_type,

-- ID 
COUNT (DISTINCT transaction_id) AS number_of_sales,

-- Revenue
SUM (transaction_qty*unit_price) AS revenue

FROM khoza.coffee.shop
GROUP BY ALL;
