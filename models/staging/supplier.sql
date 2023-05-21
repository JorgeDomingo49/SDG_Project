with

source  as (

    select * from {{ source('src_raw_tpch_sf1','supplier') }}

),

supplier as (
    select
        s_acctbal as acctbal,
        s_address as address,
        s_comment as regionkey,
        s_name as name,
        s_nationkey as nationkey,
        s_phone as phone,
        s_suppkey as suppkey
    from source
)
select * from supplier