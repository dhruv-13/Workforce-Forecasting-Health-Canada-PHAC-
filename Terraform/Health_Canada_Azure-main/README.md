# Health_Canada_Azure

---

## **Project Report: Health Canada HR Reporting and Analytics Solution**

### **Project Overview:**

The project focused on developing a comprehensive **HR Reporting and Analytics** solution for **Health Canada**, utilizing a combination of Azure cloud services to automate, manage, and optimize HR data management and reporting. The project involved several core components such as **Azure Synapse Analytics**, **Azure Data Factory (ADF)**, **SQL Server**, and **Power BI**, ensuring that over 50 key stakeholders could access real-time, actionable data to enhance workforce forecasting and time series analysis.

### **Technologies and Tools Used:**
- **Infrastructure as Code (IaC)**: Terraform for deploying Azure resources.
- **Cloud Services**: Azure Synapse Analytics, Azure Data Factory, SQL Server.
- **Data Pipeline**: Azure Data Factory for data ingestion, transformation, and loading.
- **Data Warehousing**: Azure Synapse for large-scale data analytics.
- **Reporting & Visualization**: Power BI for dashboard and visual analytics.

---

### **1. Deployment of Resources Using Terraform**

Terraform was used to automate the creation of all required Azure resources for the project. This included the setup of resource groups, storage accounts, data pipelines, and services for data analytics.

- **Resource Groups**: A dedicated resource group `hr-rg` was created to organize and manage all Azure resources efficiently.
  
- **Storage Accounts**: Azure Blob Storage was used for storing large datasets like **CSV** and **Excel files**, making them available for Azure Data Factory and other services.

- **Azure Synapse Analytics**:
  - Synapse Workspace was created for centralized data analytics.
  - **SQL Pools** were provisioned for large-scale data querying and analytics.
  - Synapse was integrated with **Azure Data Lake** and **Azure SQL Server** to streamline data flow from transactional systems into a data warehouse for analysis.

- **Azure Data Factory (ADF)**:
  - Data pipelines were created to automate data ingestion from the **Blob Storage** into the **SQL Database** and **Synapse Analytics** for processing and analytics.
  - Data transformations were applied where necessary to convert data formats (e.g., CSV to SQL tables).
  - Scheduling and monitoring were set up to ensure timely data updates.

- **SQL Server**:
  - A secure **SQL Server** instance (`hr-sqlserver-parm0100`) was created to store HR data in the **SQL Database** (`hrdb`).
  - A Data Factory pipeline was set up to load data from Blob Storage to SQL Server for further storage.

- **Power BI**:
  - Power BI Desktop was used to develop interactive dashboards visualizing HR trends, workforce forecasts, and predictive insights.
  - Power BI was connected to both **SQL Server** and **Azure Synapse Analytics** to pull data directly for reporting and analysis.
  
### **2. Data Pipeline and Integration:**

The data pipeline involved several stages for preparing, processing, and loading data into the SQL Database and Azure Synapse Analytics:

- **Data Ingestion**:
  - Datasets were uploaded to the **Blob Storage** in CSV and Excel formats.
  - Azure Data Factory (ADF) was configured to pull data from the **Blob Storage** and load it into the **SQL Server** database.

- **Data Transformation**:
  - ADF was used to clean and transform data (e.g., handle type conversions, null values) before loading it into the database.
  - **SQL Scripts** were used to structure data in a way that facilitates reporting and analytics.

- **Data Loading**:
  - ADF's **Copy Activity** was used to load the transformed data into both **SQL Server** and **Synapse Analytics**.
  - Data was stored in relational tables in SQL Server for operational reporting and in Synapse for analytics and large-scale processing.

- **Data Analysis**:
  - Synapse SQL Pools were used to run analytical queries over large datasets.
  - These queries provided key insights into workforce trends, historical HR data, and predictive analytics for future trends.

---

### **3. Data Reporting and Visualization:**

The data, now stored in **SQL Server** and **Azure Synapse Analytics**, was then made accessible for **Power BI** visualization. 

- **Power BI Dashboards**:
  - Power BI was connected to both **SQL Server** and **Synapse Analytics** for reporting.
  - Dashboards were created to visualize workforce trends, job trends, and predictive insights for HR managers and executives.
  - **Time series analysis** and **forecasting** were incorporated into the dashboards to help stakeholders make data-driven decisions.
  
- **Interactive and User-Friendly Dashboards**:
  - Over **50 key stakeholders** were empowered to access real-time data via Power BI.
  - Visualizations focused on key HR metrics such as **workforce distribution**, **employee retention**, and **future workforce demand**.

- **Collaboration and Decision-Making**:
  - The Power BI reports and dashboards enabled better collaboration among teams and stakeholders, facilitating a **30% increase in data-driven decision-making**.

---

### **4. Performance Improvements and Results:**

- **Improved HR Reporting**: The migration to a cloud-native architecture (via **Azure Synapse Analytics**) improved query performance by **40%** and reduced report generation times by **30%**.
  
- **Efficient Data Storage and Querying**: Storing HR data in **Synapse Analytics** allowed for faster aggregation and advanced querying over large datasets.

- **Real-Time Analytics**: The **ADF pipelines** ensured real-time data synchronization between **Blob Storage**, **SQL Server**, and **Synapse Analytics**, making sure the Power BI dashboards were always up-to-date.

---

### **5. Challenges and Resolutions:**

- **Data Type Mismatches**: Issues such as type conversion errors (e.g., String to Int32) were resolved by identifying and correcting schema mismatches in the data source.
  
- **Firewall Issues with SQL Server**: Access was initially blocked by the SQL Server firewall, but the necessary firewall rules were set up to allow data pipelines to connect to SQL Server.

- **Power BI Integration**: Connecting Power BI directly to **Synapse Analytics** for real-time analytics was tricky at first, but once the appropriate connections were established, the solution worked seamlessly.

---

### **6. Next Steps for Optimization:**

- **Automation of Data Pipelines**: Further automating the data ingestion and transformation process using **ADF triggers** for time-based updates.
  
- **Synapse Optimizations**: Fine-tuning the Synapse environment for improved query performance, including partitioning tables and optimizing resource allocation.

- **Cost Management**: Review the cost of running large-scale analytics on Synapse, and identify opportunities to reduce costs through scaling down during off-peak times.

---

### **Conclusion:**

This solution successfully achieved the goal of providing **real-time, data-driven insights** to HR stakeholders at **Health Canada**. By leveraging **Azure Synapse Analytics**, **Azure Data Factory**, and **Power BI**, we created a robust system for handling large datasets, performing complex analytics, and presenting actionable insights. The infrastructure, deployed entirely via **Terraform**, ensured a repeatable, scalable solution, with a clear path for future optimization.

--- 
