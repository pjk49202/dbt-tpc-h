{{ config(materialized='table') }}

with supp_geography as (
    select * from {{ ref('int_supplier_geography') }}
),
partsupp as (
    select * from {{ ref('stg_partsupp') }}
),
lineitem as (
    select * from {{ ref('stg_lineitem') }}
)

select
    g.region_name,
    g.nation_name,
    g.supplier_name,
    g.supplier_key,
    count(distinct l.order_key)                     as total_orders,
    round(sum(l.quantity), 2)                       as total_quantity,
    round(sum(l.quantity * l.gross_price), 2)       as total_revenue,
    round(avg(p.supply_cost), 2)                    as avg_supply_cost,
    round(avg(l.discount), 4)                       as avg_discount

from supp_geography g
join partsupp p on p.supplier_key = g.supplier_key
join lineitem l on l.supplier_key = g.supplier_key
group by g.region_name, g.nation_name, g.supplier_name, g.supplier_key
order by total_revenue desc
