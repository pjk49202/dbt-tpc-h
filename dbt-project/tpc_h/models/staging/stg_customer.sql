with source as (
    select * from {{ source('tpc_h', 'customer') }}
)
select
    c_custkey       as customer_key,
    c_name          as customer_name,
    c_nationkey     as nation_key,
    c_acctbal       as account_balance,
    c_mktsegment    as market_segment
from source
