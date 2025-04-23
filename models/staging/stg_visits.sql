select visit_id,patient_id,doctor_name,
LOWER(diagnosis) as diagnosis, CAST(visit_date as DATE)
from {{ref('visits')}}

