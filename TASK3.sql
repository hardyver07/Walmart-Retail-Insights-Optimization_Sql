select `Customer ID`, avg(Total) as avg_purchase_amount, sum(Total) as total_purchase_amount,
case 
when avg(Total)> 335 then 'High spender'
when avg(Total)< 300 then 'Low Spender'
else 'Medium Spender'
end as Customer_spend_class 
 from walmartsales 
 group by `Customer ID`
 order by avg_purchase_amount Desc;