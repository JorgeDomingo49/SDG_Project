--Muestra informacion completa del proveedor
with part as (
    select * from {{ ref('part') }}
),

suppliers as (
    select * from {{ ref('supplier') }}
),

partsupp as (
    select * from {{ ref('partsupp') }}
),

lineitem as (
    select * from {{ ref('lineitem') }}
),
intermediate_supplier as (
    select
        suppliers.name as suppliername,
        suppliers.address as supplieradress,
        suppliers.phone as supplierphone,
        part.name as partname,
        part.brand as partbrand,
        part.type as parttype,
        part.size as partsize,
        partsupp.availqty as availqty,
        partsupp.supplycost as supplycost,
        lineitem.orderkey as orderkey
    from suppliers
    left join partsupp on partsupp.suppkey=suppliers.suppkey
    left join part on part.partkey=partsupp.partkey
    left join lineitem on partsupp.partkey=lineitem.partkey
)
select * from intermediate_supplier