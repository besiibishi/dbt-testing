{{config(materialized='view')}}

select c.customer_id, c.first_name || ' ' || c.last_name as full_name,
c.city, sum(p.amount) as total_paid,
min(p.payment_date) as first_payment,
max(p.payment_date) as last_payment

from {{ref('stg_customers2')}} c left JOIN
{{ref('stg_payments2')}} p 
on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name, c.city