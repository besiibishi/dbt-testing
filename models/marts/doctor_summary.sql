WITH ranked AS (
  SELECT 
    doctor_name,
    diagnosis,
    COUNT(*) AS count,
    ROW_NUMBER() OVER (PARTITION BY doctor_name ORDER BY COUNT(*) DESC) AS rn
  FROM {{ ref('visits') }}
  GROUP BY doctor_name, diagnosis
),

patients AS (
  SELECT doctor_name, COUNT(DISTINCT patient_id) AS unique_patients
  FROM {{ ref('visits') }}
  GROUP BY doctor_name
)

SELECT 
  p.doctor_name,
  p.unique_patients,
  r.diagnosis AS top_diagnosis
FROM patients p
JOIN ranked r ON p.doctor_name = r.doctor_name
WHERE r.rn = 1
