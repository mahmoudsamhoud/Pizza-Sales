-- KPI’s Requirement

-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM PizzaDB.dbo.pizza_sales

-- Average Order Value
SELECT 
  (SUM(total_price) / COUNT(DISTINCT(order_id)))
	AS Avg_Order_Value 
FROM 
  PizzaDB.dbo.pizza_sales

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_Quantity
FROM PizzaDB.dbo.pizza_sales

-- Total Orders
SELECT COUNT(DISTINCT(order_id)) AS Total_Orders
FROM PizzaDB.dbo.pizza_sales

-- AVG Pizzas Per Order
SELECT 
  CAST(CAST(
    SUM(quantity) AS DECIMAL (10, 2)
  )/ CAST(
    COUNT(
      DISTINCT (order_id)
    ) AS DECIMAL(10, 2)
  )AS DECIMAL(10,2))  AS AVG_Pizzas_Per_Order 
FROM 
  PizzaDB.dbo.pizza_sales


