WITH customer_dates AS (
    SELECT 
        `Customer ID`,
        STR_TO_DATE(Date, '%d-%m-%Y') AS purchase_date
    FROM walmartsales
),
repeat_customers_30days AS (
    SELECT 
        a.`Customer ID`,
        a.purchase_date AS first_purchase,
        b.purchase_date AS second_purchase,
        DATEDIFF(b.purchase_date, a.purchase_date) AS days_between
    FROM customer_dates a
    JOIN customer_dates b 
        ON a.`Customer ID` = b.`Customer ID`
       AND b.purchase_date > a.purchase_date
       AND DATEDIFF(b.purchase_date, a.purchase_date) <= 30
)
SELECT DISTINCT `Customer ID`
FROM repeat_customers_30days;
