with

source  as (

    select * from {{ source('src_raw_tpch_sf1','part') }}

),

part as (
    select
        p_brand as brand,
        p_comment as comment,
        p_container as container,
        p_mfgr as mfgr,
        p_name as name,
        p_partkey as partkey,
        p_retailprice as retailprice,
        p_size as size,
        p_type as type
    from source
)
select * from part