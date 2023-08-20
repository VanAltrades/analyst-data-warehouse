# Data Warehousing as an Analyst

## Description

This repositoy contains documentation and simple python scripts that will explain how you can deploy a high-end data warehouse in Google BigQuery that will improve your organization's infrastructure and reporting.

This repository uses Google's BigQuery resource, but the theories explained apply to any Cloud infrastructure you may use (Azure, AWS, etc).

This repository uses publicly available website data provided by Google. While the data is most relevant to an E-Commerce industry, concepts like fact vs. dimension tables will apply to any industry ranging from Finance to Aeronautics. 

## Why Understand Data Warehousing as an Analyst?

On any given workday, an analyst will encounter ad-hoc questions while working towards executing long-term strategies. An inefficient organization will: 

(1) Struggle to understand and document data needed to identify and report upon key metrics... 

(2) Work in role-based silos that hide or obfiscate critical data and transformations from analytic operators... 

(3) Waste time modifying extracting, loading, and transforming data instead of quickly retrieving numbers and answering questions...

(3) Lack a pre-defined and reproducible set of investigations/reports to understand trends and act accordingly...

(4) Become stagnant in technology adoption towards strategic initiatives...

(5) Operate in a workspace that is not ready to modularly scale towards a changing technology landscape.

By building a data warehouse to store your data in an ideal and agreed upon schema/format, you will take the first step in optimizing your workday. With a well-build data infrastructure, you will be able to integrate it's information in to forward-looking applications and projects.

## Topics Covered

1. Setup GCP Project

> docs\Setup GCP Project\gcp-project.md

Since you may use a different cloud platform, this documentation briefly and visually covers how to setup a Google Cloud Project with resources you will use later.

2. Setup GCP Data Warehouse

> docs\Setup GCP Data Warehouse\star-schema-data-warehouse.md

Detailed overview on data warehousing practices and visual examples on how to setup one for yourself.

Included are basic Python scripts to create tables in Google BigQuery. If you are new to programming, they are simple scripts you can understand by following along in the documentation.

> src\data_table_business_day_date\create_table.py

> src\data_table_product_dimensions\main.py

Another important aspect of a data warehouse is the SQL used to populate tables and join fact/dimension tables into summary tables.

The `/sql` folder contains scripts used in the documentation. These SQL scripts can be a helpful reference for Google click stream analytics queries.