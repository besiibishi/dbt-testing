select  project_id,employee_id,hours_logged,project_type
from {{ref('projects')}}