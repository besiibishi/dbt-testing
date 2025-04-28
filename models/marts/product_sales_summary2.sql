select p.product_id, p.product_name, p.price,
       sum(s.quantity) as total_quantity,
       sum(s.quantity * p.price) as total_revenue
from {{ref('stg_products2')}} p left join {{ref('stg_sales2')}} s
on p.product_id = s.product_id
group by p.product_id, p.product_name, p.price