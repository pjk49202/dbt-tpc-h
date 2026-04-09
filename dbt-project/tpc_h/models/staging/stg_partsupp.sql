with source as (
    select * from {{ source('tpc_h', 'partsupp') }}
)
select
    ps_partkey      as part_key,
    ps_suppkey      as supplier_key,
    ps_availqty     as available_quantity,
    ps_supplycost   as supply_cost
from source
