https://medium.com/@vanaltrades/the-analysts-guide-to-data-engineering-2df17e6b6fe8

The Analyst's Guide to Data Engineering

From high-finance to marketing, medical research to the archaeology, analysts around the world are tasked with identifying actionable insights which will inform and lead operations.
With insight reliant upon available data(and the availability of data growing at exponential rates), it is vital that analysts in the 21st century steer clear of the limitations of spreadsheets and learn to master the Data Warehouse prior to settling for readily-available data to analyze. By mastering basic Data Engineering techniques and demonstrating the ability to create a production-ready Data Warehouse, you will level-up your authoritativeness in days while creating a foundation for remarkable insights in the future.
This article (and the associated Github Repository) will explain why understanding data engineering will steer analysts towards a bright future, and show analysts exactly how to create a professional Data Warehouse (within Google Cloud Platform's BigQuery product offering).
Escaping Inefficiencies

Sometimes it feels like an analyst is a master of all trades, and a master of none. Across industries, analysts must play a vital role in bringing order out of chaos.  
On any given workday, an analyst will encounter ad-hoc questions while working towards executing long-term strategies. An inefficient organization will:
Struggle to understand and document data needed to identify and report upon key metrics…
Work in role-based silos that hide or obfuscate critical data and transformations from analytic operators…
Waste time modifying extracting, loading, and transforming data instead of quickly retrieving numbers and answering questions…
Lack a pre-defined and reproducible set of investigations/reports to understand trends and act accordingly…
Become stagnant in technology adoption towards strategic initiatives…
Operate in a workspace that is not ready to modularly scale towards a changing technology landscape.

Should you choose to follow through with this article, you will understand how actively managing your data's environment will pay dividends in your own personal knowledge, while steering your organization away from the inefficiencies listed above.
An Example in E-Commerce

While the many scopes of analysts run wide as the River Styx, I will use an e-commerce analyst as a point of reference for this series of articles.
Whatever your chosen industry, just know that the e-commerce industry runs a gamut of perpetual change and a high degree of variables to understand. With an e-commerce analyst as a frame of reference, I trust you will be able to apply the lessons on display to your field of expertise.
A Matter of Time (Variables in the System)

Before explaining exactly how to setup a data warehouse that will provide a foundation for your organization's analytics, I want to exemplify how you can plan for time-saving, and modular analytics - no matter the question that confronts you.
In following articles, I will explain how you can automate analysis and insight with efficient Python programs designed with extensibility in mind. For the sake of understanding how data warehousing fits into a larger analytic applications, just know that my future articles (and many tech-stacks) are reliant upon a foundational data warehouse.
Ok… you are an analyst. Whether you have the best manager in the world or Porsche-driving Bill Lumbergh, you are tasked with making sense of a variable world. Here is a list of questions you may be asked that could take quite some time to knock-out:
How did {dimension_a} perform last {date_range_a}?
{metric_b} was down last {date_range_b}. what {dimension_b} saw the largest decline so we can improve {dimension_b}?
We updated {pages_c} on {date_c} and expect to see {metric_c} improve by {c%}. did this occur?
Can we add {custom_metric_d} to {data_source_d} to report on this kpi over time?

Notice I haven't named any specific terms between the "{}" characters? This is because an analyst should be a master of systems thinking. To understand the root of the question you are being asked, it will be crucial to understand how any given variable can impact, and inform, an inquery.
If I were to answer these questions with a limited range of information, I would create a spreadsheet, load a small sample of information into the sheet, and conduct analysis. To become an efficient analyst, you should be aware of all the data that exists within your industry, website, fund, or system. With this foundation, analysts are able to understand high-level themes that exist within their data (and data warehouses) and filter this information to answer specific questions.
Analysts are in the game of efficiency, so what seems important to answering these questions? Within the "{}" brackets, I notice that several features stand out: dates, dimensions, and metrics.
By building a production-ready data warehouse, we will define dates, dimensions, and metrics for our system (an e-commerce website in this case) that will allow us to answer these questions and save ourselves time.
A Note on Your Technical Environment

The code/instructions in this article revolves around the following list of technical understanding: 
SQL (a programming language that allows analysts to store, process, and retrieve data from database systems)
Python (a programming language that allows you to interact with data structures… and much more)
Google Cloud Platform (a cloud computing service with features/products that are essential to computation and organization)

SQL and Python are critical to learn for analysts determined to understand and automate data processes in their roles.
Google Cloud Platform is just a cloud service offering, and it can be replaced by a number of offerings ranging from: Amazon Web Services, Microsoft Azure, your Windows/Mac/Linux PC with some extra applications installed.
I chose Google Cloud Platform (GCP) and it's environment in this article because I am familiar with it's setup, it offers a free tier to explore cloud-scaled processing, and the documentation and community is fairly helpful when questions arise.
Setup Your GCP Project

Create a Project
Navigate to the GCP Platform dashboard and create a new project.
A Google Cloud project is required to use Google Workspace APIs and build Google Workspace add-ons or apps.
In this case, we will be using GCP's BigQuery API (a data warehouse application).
Create a GCP ProjectName your project. In this example we are illustrating an e-commerce use-case, but if you are in a financial field, you may name it based on your company… i.e. "BlackRock Data Platform".
Name your GCP ProjectSetup a Service Account
Next you will setup a Service Account. As an analyst, think of a service account as a machine that will do work for you.  You just need to act like a door-man/club bouncer and allow the service account to enter (access) your applications within your GCP project through authentication.
Navigate to Service AccountsCreate a new Service AccountAllow owner level access so your SA can work it's magic. Your organization will likely limit access to certain resources. That's fine, be sure to enable BigQuery (data warehouse offering) access for this service account if questions arise.
Create a new key via JSONDownload and save your JSON file. This is not considered best practice, but this article focuses on actionable change so visualizing this key file and it's contents is beneficial. If your organization has other thoughts, use their information as a learning process, but insist on access to a service account key that will allow you to manage a data warehouse programmatically. There's always time in the future to optimize DevOpsSec. 
Configure BigQuery
Next up, activate BigQuery. 
Navigate to BigQuery's workspaceIn this example I will use a publicly available dataset titled: "Google Analytics Sample". Although you will deal with different data, this sample dataset is a great example to explore and structure dates, dimensions, and metrics that exist across all analyst data.
Note: If you are an e-commerce analyst, make sure you know your organization's point of contact for Google Analytics setup and integration with a database (GA4 is coming!).
Search for public datasetsSelect the Google Analytics public datasetSetup Your BigQuery Data Warehouse

Congratulations on configuring an example dataset. This Google Analytics data is in a raw (unstructured) form. An an analyst you should structure this information in a way that provides meaning to yourself, and vested stakeholders. That's what's up next.
Create a Production-Ready, Flattened (Day-Level) Data Warehouse in Google BigQuery
Estimated time to completion: 2–3 hours with due-diligence
Variables to define before beginning: 
[1] number of data sources 
[2] knowledge of all data/columns needed for reporting 
[3] knowledge of how data/columns will move towards reporting 
[4] familiarity with your data warehouse resource provider
Primary Output: a data warehouse in Google Cloud Platform's BigQuery resource
Secondary Themes: 
[1] star schema 
[2] data naming conventions 
[3] python module configuration 
[4] syntactic interoperability (a term I just now learned) between sql and python
We want to create a data warehouse that will allow us to dynamically report upon business kpis based upon variable requests.
Some common reporting requests that will come up include:
Show me last week's kpis. Compare last week's kpis to the prior 4 week averages and trend the weekly totals over the past 12 months.
Show me last month's revenue vs. the previous month. But wait - last month had 2 national holidays which skew our numbers to look lower. Control for these holidays.

Man! Where to begin here? Don't sweat it dude - we just need to understand the data allowing us to answer these questions and then perform calculations on that data.
These questions are distinct and will require constant time-wasting modification without a thoughtful approach to formatting your data.
It is up to the analyst to understand how to group their data and this article will work to group dates in a thoughtful manner, identify meaningful website dimensions for future groupings, and joining this information together on a flat level that can be aggregated to any request in the future.
Groupings are key!
In this instruction, we will create a thoughtful - production-ready data warehouse that will save you time and effort in reporting on future requests.
Star Schema and Structuring a Data Warehouse for Extensible Use
Star Schema is an industry-standard model for storing data. Read more on it to improve your knowledge, but to save time… an analyst should have a factual table with dates, dimensions, and metrics over time that can be merged to custom dimension tables which provide details and features to pair with your fact table.
In this e-commerce analyst example, we have stored our Google Analytics website traffic table already. So that can act as our facts table. But there are features we can define within out data warehouse that help us to group and inform on the data. These will be dimensions tables.
We should create dimension tables that group by dates (so that we can aggregate our fact table by week, month, etc.) and dimensions (so that we can aggregate our fact table by informative groupings like pagetypes, product offerings, brands, and more).
 - Jack VanAltrades (master of some)