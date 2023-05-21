with

source  as (

    select * from {{ source('src_raw_tpch_sf1','customer') }}

),

customer as (
    select
        c_acctbal as cust_balance,
        c_address as cust_address,
        c_comment as cust_comment,
        c_custkey as cust_id,
        c_mktsegment as cust_market_segment,
        c_name as cust_name,
        c_nationkey as cust_nation_key,
        c_phone as cust_phone
    from source
)
select * from customer