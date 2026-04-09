with geography as (
    select * from {{ ref('int_geography') }}
),
supplier as (
    select * from {{ ref('stg_supplier') }}
)

select
    s.supplier_name,
    s.supplier_key,
	s.account_balance,
	s.nation_key,
	g.nation_name,
	g.region_name
from supplier s
join geography g on s.nation_key = g.nation_key
