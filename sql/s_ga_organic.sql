-- data sources

-- GA METRICS
with f_ga as (
  SELECT 
  *,
   FROM `e-commerce-demo-v.facts.f_ga_organic`
),
-- GA DIMENSIONS
d_ga as (
  SELECT *
  FROM `e-commerce-demo-v.dimensions.d_ga`
),
-- PDP DIMENSIONS
d_pdp as (
  SELECT *
  FROM `e-commerce-demo-v.dimensions.d_product`
),
-- DATE DIMENSIONS
d_date as (
  SELECT *
  FROM `e-commerce-demo-v.dimensions.d_date`
)

SELECT *
FROM f_ga
  LEFT JOIN d_ga on f_ga.entry_page = d_ga.entry_page_dim
  LEFT JOIN d_pdp on d_ga.product_id = d_pdp.product_id_dim
  LEFT JOIN d_date on f_ga.date = d_date.date_dim
ORDER BY 1 DESC