with

source  as (

    select * from {{ source('src_raw_tpch_sf1','nation') }}

),

nation as (
    select
        n_comment as comment,
        n_name as name,
        n_nationkey as nationkey,
        n_regionkey as regionkey

    from source
)
select * from nation