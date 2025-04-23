select id, LOWER(name) as name, age, diagnosis
from {{ref('patients')}}