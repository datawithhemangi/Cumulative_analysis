/*Cumulative Analysis*/

/*Calculate the total sales per month*/

SELECT
DATETRUNC( YEAR,order_date) as order_year,
SUM(sales_amount) as Total_Sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC( YEAR,order_date)
ORDER BY DATETRUNC( YEAR,order_date)


/*Calculate the total sales per month and the running total and moving avg price*/

SELECT
order_date,
Total_amount,
SUM(Total_amount) OVER (ORDER BY order_date) AS running_total_sales,
AVG(Avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
SELECT
DATETRUNC(YEAR, order_date) as order_date,
SUM(sales_amount) AS Total_amount,
AVG(price) AS Avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR, order_date)
) t
