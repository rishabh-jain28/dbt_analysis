-- models/staging/stg_products.sql

with source as (
    select * from {{ source('project_db', 'PRODUCTS') }}
)

select
    product_id,
    product_name,
    category,
    price
from source