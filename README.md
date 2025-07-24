# AWS Data Lake for NYC Taxi Trip Data Analysis

## Overview

This project implements a scalable and serverless data lake solution on Amazon Web Services (AWS) for processing and analyzing NYC Taxi Trip Data. The pipeline covers data ingestion, ETL (Extract, Transform, Load) using AWS Glue, efficient querying with Amazon Athena, and insightful visualization through Amazon QuickSight. This setup provides a robust and cost-effective way to derive business intelligence from large datasets.

### Architecture Overview

The following diagram illustrates the end-to-end data flow within the AWS Data Lake.

![AWS Data Lake Architecture](https://github.com/Ayushs10/AWS_Serverless_datalake/blob/main/AWSDataLake.jpg)

## Getting Started

Follow these steps to set up and deploy the AWS Data Lake for NYC Taxi Trip Data:

1.  **Upload Data to S3**
    * Upload your raw NYC Taxi Trip data files (e.g., CSV, JSON) to an Amazon S3 bucket. This will serve as your raw data landing zone.

2.  **Set Up AWS Glue Crawler For Raw Data**
    * Navigate to the AWS Glue console.
    * Configure a Glue Crawler to scan the S3 location of your raw data.
    * Create a new database in Glue Catalog for your raw data and run the crawler to automatically generate the schema definitions for your raw files.

3.  **Create Glue ETL Job**
    * In AWS Glue Studio, create a new visual ETL job (or write a PySpark script).
    * Develop the Glue job to read the raw data from S3 (using the Glue Catalog table for raw data).
    * Implement transformations to clean, normalize, and enrich the data (e.g., handling missing values, changing data types, joining with lookup tables).
    * The visual editor in Glue Studio allows for a drag-and-drop interface to define these transformations, including custom code, schema changes, and joins.
    * Store the processed (transformed) data in a different S3 prefix (e.g., a "processed" bucket or folder).

   ![Glue ETL Job Flow](https://github.com/Ayushs10/AWS_Serverless_datalake/blob/main/flow.png) 

4.  **Set Up AWS Glue Crawler For Transformed Data**
    * Configure another Glue Crawler to scan the S3 location where your transformed data is stored (the S3 prefix from the previous step).
    * Create a new database or use an existing one in Glue Catalog for your processed data, and run this crawler to generate the optimized schema for your transformed data.

5.  **Query with Athena**
    * Access the Amazon Athena console.
    * Use Athena to run standard SQL queries on the transformed data, leveraging the tables defined in the Glue Catalog by your processed data crawler.
    * Create views for common aggregations or filtered datasets to simplify future analysis and dashboard creation.

6.  **Visualize with QuickSight**
    * Connect Amazon QuickSight to Athena. Choose the Athena database and the tables/views containing your transformed data.
    * Build interactive visual dashboards to explore insights from the NYC Taxi Trip Data, such as trip patterns, popular routes, and flow between boroughs. 

  ![QuickSight Taxi Trips Flow Dashboard](https://github.com/Ayushs10/AWS_Serverless_datalake/blob/main/quicksight.png) 

## ✅ Key Features

* **Serverless Architecture:** All components (S3, Glue, Athena, QuickSight) are fully managed, eliminating the need to provision or manage servers.
* **Automated Schema Detection:** AWS Glue Crawlers automatically discover the schema and partitions of data stored in S3, updating the AWS Glue Data Catalog.
* **SQL-Based Querying:** Leverage standard SQL with Amazon Athena to perform powerful analytical queries directly on data in S3 without loading it into a database.
* **Business Intelligence and Reporting:** Create rich, interactive dashboards and visualizations with Amazon QuickSight for actionable insights.
* **Scalability & Cost-Effectiveness:** Pay-as-you-go services that scale automatically with your data volume and query load.

## 🛠️ Tools & Services Used

* **Amazon S3:** Scalable object storage for raw and processed data.
* **AWS Glue (Crawlers & Jobs):** Serverless ETL service for data transformation and metadata management. 
* **Amazon Athena:** Interactive query service for analyzing data in S3 using SQL.
* **Amazon QuickSight:** Cloud-native business intelligence service for data visualization and dashboards.
* **AWS IAM:** For managing access and permissions across AWS services.


