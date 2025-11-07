with profit_analysis as
(
select Branch, `Product line`, sum((`gross income`- cogs )) as total_profit, (sum(`gross income`- cogs )/nullif(sum(`gross income`),0)) as profit_margin
from walmartsales
group by Branch, `Product line`
), profit_rank as(
select *,
rank() over(partition by branch order by profit_margin desc) as rank_profit_margin
from profit_analysis)
select Branch, `Product Line` as most_profitable_product_line
from profit_rank
where rank_profit_margin=1;