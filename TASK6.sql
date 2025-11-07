SELECT 
    Gender,
    month(STR_TO_DATE(Date, '%d-%m-%Y')) AS sale_month,
    SUM(Total) AS total_sales
FROM
    walmartsales
GROUP BY Gender , sale_month
order by gender;