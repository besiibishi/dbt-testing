{{config(materialized='table')}}

SELECT

    COUNT(procedure_id) as total_procedures,
    count(patient_id) as unique_patients,
    count(DISTINCT procedure_code) as unique_codes,
    min(procedure_date) as first_procedure_date,
    max(procedure_date) as last_procedure_date

from {{ref('stg_procedures')}}