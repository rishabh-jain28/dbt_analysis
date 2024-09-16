-- models/staging/stg_orders.sql

with source as (
    select * from {{ source('project_db', 'ORDERS') }}
)

select
    order_id,
    customer_id,
    order_date,
    status,
    total_amount
from source