-- models/staging/stg_customers.sql

with source as (
    select * from {{ source('project_db', 'CUSTOMERS') }}
)

select
    customer_id,
    first_name,
    last_name,
    email,
    created_at
from source
