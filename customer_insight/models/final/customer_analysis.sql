select
    customer_id,
    first_name,
    last_name,
    email,
    total_orders,
    total_spent,
    total_spent / total_orders as avg_order_value
from {{ ref('customers_orders') }}
