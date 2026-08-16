{{ config(materialized='table') }}

/*
    Sample fixed dataset: 50 rows, 5 columns
    1. order_id: 订单ID (1001 ~ 1050)
    2. order_date: 订单日期 (2026-01-01 ~ 2026-02-19)
    3. customer_segment: 客户分群 (Enterprise / Consumer / SMB / Strategic)
    4. product_category: 产品类别 (Cloud Services / Software / Analytics / Consulting / Hardware)
    5. sales_amount: 销售金额 (固定数值计算)
*/

with numbers as (
    select range as id
    from range(1, 51)
),

sample_dataset as (
    select
        1000 + id as order_id,
        date '2026-01-01' + cast((id - 1) as integer) as order_date,
        case (id % 4)
            when 0 then 'Enterprise'
            when 1 then 'Consumer'
            when 2 then 'SMB'
            else 'Strategic'
        end as customer_segment,
        case (id % 5)
            when 0 then 'Hardware'
            when 1 then 'Cloud Services'
            when 2 then 'Software'
            when 3 then 'Analytics'
            else 'Consulting'
        end as product_category,
        round(150.0 + cast((id * 47) % 1850 as double) + cast((id * 3) % 100 as double) / 100, 2) as sales_amount
    from numbers
)

select
    order_id,
    order_date,
    customer_segment,
    product_category,
    sales_amount
from sample_dataset
