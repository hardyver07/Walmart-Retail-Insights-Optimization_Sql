SELECT 
    `Customer ID`, SUM(Total) AS totalSales_Revenue
FROM
    walmartsales
GROUP BY `Customer ID`
ORDER BY totalSales_Revenue DESC
LIMIT 5;