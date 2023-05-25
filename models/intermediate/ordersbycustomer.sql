--Cuenta el numero de pedidos que ha hecho cada cliente
with orders as (
    select * from {{ ref('orders') }}
),

customers as (
    select * from {{ ref('customer') }}
),
ordersbycustomer as(
    select 
        orders.custkey,
        min(orderdate) as first_order_date,
        max(orderdate) as most_recent_order_date,
        count(orderkey) as number_of_orders

        from orders

        group by 1
)

select * from ordersbycustomer


