--OBJECTIVE 3
--Analyze customer behavior
/*Your final objective is to combine the items and orders tables, 
find the least and most ordered categories, and dive into the details of the highest spend orders.*/

--1. Combine the menu_items and order_details tables into a single table
SELECT * 
FROM ORDER_DETAILS OD LEFT JOIN MENU_ITEMS MI
ON OD.ITEM_ID = MI.MENU_ITEM_ID;

--2. What were the least and most ordered items? What categories were they in?
SELECT ITEM_NAME, CATEGORY, COUNT(ORDER_DETAILS_ID) AS NUM_PURCHASES
FROM ORDER_DETAILS OD LEFT JOIN MENU_ITEMS MI
ON OD.ITEM_ID = MI.MENU_ITEM_ID
GROUP BY ITEM_NAME, CATEGORY
ORDER BY NUM_PURCHASES DESC;

SELECT ITEM_NAME, CATEGORY, COUNT(ORDER_DETAILS_ID) AS NUM_PURCHASES
FROM ORDER_DETAILS OD LEFT JOIN MENU_ITEMS MI
ON OD.ITEM_ID = MI.MENU_ITEM_ID
GROUP BY ITEM_NAME, CATEGORY
ORDER BY NUM_PURCHASES;

--3. What were the top 5 orders that spent the most money?
SELECT ORDER_ID, SUM(price) 
FROM ORDER_DETAILS OD JOIN MENU_ITEMS MI
ON OD.ITEM_ID = MI.MENU_ITEM_ID
GROUP BY ORDER_ID
ORDER BY SUM(price) DESC
LIMIT 5;

--4. View the details of the highest spend order. Which specific items were purchased?
SELECT CATEGORY, COUNT(ITEM_ID) AS NUM_ITEMS
FROM ORDER_DETAILS OD LEFT JOIN MENU_ITEMS MI
ON OD.ITEM_ID = MI.MENU_ITEM_ID
WHERE ORDER_ID = 440
GROUP BY CATEGORY;

--5. BONUS: View the details of the top 5 highest spend orders
SELECT CATEGORY, COUNT(ITEM_ID) AS NUM_ITEMS
FROM ORDER_DETAILS OD LEFT JOIN MENU_ITEMS MI
ON OD.ITEM_ID = MI.MENU_ITEM_ID
WHERE ORDER_ID IN (440, 2075, 1957, 330, 2675)
GROUP BY CATEGORY;