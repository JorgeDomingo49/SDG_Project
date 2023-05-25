with ordersbycustomer as(
    select * from {{ ref('ordersbycustomer') }}
),

intermediate_supplier as (
    select * from {{ ref('intermediate_supplier') }}
),

intermediate_orders as (
    select * from {{ ref('intermediate_orders') }}
),

dim_final as (
    select distinct
        intermediate_orders.custkey,
        intermediate_orders.orderkey,
        intermediate_orders.customername,
        intermediate_orders.customeraddress,
        intermediate_orders.customerphone,
        ordersbycustomer.first_order_date,
        ordersbycustomer.most_recent_order_date,
        coalesce(ordersbycustomer.number_of_orders, 0) as number_of_total_orders,
        intermediate_orders.orderpriority,
        intermediate_supplier.suppliername
    from intermediate_orders

    inner join ordersbycustomer using (custkey)
    left join intermediate_supplier using (orderkey)

   
)

select * from dim_final

