WITH raw_sales AS (
SELECT *
FROM {{ ref("stg_raw__sales")}} 
),

raw_products AS (
    SELECT *
    FROM {{ ref("stg_raw__product")}} 
)

SELECT date_date, orders_id, raw_sales.products_id, revenue, quantity, purchase_price,
    quantity * purchase_price AS purchase_cost,
    ROUND (revenue - (quantity * purchase_price), 2) AS margin
FROM raw_sales 
LEFT JOIN raw_products 
USING (products_id)

