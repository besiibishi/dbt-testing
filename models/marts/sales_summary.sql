select p.product_name, sum(s.quantity) as total_quantity_sold,
sum(s.quantity * p.price) as total_revenue
from {{ref('sales')}} s join {{ref('products')}} p
on s.product_id = p.product_id
group by p.product_name