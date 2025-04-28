select watch_id,user_id,show_id,watch_date,minutes_watched
from {{ref('stream_watch_history')}}