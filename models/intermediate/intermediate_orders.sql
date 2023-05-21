with orders as (

    select * from {{ ref('orders') }}

),


customers as (

    select * from {{ ref('customer') }}

),

nation as (
    select * from {{ ref('nation') }}
),

region as (
    select * from {{ ref('region') }}
),


--Cogemos el valor total de todos los pedidos

order_total as (

    select 
        orderkey,
        sum (totalprice) as order_value
    from orders
    group by 1

),

high_priority_orders as(
    select
        orders.orderkey,
        orders.custkey,
        orders.orderpriority,
        nation.name as nation,
        region.name as region
        --order_total.order_value

    from orders
    --left join order_total on order_total.orderkey=orders.orderkey
    left join customers on orders.custkey=customers.custkey
    left join nation on nation.nationkey=customers.nationkey
    left join region on region.regionkey=nation.regionkey
    where orders.orderpriority='1-URGENT'
)

select * from high_priority_orders