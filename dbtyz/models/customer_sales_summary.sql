{{ config(materialized='view') }}

/*
    Customer Sales Summary Model:
    汇总 sample_orders 表中每个客户分群的订单数与销售总额，并计算 VIP 等级
*/

with orders as (
    select
        order_id,
        customer_segment,
        sales_amount
    from {{ ref('sample_orders') }}
)

select
    customer_segment,
    count(order_id) as total_orders,
    round(sum(sales_amount), 2) as total_sales,
    case
        when sum(sales_amount) >= 1000 then 'Tier 1'
        else 'Tier 2'
    end as vip_level
from orders
group by customer_segment
