select count(id) as total_patients,
ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE)- EXTRACT(YEAR FROM birthdate)), 1) as avg_age,
ROUND(SUM(CASE WHEN deathdate IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(id), 2) AS death_rate_percentage,
sum(case when gender = 'M' then 1 else 0 end) as male_patients,
sum(case when gender = 'F' then 1 else 0 end) as female_patients,
sum(case when deathdate is null then 1 else 0 end) as alive_patients
from {{ref('stg_patients-Hackathon')}}