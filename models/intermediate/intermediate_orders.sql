with orders as (

    select * from {{ ref('orders') }}

),


customer as (

    select * from {{ ref('customer') }}

),

--Cogemos el valor total de todos los pedidos

order_totals as (

    select orderkey
    sum (totalprice) as order_value
    from orders
    group by 1,2

),

high_priority_orders as(
    select
        orders.orderkey,
        orders.custkey
        orders.orderpriority,
        order_totals.order_value
    from orders
    left join customers on orders.custkey=customers.custkey
    where orders.ordepriority='1-URGENT'
)

select * from high_priority_orders