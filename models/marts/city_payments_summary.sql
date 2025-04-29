-- customer_id,first_name,last_name,city
-- 1,John,Doe,New York
-- 2,Anna,Smith,Chicago
-- 3,Mike,Johnson,Boston
-- 4,Sarah,Brown,Los Angeles

-- payment_id,customer_id,amount,payment_date
-- 1001,1,200,2024-01-01
-- 1002,2,150,2024-01-05
-- 1003,1,300,2024-02-01
-- 1004,3,400,2024-02-10
-- 1005,4,500,2024-03-01

-- Build a new mart that summarizes total payments per city, showing:
-- city	total_customers	total_paid	avg_payment


{{config(materialized='view')}}

select c.city, count(distinct c.customer_id) as total_customers,
sum(p.amount) as total_paid,
avg(p.amount) as avg_payment
from {{ref('stg_customers2')}} c  JOIN
{{ref('stg_payments2')}} p 
on c.customer_id = p.customer_id
group by c.city