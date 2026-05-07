{{ config(materialized='table') }}

with orders as (
    select * from {{ ref('stg_orders') }}
),
geography as (
    select * from {{ ref('int_customer_geography') }}
)

select
    o.order_key,
    o.customer_key,
    o.order_status,
    o.total_price,
    o.order_date,
    o.order_priority,
    o.ship_priority,
    g.customer_name,
    g.market_segment,
    g.nation_name,
    g.region_name,
    g.account_balance
from orders o
join geography g on o.customer_key = g.customer_key
