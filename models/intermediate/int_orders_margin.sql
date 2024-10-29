WITH raw_sales AS (
SELECT *
FROM {{ ref("stg_raw__sales")}} 

),

raw_products AS (
    SELECT *
    FROM {{ ref("stg_raw__product")}} 
)

SELECT orders_id, date_date, SUM (quantity) AS quantity,
    SUM (quantity * purchase_price) AS purchase_cost,
    SUM (ROUND (revenue - (quantity * purchase_price), 2)) AS margin
FROM raw_sales 
LEFT JOIN raw_products 
USING (products_id)
GROUP BY orders_id, date_date

