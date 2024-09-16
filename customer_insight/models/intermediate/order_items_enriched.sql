-- Filename: order_items_enriched.sql

with order_items as (
    select
        oi.order_item_id,
        oi.order_id,
        oi.product_id,
        oi.quantity,
        oi.price_each,
        p.product_name,
        p.category,
        p.price as product_price
    from {{ ref('stg_order_items') }} oi
    left join {{ ref('stg_products') }} p on oi.product_id = p.product_id
)

select
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.price_each,
    oi.product_name,
    oi.category,
    oi.product_price,
    oi.quantity * oi.price_each as total_item_amount
from order_items oi
