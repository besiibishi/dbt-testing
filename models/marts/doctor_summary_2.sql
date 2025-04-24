with ranked as (

    select doctor_name,
    diagnosis,
    count(*) as count,
    row_number() over(PARTITION by doctor_name order by count(*) desc) as rn
    from {{ref('visits_v2')}}
    GROUP BY doctor_name, diagnosis

),

patients as (
    select doctor_name, count(DISTINCT patient_id) as unique_patients
    from {{ref('visits_v2')}}
    GROUP BY doctor_name
)

select p.doctor_name, p.unique_patients, r.diagnosis
from patients p join ranked r
on p.doctor_name = r.doctor_name
where r.rn = 1