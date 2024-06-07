--OBJECTIVE 2
---Explore the orders table
/* Your second objective is to better understand the orders table by finding the date range,
the number of items within each order, and the orders with the highest number of items.*/

--1. View the order_details table. What is the date range of the table?
SELECT *FROM ORDER_DETAILS;

--2. How many orders were made within this date range? 
--How many items were ordered within this date range?
SELECT MIN(order_date), MAX(order_date) 
FROM ORDER_DETAILS;

SELECT COUNT(DISTINCT order_id)
FROM ORDER_DETAILS;

SELECT COUNT(*)
FROM ORDER_DETAILS;

--3. Which orders had the most number of items?
SELECT ORDER_ID, COUNT(ITEM_ID) AS NUM_ITEMS
FROM ORDER_DETAILS
GROUP BY ORDER_ID
ORDER BY NUM_ITEMS desc;

--4. How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT ORDER_ID, COUNT(ITEM_ID) AS NUM_ITEMS
FROM ORDER_DETAILS
GROUP BY ORDER_ID
HAVING COUNT(ITEM_ID)>12) AS NUM_ORDERS;
