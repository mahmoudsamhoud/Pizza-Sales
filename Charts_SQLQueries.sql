-- Required Charts

-- Daily Trend for Total Orders
SELECT DATENAME(W, order_date) AS WEEK_DAY, COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB.dbo.pizza_sales
GROUP BY DATENAME(W, order_date)
ORDER BY Total_Orders DESC 


-- Monthly Trend for Total Orders
SELECT
	DATENAME(M, order_date) AS 'Month',
	COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB.dbo.pizza_sales
GROUP BY DATENAME(M, order_date)
ORDER BY Total_Orders DESC

-- Percentage of Sales By Pizza Category
SELECT 
  pizza_category AS Pizza_Category, 
  CAST(
    SUM(total_price) AS DECIMAL(10, 2)
  ) AS Total_Sales, 
  CAST(
    (
      (
        SUM(total_price)* 100
      )/(
        SELECT 
          SUM(total_price) 
        FROM 
          PizzaDB.dbo.pizza_sales
		--WHERE MONTH(order_date)=1    -- Filter for specific month (january in case of 1)
      )
    ) AS DECIMAL(10, 2)
  ) AS Sales_PCT 
FROM 
  PizzaDB.dbo.pizza_sales 
--WHERE
--	MONTH(order_date)=1  -- Filter for specific month (january in case of 1)
GROUP BY 
  pizza_category 
ORDER BY 
  Sales_PCT DESC

-- Percentage of Sales By Pizza Size
SELECT 
  pizza_size AS Pizza_Size, 
  CAST(
    SUM(total_price) AS DECIMAL(10, 2)
  ) AS Total_Sales, 
  CAST(
    (
      (
        SUM(total_price)* 100
      )/(
        SELECT 
          SUM(total_price) 
        FROM 
          PizzaDB.dbo.pizza_sales
		--WHERE MONTH(order_date)=1    -- Filter for specific month (january in case of 1)
      )
    ) AS DECIMAL(10, 2)
  ) AS Sales_PCT 
FROM 
  PizzaDB.dbo.pizza_sales 
--WHERE
--	MONTH(order_date)=1  -- Filter for specific month (january in case of 1)
GROUP BY 
  pizza_size 
ORDER BY 
  Sales_PCT DESC

-- Total Pizzas Sold By Pizza Category
SELECT 
	pizza_category AS Pizza_Category,
	SUM(quantity) AS Total_Pizzas
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizzas DESC

-- Top 5 Sellers by Revenue
SELECT
 TOP 5
	pizza_name,
	SUM(total_price) AS Total_Revenue
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- Top 5 Sellers by Total Quantity
SELECT
 TOP 5
	pizza_name,
	SUM(quantity) AS Total_Quantity
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

-- Top 5 Sellers By Total Orders
SELECT
 TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

-- Lowest 5 Sellers by Revenue
SELECT
 TOP 5
	pizza_name,
	SUM(total_price) AS Total_Revenue
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Lowest 5 Sellers by Total Quantity
SELECT
 TOP 5
	pizza_name,
	SUM(quantity) AS Total_Quantity
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

-- Lowest 5 Sellers By Total Orders
SELECT
 TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC