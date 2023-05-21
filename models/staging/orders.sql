with

source  as (

    select * from {{ source('src_raw_tpch_sf1','orders') }}

),

orders as (
    select
        o_clerk as clerk,
        o_comment as comment,
        o_custkey as custkey,
        o_orderdate as orderdate,
        o_orderkey as orderkey,
        o_orderpriority as orderpriority,
        o_orderstatus as orderstatus,
        o_shippriority as shippriority,
        o_totalprice as totalprice

    from source
)
select * from orders