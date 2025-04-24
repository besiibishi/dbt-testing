select product_id,
LOWER(product_name) as product_name,
LOWER(category) as category,
CAST(price as DOUBLE) AS price
FROM {{ref('products')}}