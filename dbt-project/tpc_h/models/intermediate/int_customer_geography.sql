with geography as (
    select * from {{ ref('int_geography') }}
),
customer as (
    select * from {{ ref('stg_customer') }}
)

select
    g.nation_name,
    g.region_name,
    c.customer_key,
    c.customer_name,
    c.account_balance,
    c.market_segment
from customer c
join geography g on c.nation_key = g.nation_key
