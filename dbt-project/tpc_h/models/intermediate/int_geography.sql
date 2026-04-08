with regions as (
    select * from {{ ref('stg_region') }}
),
nations as (
    select * from {{ ref('stg_nation') }}
)
select
    n.nation_key,
    n.nation_name,
    r.region_key,
    r.region_name
from nations n
join regions r on n.region_key = r.region_key
