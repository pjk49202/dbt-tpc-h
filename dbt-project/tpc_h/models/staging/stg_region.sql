with source as (
    select * from {{ source('tpc_h', 'region') }}
)
select
    r_regionkey     as region_key,
    r_name          as region_name
from source
