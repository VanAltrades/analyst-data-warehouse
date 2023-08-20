with daily as (
  SELECT 
    DATE(FORMAT_DATE('%Y-%m-%d', Date)) as date_dim,
    DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), WEEK) as 
date_week,
    DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), MONTH) as 
date_month,
    DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), QUARTER) as 
date_quarter,
    DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), YEAR) as 
date_year,
    
    EXTRACT(DAYOFWEEK FROM Date) AS dayofweek,

    sum(CASE WHEN BusinessDay = true then 1 else 0 end) as bizdays,

  FROM `e-commerce-demo-v.raw.dimDateBusinessDays` 
  WHERE DATE(Date) <= current_date()
  GROUP BY 1,2,3,4,5,6
  ORDER BY 1 DESC
),
weekly as (
  SELECT 
  DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), WEEK) as date_week,
  sum(CASE WHEN BusinessDay = true then 1 else 0 end) as bizdays_week
  FROM `e-commerce-demo-v.raw.dimDateBusinessDays` 
  WHERE DATE(Date) <= current_date()
  GROUP BY 1
),
monthly as (
  SELECT 
  DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), MONTH) as 
date_month,
  sum(CASE WHEN BusinessDay = true then 1 else 0 end) as bizdays_month
  FROM `e-commerce-demo-v.raw.dimDateBusinessDays` 
  WHERE DATE(Date) <= current_date()
  GROUP BY 1
),
quarterly as (
  SELECT 
  DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), QUARTER) as 
date_quarter,
  sum(CASE WHEN BusinessDay = true then 1 else 0 end) as bizdays_quarter
  FROM `e-commerce-demo-v.raw.dimDateBusinessDays` 
  WHERE DATE(Date) <= current_date()
  GROUP BY 1
),
yearly as (
  SELECT 
  DATE_TRUNC(DATE(FORMAT_DATE('%Y-%m-%d', Date)), YEAR) as date_year,
  sum(CASE WHEN BusinessDay = true then 1 else 0 end) as bizdays_year
  FROM `e-commerce-demo-v.raw.dimDateBusinessDays` 
  WHERE DATE(Date) <= current_date()
  GROUP BY 1
)
SELECT 
daily.date_dim,
daily.bizdays,
daily.dayofweek,

daily.date_week,
weekly.bizdays_week,

daily.date_month,
monthly.bizdays_month,

daily.date_quarter,
quarterly.bizdays_quarter,

daily.date_year,
yearly.bizdays_year

FROM daily
  LEFT JOIN weekly on daily.date_week = weekly.date_week
  LEFT JOIN monthly on daily.date_month = monthly.date_month
  LEFT JOIN quarterly on daily.date_quarter = quarterly.date_quarter
  LEFT JOIN yearly on daily.date_year = yearly.date_year
order by 1 desc