-- models/staging/stg_order_items.sql

with source as (
    select * from {{ source('project_db', 'ORDER_ITEMS') }}
)

select
    ORDER_ITEM_ID,
	ORDER_ID,
	PRODUCT_ID,
	QUANTITY,
	PRICE_EACH 
from source