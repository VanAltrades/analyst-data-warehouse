SELECT 
  DATE(FORMAT_TIMESTAMP('%Y-%m-%d', timestamp_seconds(t.visitStartTime), 
"America/Chicago")) as date,
  (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT 
MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) as entry_page,
  t.trafficSource.medium, 
  t.trafficSource.isTrueDirect,
  --visits
  count(distinct concat(t.fullvisitorid,t.visitid)) AS visits,
  --transactions
  count(distinct case when h.transaction.transactionId is not null and 
h.transaction.transactionRevenue>0 and h.transaction.transactionRevenue is 
not null then h.transaction.transactionId end) AS transactions,
  --revenue
  ROUND(sum(case when h.transaction.transactionId is not null and 
h.transaction.transactionRevenue>0 and h.transaction.transactionRevenue is 
not null then h.transaction.transactionRevenue end)/1000000,2) AS revenue,
  --pageviews
  COUNT(distinct case when h.type='PAGE' then concat(t.fullvisitorid, 
t.visitid, h.hitnumber) end) as pageviews,
  --bounce rate
  ROUND(safe_divide(count(distinct case when totals.bounces=1 then 
concat(t.fullvisitorid,t.visitid) end),count(distinct 
concat(t.fullvisitorid,t.visitid))),2) as bounce_rate,

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*` t, unnest(hits) h

WHERE   
  (
    _TABLE_SUFFIX BETWEEN  
      -- FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 25 MONTH)) 
      FORMAT_DATE("%Y%m%d", "2016-01-01") AND
      FORMAT_DATE("%Y%m%d", CURRENT_DATE())
  )
  AND totals.visits = 1
  AND (t.trafficSource.medium = 'organic' OR t.trafficSource.medium = 
'surfaces')    
GROUP BY 1,2,3,4
ORDER BY 1 DESC, 5 DESC
