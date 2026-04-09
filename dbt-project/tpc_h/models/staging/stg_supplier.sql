with source as (
    select * from {{ source('tpc_h', 'supplier') }}
)
select
    s_suppkey       as supplier_key,
    s_name          as supplier_name,
    s_nationkey     as nation_key,
    s_acctbal       as account_balance
from source
