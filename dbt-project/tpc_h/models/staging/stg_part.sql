with source as (
    select * from {{ source('tpc_h', 'part') }}
)
select
    p_partkey       as part_key,
    p_name          as part_name,
    p_mfgr          as manufacturer,
    p_brand         as brand,
    p_type          as part_type,
    p_size          as part_size,
    p_retailprice   as retail_price
from source
