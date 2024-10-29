
SELECT orders_id, date_date, SUM (quantity) AS quantity,
    SUM (quantity * purchase_price) AS purchase_cost,
    SUM (ROUND (revenue - (quantity * purchase_price), 2)) AS margin
FROM  {{ ref("int_sales_margin")}}
GROUP BY orders_id, date_date

