with payment_method as(
select City, Payment, count(Payment) as count_of_transactions  
from walmartsales 
group by city, Payment
),
payment_rank as( 
select * ,Rank() over(partition by city order by count_of_transactions desc) as rank_payment_method 
from payment_method
)
Select City, Payment as most_popular_payment_method, count_of_transactions
from payment_rank
where rank_payment_method=1; 