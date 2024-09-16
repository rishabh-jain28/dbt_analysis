with customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
)

select
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    customers.email,
    count(orders.order_id) as total_orders,
    sum(orders.total_amount) as total_spent
from customers
left join orders on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.first_name, customers.last_name, customers.email
