with source as (
    select * from {{ source('tpc_h', 'nation') }}
)
select
    n_nationkey     as nation_key,
    n_regionkey     as region_key,
    n_name          as nation_name
from source
