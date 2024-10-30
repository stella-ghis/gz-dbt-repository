SELECT date_date,
ROUND (SUM (operational_margin - ads_cost), 2) AS ads_margin,
ROUND (SUM (average_basket), 2) AS average_basket,
ROUND (SUM (operational_margin), 2) AS operational_margin,
SUM (ads_cost) AS ads_cost,
SUM (impression) AS impression,
SUM (click) AS click,
SUM (total_revenue) AS revenue,
ROUND (SUM (purchase_cost),2) AS purchase_cost,
ROUND (SUM (margin), 2) AS margin,
ROUND (SUM (shipping_fees), 2) AS shipping_fee,
ROUND (SUM (log_costs), 2) AS logcost,
 FROM {{ref('int_campaigns_day')}}
FULL OUTER JOIN {{ref('finance_days')}}
USING (date_date)
GROUP BY date_date
ORDER BY date_date DESC