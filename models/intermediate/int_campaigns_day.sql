 SELECT date_date, paid_source, campaign_key, campaign_name, ads_cost, impression, click
 FROM {{ref('int_campaigns')}}
 ORDER BY date_date DESC
