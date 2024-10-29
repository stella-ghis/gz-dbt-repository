WITH margin AS (
SELECT *
FROM {{ ref("int_orders_margin")}} 

),

raw_ship AS (
    SELECT *
    FROM {{ ref("stg_raw__ship")}} 
)

SELECT orders_id, date_date, SUM (quantity) AS quantity,
    SUM (purchase_cost) AS purchase_cost,
    SUM (margin) AS margin
FROM margin
LEFT JOIN raw_ship
USING (orders_id)
GROUP BY orders_id, date_date