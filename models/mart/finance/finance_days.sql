

SELECT date_date, 
COUNT (orders_id) AS nb_transactions,
ROUND (SUM (total_revenue), 0) AS total_revenue,
ROUND (SUM (total_revenue)/COUNT (orders_id), 2) AS average_basket,
ROUND (SUM (margin), 2) AS margin,
ROUND (SUM (Operational_margin), 2) AS operational_margin,
ROUND (SUM (purchase_cost),2) AS purchase_cost,
ROUND (SUM (shipping_fee), 2) AS shipping_fees,
ROUND (SUM (log_costs), 2) AS log_costs
FROM {{ ref("int_orders_operational")}}
GROUP BY date_date 