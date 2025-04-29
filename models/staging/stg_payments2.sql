{{config(materialized='view')}}

select payment_id, customer_id, amount, payment_date
from {{source('raw_data', 'payments2')}}

