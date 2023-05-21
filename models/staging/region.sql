with

source  as (

    select * from {{ source('src_raw_tpch_sf1','region') }}

),

region as (
    select
        r_comment as comment,
        r_name as name,
        r_regionkey as regionkey
    from source
)
select * from region