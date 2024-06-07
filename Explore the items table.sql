--OBJECTIVE 1
--Explore the items table
/*Your first objective is to better understand the items table by finding the number of rows in the table,
the least and most expensive items, and the item prices within each category.*/

--1. View the menu_items table and write a query to find the number of items on the menu
SELECT *FROM MENU_ITEMS;

SELECT 
	COUNT(*) 
FROM MENU_ITEMS;

--2. What are the least and most expensive items on the menu?
SELECT *FROM MENU_ITEMS
ORDER BY PRICE;

SELECT *FROM MENU_ITEMS
ORDER BY PRICE desc;

--3. How many Italian dishes are on the menu? 
--What are the least and most expensive Italian dishes on the menu?
SELECT COUNT(*) FROM MENU_ITEMS
WHERE CATEGORY = 'Italian';

SELECT *FROM MENU_ITEMS
WHERE CATEGORY = 'Italian'
ORDER BY PRICE ASC;

SELECT *FROM MENU_ITEMS
WHERE CATEGORY = 'Italian'
ORDER BY PRICE desc;

--4. How many dishes are in each category? What is the average dish price within each category?
SELECT CATEGORY, COUNT(MENU_ITEM_ID) AS NUM_DISH
FROM MENU_ITEMS
GROUP BY CATEGORY

SELECT CATEGORY, AVG(PRICE) AS AVG_PRICE
FROM MENU_ITEMS
GROUP BY CATEGORY