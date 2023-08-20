SELECT 
  DISTINCT (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT 
MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) as entry_page_dim,

--   (select page.pagePathLevel1 from unnest(hits) WHERE hitnumber = (SELECT 
-- MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) as p1,

--   (select page.pagePathLevel2 from unnest(hits) WHERE hitnumber = (SELECT 
-- MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) as p2,

--   (select page.pagePathLevel3 from unnest(hits) WHERE hitnumber = (SELECT 
-- MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) as p3,

--   (select page.pagePathLevel4 from unnest(hits) WHERE hitnumber = (SELECT 
-- MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) as p4,

CASE 
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%store-policies%" then "policy_page"
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%brand%" then "brand_page"
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" then "product_page"
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign%" then "category_page"
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/basket%" then "basket_page"
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/signin%" then "sign_in_page"
    WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/home%" then "home_page"
ELSE "other"
END as pagetype,

CASE 
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/lifestyle%" then "lifestyle"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/apparel%" then "apparel"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/bags%" then "bags"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/drinkware%" then "drinkware"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/electronics%" then "electronics"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/office%" then "office"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/accessories%" then "accessories"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/eco%" then "eco"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%.axd%" then "other"
  ELSE null
END as product_type,

CASE 
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/lifestyle%" then "lifestyle"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/apparel%" then "apparel"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/bags%" then "bags"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/drinkware%" then "drinkware"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/electronics%" then "electronics"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/office%" then "office"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/accessories%" then "accessories"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/eco%" then "eco"
  WHEN (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) not like "%.axd%" and (select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')) like "%/google+redesign/" then "other"
  ELSE null
END as category_type,

CASE 
  WHEN 
  -- last 4 characters are the '.axd' product suffix
  right((select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')),4) = ".axd" 
  THEN
  -- extract the text between '/' and '.axd' to act as a proxy product id
  SPLIT(ARRAY_REVERSE(SPLIT((select concat(page.hostname,page.pagePath) from unnest(hits) WHERE hitnumber = (SELECT MIN(hitnumber) FROM UNNEST(hits) WHERE type = 'PAGE')), "/"))[OFFSET(0)],".axd")[OFFSET(0)]
  ELSE null 
END as product_id



FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*` t, unnest(hits) h

WHERE   
  (
    _TABLE_SUFFIX BETWEEN  
      -- FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 25 MONTH)) 
      FORMAT_DATE("%Y%m%d", "2016-01-01") AND
      FORMAT_DATE("%Y%m%d", CURRENT_DATE())
  )
  AND totals.visits = 1
    
GROUP BY 1,2,3,4,5
ORDER BY 1 DESC