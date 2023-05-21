with

source  as (

    select * from {{ source('src_raw_tpch_sf1','customer') }}

),

customer as (
    select
        c_acctbal as acctbal,
        c_address as address,
        c_comment as comment,
        c_custkey as custkey,
        c_mktsegment as mktsegment,
        c_name as name,
        c_nationkey as nationkey,
        c_phone as phone
    from source
)
select * from customer