with Monthly_sales as(
SELECT 
        branch,
        Month(STR_TO_DATE(date, '%d-%m-%Y')) AS sale_month,
        SUM(total) AS monthly_total
    FROM walmartsales
    GROUP BY branch, sale_month),
monthly_growth as(
select 
		branch, 
		sale_month, 
		monthly_total, 
		lag(monthly_total) over(partition by branch order by sale_month) as prev_month_total, 
		(monthly_total- lag(monthly_total) over(partition by branch order by sale_month))/ nullif(lag(monthly_total) over(partition by branch order by sale_month),0) as growth_rate 
    from Monthly_sales)
Select 
		branch, 
		round(AVG(growth_rate)*100,4) as avg_growth_percentage 
    from monthly_growth 
    group by branch 
    order by avg_growth_percentage desc;