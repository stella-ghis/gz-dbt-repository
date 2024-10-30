 SELECT date_date, paid_source, campaign_key, campaign_name, 
 SUM (ads_cost) AS ads_cost, 
 SUM (impression) AS impression, 
 SUM (click) AS click
 FROM {{ref('int_campaigns')}}
 GROUP BY date_date, paid_source, campaign_key, campaign_name
 ORDER BY date_date DESC
