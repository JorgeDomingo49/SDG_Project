with

source  as (

    select * from {{ source('src_raw_tpch_sf1','partsupp') }}

),

partsupp as (
    select
        ps_availqty as availqty,
        ps_comment as comment,
        ps_partkey as partkey,
        ps_suppkey as suppkey,
        ps_supplycost as supplycost
    from source
)
select * from partsupp