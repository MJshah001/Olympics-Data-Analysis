# Tokyo Olympics Data Analysis | Azure Data Engineering Project


## 1. Project Overview and Description

This project is an end-to-end data engineering solution designed to analyze the 2020 Tokyo Olympics data using Microsoft's Azure cloud services. The project was created to explore and demonstrate the integration of various Azure services for data engineering tasks.

The primary goal of this project was to build a scalable and efficient data pipeline that could handle the ingestion, transformation, and analysis of large datasets. The data pipeline begins by sourcing raw data from a GitHub repository using HTTP requests, which is then ingested into Azure Data Lake Storage Gen 2 via Azure Data Factory. 

The raw data is transformed and processed using Azure Databricks, leveraging its powerful Spark engine to handle large-scale data processing tasks using PySpark. Once transformed, the data is stored back in Azure Data Lake, ready for further analysis.

Azure Synapse Analytics is then used to query and analyze the transformed data, and the insights are visualized in an interactive Power BI dashboard. The final dashboard provides a comprehensive overview of key metrics from the Tokyo Olympics, such as medal counts, gender distribution, and event-specific statistics across different countries.


## 2. Table of Contents

- [1. Project Title and Description](#1-project-overview-and-description)
- [2. Table of Contents](#2-table-of-contents)
- [3. Architecture Overview](#3-project-architecture)
- [4. Setup and Prerequisites](#4-setup-and-prerequisites)
- [5. Tools and Technologies Used](#5-tools-and-technologies-used)
- [6. Setup and Deployment](#6-setup-and-deployment)
- [7. Dashboard and Analysis](#7-dashboard-and-analysis)
- [8. Future Enhancements](#8-future-enhancements)
- [9. Conclusion](#9-conclusion)
- [10. References](#10-references)




## 3. Project Architecture
![Project Architecture](https://github.com/MJshah001/Tokyo_Olympics-Azure/blob/main/Resources/Project%20Architecture%20Tokyo%20Olympic%20Data%20Analytics.jpg)


#### Components

- **Data Source**:  
  The raw data is sourced from a public GitHub repository using HTTP requests. The dataset contains comprehensive details about the Tokyo 2020 Olympics, including athlete performance, medal counts, and event-specific statistics.

- **Data Ingestion**:  
  Azure Data Factory is used to ingest data from the GitHub repository into Azure Data Lake Storage Gen 2. Data Factory orchestrates the data flow, ensuring that the data is securely transferred and stored in its raw form for further processing.

- **Transformation**:  
  The raw data is transformed and processed using Azure Databricks. Databricks leverages Apache Spark’s distributed computing capabilities, along with PySpark, to perform large-scale data transformations, cleaning, and aggregation. The transformed data is then stored back in Azure Data Lake Storage Gen 2.

- **Analytics**:  
  Azure Synapse Analytics is utilized for querying and analyzing the transformed data. Synapse allows for the execution of complex SQL queries to generate insights from the data, which are critical for the subsequent visualization stage.

- **Dashboard**:  
  The insights generated from Azure Synapse Analytics are visualized using Power BI. The Power BI dashboard provides an interactive and comprehensive view of the key metrics, including medal distributions, gender participation, and event-specific performance across different countries.



## 4. Setup and Prerequisites

This section outlines the essential prerequisites and setup steps required to replicate the Tokyo Olympics Data Analysis project. It covers the necessary Azure services, tools, and configurations to ensure a smooth setup process.

#### 1. **Azure Account**
   - **Create an Azure Account**:  
     To begin, you'll need an active Microsoft Azure account. If you don't have one, you can sign up for a free account [here](https://azure.microsoft.com/en-us/free/). The free account provides sufficient credits to get started with most Azure services used in this project.
   - **Subscription**:  
     Ensure your Azure account is linked to a valid subscription. This project can work with free subscription provided for first 30 days trial period or requires you to have at least a Pay-As-You-Go subscription or higher after 30 days free trial.

#### 2. **Azure Services**
   The following Azure services are essential for this project:

   - **Azure Data Factory**:
     - **Purpose**: Used for data ingestion and orchestration.
     - **Setup**: Create a new Data Factory instance in your preferred Azure region. Configure a pipeline to connect to the data source (HTTP) and set up linked services for Azure Data Lake Storage.

   - **Azure Data Lake Storage Gen 2**:
     - **Purpose**: Serves as the primary storage for both raw and transformed data.
     - **Setup**: Create a Data Lake Storage Gen 2 account and set up containers for raw and processed data. Ensure that the storage account is accessible by the Data Factory and Databricks instances.

   - **Azure Databricks**:
     - **Purpose**: Used for data transformation and processing using PySpark.
     - **Setup**: Set up an Azure Databricks workspace. Within the workspace, create a cluster configured with sufficient resources (e.g., Standard_D3_v2 instances) to handle the data processing tasks. **Use Azure Key Vault for securely managing and accessing sensitive information like application IDs and keys. Azure Key Vault secrets can be accessed in Databricks using the `dbutils.secrets.get` method.**

   - **Azure Synapse Analytics**:
     - **Purpose**: Used for querying and analyzing the transformed data.
     - **Setup**: Create an Azure Synapse workspace. Configure the workspace to connect with your Data Lake Storage account for querying the transformed datasets.

   - **Power BI**:
     - **Purpose**: Used to create and share interactive dashboards.
     - **Setup**: Install Power BI Desktop on your local machine (available for download [here](https://powerbi.microsoft.com/desktop/)). Sign in with your Azure credentials and connect to Azure Synapse Analytics to import the data for visualization.

#### 3. **Development Environment**
   - **IDE**: A code editor such as Visual Studio Code or Jupyter Notebook is recommended for working with PySpark in Databricks.
   - **Python Environment**: Ensure you have Python installed, preferably version 3.7 or later. Install necessary libraries (`pyspark`, `pandas`, `azure-storage-blob`, etc.) in your local environment if you plan to run tests outside of Databricks.

#### 4. **Configurations and Access**
   - **Azure Key Vault Integration**:  
     - **Purpose**: Azure Key Vault is used to securely store and manage sensitive information like application IDs, directory IDs, and secret keys. This ensures that your credentials are protected and can be easily accessed across services.
     - **Setup**: Set up a Key Vault in Azure and add the necessary secrets. Then, create a Key Vault scope in Databricks and use the `dbutils.secrets.get` method to access these secrets in your notebooks.
     - **Example**:
       ```python
       secret_application_id = dbutils.secrets.get(scope="key-vault-scope", key="tokyo-olympic-application-id")
       secret_directory_id = dbutils.secrets.get(scope="key-vault-scope", key="tokyo-olympic-directory-id")
       secret_secret_key = dbutils.secrets.get(scope="key-vault-scope", key="tokyo-olympics-secret-key")
       ```
   - **Service Connections**: Ensure that all services (Data Factory, Databricks, Synapse) have the necessary permissions to access the Data Lake Storage account. This can be managed via Azure’s Role-Based Access Control (RBAC).

#### 5. **Data Source**
   - **GitHub Repository**:  
     The raw data for this project is stored in a public GitHub repository. You’ll need to clone the repository or directly connect to it using Azure Data Factory for ingestion. Here is the repository link: [Tokyo Olympics Data](#).



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






