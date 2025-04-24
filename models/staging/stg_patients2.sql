select id,
LOWER(name) AS name,age
from {{ref("patients_v2")}}