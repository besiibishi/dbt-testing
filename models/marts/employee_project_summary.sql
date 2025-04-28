-- Build a model called employee_project_summary that shows:
-- Employee name
-- Department
-- Total hours worked
-- Count of projects
-- Percentage of hours on Client projects
-- employee_id,employee_name,department
-- project_id,employee_id,hours_logged,project_type

select e.employee_name, e.department, 
count(p.project_id) as count_projects,
sum(hours_logged) as total_hours_worked,
sum(case when project_type = 'Client' then hours_logged else 0 end) / total_hours_worked as percentage_of_hours
from {{ref('projects')}} p join {{ref('employees')}} e
on e.employee_id = p.employee_id
group by e.employee_name, e.department


-- menyra e chat gbt

-- with base as (
--     select
--         e.employee_id,
--         e.employee_name,
--         e.department,
--         p.project_id,
--         p.hours_logged,
--         p.project_type
--     from {{ ref('stg_projects') }} p
--     join {{ ref('stg_employees') }} e
--       on e.employee_id = p.employee_id
-- )

-- select
--     employee_name,
--     department,
--     count(project_id) as count_projects,
--     sum(hours_logged) as total_hours_worked,
--     sum(case when project_type = 'Client' then hours_logged else 0 end) 
--       / sum(hours_logged) as percentage_of_hours
-- from base
-- group by employee_name, department