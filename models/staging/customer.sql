{{config(
    materialized = 'incremental',
    unique_key = ['custkey','updated_at']
    )
}}
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
        c_phone as phone,
        current_timestamp as updated_at
    from source
    {% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    where {{ incremental_macro('updated_at') }}
       
    {% endif %}
)
select * from customer