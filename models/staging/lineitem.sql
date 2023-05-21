with

source  as (

    select * from {{ source('src_raw_tpch_sf1','lineitem') }}

),

lineitem as (
    select
        l_comment as comment,
        l_commitdate as commitdate,
        l_discount as discount,
        l_extendedprice as extendedprice,
        l_linenumber as linenumber,
        l_linestatus as linestatus,
        l_orderkey as orderkey,
        l_partkey as partkey,
        l_quantity as quantity,
        l_receiptdate as receiptdate,
        l_returnflag as returnflag,
        l_shipdate as shipdate,
        l_shipinstruct as shipinstruct,
        l_shipmode as shipmode,
        l_suppkey as suppkey,
        l_tax as tax

    from source
)
select * from lineitem