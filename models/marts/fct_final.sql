with ordersbyconsumer as(
    select * from {{ ref('ordersbycustomer') }}
),

intermediate_supplier as (
    select * from {{ ref('intermediate_supplier') }}
),

intermediate_orders as (
    select * from {{ ref('intermediate_orders') }}
),

base_results as(
    select customername
    from intermediate_orders
)

select * from base_results