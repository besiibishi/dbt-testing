WITH ranked_shows AS (
  SELECT 
    su.country, 
    ss.show_title,
    SUM(sw.minutes_watched) AS total_watch_time,
    ROW_NUMBER() OVER (
      PARTITION BY su.country 
      ORDER BY SUM(sw.minutes_watched) DESC
    ) AS rn
  FROM {{ ref('stream_users') }} su
  JOIN {{ ref('stream_watch_history') }} sw ON su.user_id = sw.user_id
  JOIN {{ ref('stream_shows') }} ss ON sw.show_id = ss.show_id
  GROUP BY su.country, ss.show_title
)

SELECT country, show_title, total_watch_time
FROM ranked_shows
WHERE rn <= 3
ORDER BY country, total_watch_time DESC

