-- We’ll create something like watch_summary.sql that includes:
-- user_name
-- country
-- total watch time
-- number of shows watched
-- average time per watch

-- select show_id,show_title,genre,duration
-- from {{ref('stream_shows')}}

-- select user_id,user_name,age,country
-- from {{ref('stream_users')}}

-- select watch_id,user_id,show_id,watch_date,minutes_watched
-- from {{ref('stream_watch_history')}}


select
    su.user_name, su.country,
    sum(sw.minutes_watched) as total_watch_time,
    count(distinct sw.show_id) as number_of_shows_watched,
    avg(sw.minutes_watched) as average_time_per_watch
from {{ ref('stg_stream_watch_history') }} sw join {{ ref('stg_stream_users') }} su
    on sw.user_id = su.user_id
join {{ ref('stg_stream_shows') }} ss
    on sw.show_id = ss.show_id
group by su.user_name, su.country
