WITH product_line_analysis AS (
SELECT `Product line`, AVG(Total) AS avg_total, STDDEV(Total) AS std_total
FROM walmartsales GROUP BY `Product line`
)
SELECT walmartsales.`Invoice ID`, walmartsales.Total, product_line_analysis.*
FROM walmartsales JOIN product_line_analysis 
ON walmartsales.`Product line` = product_line_analysis.`Product line`
WHERE walmartsales.Total > product_line_analysis.avg_total + 2 * product_line_analysis.std_total 
OR walmartsales.Total < product_line_analysis.avg_total - 2 * product_line_analysis.std_total;
