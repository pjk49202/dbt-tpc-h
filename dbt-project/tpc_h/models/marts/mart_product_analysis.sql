{{ config(materialized='table') }}

with part as (
    select * from {{ ref('stg_part') }}
),
lineitem as (
    select * from {{ ref('stg_lineitem') }}
)

select
    p.part_name,
    p.brand,
    p.part_type,
    p.manufacturer,
    p.retail_price,
    count(distinct l.order_key)             as total_orders,
    round(sum(l.quantity), 2)               as total_quantity,
    round(sum(l.gross_price), 2)            as total_revenue,
    round(avg(l.discount), 4)               as avg_discount,
    round(avg(p.retail_price - l.net_price), 2) as avg_markdown

from part p
join lineitem l on l.part_key = p.part_key
group by p.part_name, p.brand, p.part_type, p.manufacturer, p.retail_price
order by total_revenue desc
