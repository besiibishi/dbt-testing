select sale_id,
product_id,quantity, CAST(sale_date as DATE) as sale_date
from {{ref('sales')}}
