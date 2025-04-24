select visit_id,patient_id,doctor_name,
LOWER(diagnosis) as diagnosis,visit_date
from {{ref('visits_v2')}}