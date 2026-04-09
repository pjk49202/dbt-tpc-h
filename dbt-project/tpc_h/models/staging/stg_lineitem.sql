with source as (
    select * from {{ source('tpc_h', 'lineitem') }}
)
select
    l_orderkey                                                          as order_key,
    l_partkey                                                           as part_key,
    l_suppkey                                                           as supplier_key,
    l_linenumber                                                        as line_number,
    l_quantity                                                          as quantity,
    l_extendedprice                                                     as extended_price,
    l_discount                                                          as discount,
    l_tax                                                               as tax,
    l_returnflag                                                        as return_flag,
    l_linestatus                                                        as line_status,
    l_shipdate                                                          as ship_date,
    l_commitdate                                                        as commit_date,
    l_receiptdate                                                       as receipt_date,
    l_shipmode                                                          as ship_mode,
    -- derived columns
    round(l_extendedprice * (1 - l_discount), 2)                       as net_price,
    round(l_extendedprice * (1 - l_discount) * (1 + l_tax), 2)        as gross_price
from source
