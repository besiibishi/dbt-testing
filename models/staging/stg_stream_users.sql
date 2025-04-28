select user_id,user_name,age,country
from {{ref('stream_users')}}