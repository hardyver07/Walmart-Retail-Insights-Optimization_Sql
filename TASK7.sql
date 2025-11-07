with product_line_rank as(
SELECT 
    `Product line`,
    `Customer type`,
    COUNT(*) AS count_of_transactions, 
    rank() OVER(partition by `Customer type` order by COUNT(*) DESC) as RANK_OFproductline
FROM
    walmartsales
GROUP BY `Product line` , `Customer type`)
select `Customer type`, `Product line` AS most_purchased_productline, count_of_transactions 
FROM product_line_rank
where RANK_OFproductline = 1;
