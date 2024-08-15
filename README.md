# Tokyo Olympics Data Analysis | Azure Data Engineering Project

This project is an end-to-end data engineering solution designed to analyze the 2020 Tokyo Olympics data using Microsoft's Azure cloud services. The project was created to explore and demonstrate the integration of various Azure services for data engineering tasks.

The primary goal of this project was to build a scalable and efficient data pipeline that could handle the ingestion, transformation, and analysis of large datasets.

The data pipeline begins by sourcing raw data from a GitHub repository using HTTP requests, which is then ingested into Azure Data Lake Storage Gen 2 via Azure Data Factory. The raw data is transformed and processed using Azure Databricks, leveraging its powerful Spark engine to handle large-scale data processing tasks using PySpark. Once transformed, the data is stored back in Azure Data Lake, ready for further analysis.

Azure Synapse Analytics is then used to query and analyze the transformed data, and the insights are visualized in an interactive Power BI dashboard. The final dashboard provides a comprehensive overview of key metrics from the Tokyo Olympics, such as medal counts, gender distribution, and event-specific statistics across different countries.


### Table of Contents

- [1. Project Title and Description](#tokyo-olympics-data-analysis--azure-data-engineering-project)
- [2. Table of Contents](#table-of-contents)
- [3. Architecture Overview](#project-architecture)
- [4. Data Pipeline Workflow](#4-data-pipeline-workflow)
- [5. Tools and Technologies Used](#5-tools-and-technologies-used)
- [6. Setup and Deployment](#6-setup-and-deployment)
- [7. Dashboard and Analysis](#7-dashboard-and-analysis)
- [8. Future Enhancements](#8-future-enhancements)
- [9. Conclusion](#9-conclusion)
- [10. References](#10-references)




## Project Architecture
![Project Architecture](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Project%20Architecture%20Tokyo%20Olympic%20Data%20Analytics.jpg)

## Dataset

**Data used in this Project :** https://github.com/MJshah001/Tokyo_Olympics-Azure/tree/main/data

**Original Data Source :** https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo


## Data Ingestion : Azure Data Factory
![Data Ingestion](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Ingestion/Data%20Factory%20Pipeline.png)

Data Factory Input pipeline JSON : [DataFactoryInputPipeline.json](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Ingestion/dataFactoryinputpipeline.json)

## Raw Data Store : Azure Data Lake Gen 2
![Raw Data Store](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Store/DataLake%20Raw%20Data%20SS.png)


## Data Transformation : Azure Databricks 
![Data Transformation](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Transformation/Data%20Bricks%20Notebook%20SS1.png)

Ipynb : [Tokyo Olympic Data Transformation.ipynb](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Transformation/Tokyo%20Olympic%20Data%20Transformation.ipynb)

Html : [Tokyo Olympic Data Transformation.html](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Transformation/Tokyo%20Olympic%20Data%20Transformation.html)


## Transformed Data Store : Azure Data Lake Gen 2
![Raw Data Store](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Data%20Store/DataLake%20Transformed%20Data%20SS.png)

## Primary Analytics : Azure Synapse Analytics
![Azure Synapse Analytics Database ](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Synapse%20Analytics/Azure%20Synapse%20Analytics%20Database%20Model%20SS.png)
![Azure Synapse Analytics Sql ](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Synapse%20Analytics/Azure%20Synapse%20Analytics%20SQL%20Queries%20SS.png)

Tokyo Olympics SQL file : [TokyoOlympicsInsights.sql](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Synapse%20Analytics/TokyoOlympicsInsights.sql)

## Dashboarding : Power BI
![Power BI](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Dashboarding%20BI/Power%20Bi%20Desktop%20Report%20View%20SS.png)

PBIX link : [Tokyo Olympic Data Analysis Report.pbix](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Dashboarding%20BI/Tokyo%20Olympic%20Data%20Analysis%20Report.pbix)

PDF link : [Tokyo Olympic Medals Report.pdf](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Dashboarding%20BI/Tokyo%20Olympic%20Medals%20Report.pdf)

Link to Dashboard Resources (PPT, Background Image, Icons,...) : [Resources](https://github.com/MJshah001/Tokyo_Olympics-Azure/tree/main/Resources/Dashboarding%20BI/Power%20BI%20Resources)

Special Thanks to [Federico Pastor](https://www.linkedin.com/in/federico-pastor/?originalSubdomain=uk) for providing such Awsome design Ideas.

![Final Report](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Dashboarding%20BI/Tokyo%20Olympic%20Medals%20Report.png)






