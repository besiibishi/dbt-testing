-- SELECT id, LOWER(name) as name, age, diagnosis 
-- from {{ref ('patients')}}



SELECT *
FROM {{ source('main', 'patients')}}