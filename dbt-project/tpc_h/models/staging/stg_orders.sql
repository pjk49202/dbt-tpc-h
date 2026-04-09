with source as (
    select * from {{ source('tpc_h', 'orders') }}
)
select
    o_orderkey      as order_key,
    o_custkey       as customer_key,
    o_orderstatus   as order_status,
    o_totalprice    as total_price,
    o_orderdate     as order_date,
    o_orderpriority as order_priority,
    o_shippriority  as ship_priority
from source
