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
        customers.name as customername,
        customers.address as customeradress,
        customers.phone as customerphone,
        count(orders.orderkey) as numberoforders


    from orders
    inner join customers on orders.custkey=customers.custkey
    group by orders.custkey, customers.name, customers.address, customers.phone
)

select * from ordersbycustomer