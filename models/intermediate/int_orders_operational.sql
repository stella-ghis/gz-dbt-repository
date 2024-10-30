WITH orders_margin AS (
SELECT *
FROM {{ ref("int_orders_margin")}} 

),

raw_ship AS (
    SELECT *
    FROM {{ ref("stg_raw__ship")}} 
)

SELECT orders_id, date_date, SUM (quantity) AS quantity,
    ROUND (SUM (purchase_cost), 2) AS purchase_cost,
    ROUND (SUM (margin), 2) AS margin,
    ROUND (SUM (margin + shipping_fee - logcost - ship_cost), 2) AS Operational_margin,
    ROUND (SUM (total_revenue)) AS total_revenue,
    ROUND (SUM (shipping_fee), 2) AS shipping_fee,
    ROUND (SUM (logcost), 2) AS log_costs
FROM orders_margin
LEFT JOIN raw_ship
USING (orders_id)
GROUP BY orders_id, date_date