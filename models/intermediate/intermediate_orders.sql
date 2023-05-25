--Muestra informacion completa de los pedidos
with orders as (
    select * from {{ ref('orders') }}
),

customers as (
    select * from {{ ref('customer') }}
),

lineitem as (
    select * from {{ ref('lineitem') }}
),

nation as (
    select * from {{ ref('nation') }}
),

region as (
    select * from {{ ref('region') }}
),

--Cogemos los pedidos con prioridad alta

order_priority as (

    select 
        orderkey,
        orderpriority
    from orders
    where orderpriority='1-URGENT'

),

intermediate_orders as(
    select
        orders.orderkey,
        orders.custkey,
        customers.name as customername,
        customers.address as customeraddress,
        customers.phone as customerphone,
        orders.totalprice as price,
        orders.orderdate,
        lineitem.shipdate,
        lineitem.receiptdate,
        order_priority.orderpriority,
        nation.name as nation,
        region.name as region

    from orders
    left join lineitem on lineitem.orderkey=orders.orderkey
    left join customers on orders.custkey=customers.custkey
    left join nation on nation.nationkey=customers.nationkey
    left join region on region.regionkey=nation.regionkey
    inner join order_priority on order_priority.orderkey=orders.orderkey
)
select * from intermediate_orders