--    review_id  product_id  rating                        review_text
-- 0          1         101       5                      Amazing tool!
-- 1          2         101       4             Very useful and clean.
-- 2          3         102       3  Okay, but pages could be thicker.
-- 3          4         103       5  Fantastic insights on the market.
-- 4          5         103       2               Not what I expected.
--    product_id    product_name  price
-- 0         101      AI Planner  19.99
-- 1         102   Focus Journal  14.99
-- 2         103  Crypto Tracker  29.99


select p.product_id, p.product_name, p.price,
count(r.review_id) as total_reviews,
round(avg(r.rating), 2) as avg_rating,
max(r.rating) as max_rating,
min(r.rating) as min_rating
from {{ref('stg_products3')}} p left join {{ref('stg_reviews3')}} r
on p.product_id = r.product_id
group by p.product_id, p.product_name, p.price

