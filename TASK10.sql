select dayname(str_to_date(Date, '%d-%m-%y')) as sale_day, sum(Total) as Total_sales 
from walmartsales
group by sale_day
order by Total_sales desc; 
