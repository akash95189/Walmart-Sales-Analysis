# Walmart-Sales-Analysis


## Project Overview

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions.

---
## Project Steps

### 1. Preview
  - **Tools Used**- Jupyter Notebook, Python, MYSQL Workbench
  - **Goal**- To Create a structured workspace in Jupyter Notebook for smooth data handling.

### 2. Set up Dataset
  - **Data Source**- Using Open source Kaggle to Download the readymade available dataset.
  - **Storage**- Save data in project file to access it in Jupyter notebook.

### 3. Explore Data
- **Loading Data**- Read the data into a Pandas FataFrame for initial analysis and transformation using Pandas Function.
- **Analysis**- Use functions like `.head()`,`.info()` and `.describe()` to get a quick overview of dataset.
- **Chech Volume**- use function `.shape()` to check the volume of set.

### 4. Data Cleaning
  - **Remove Dupplicates**- Identify and remove the duplicate entries to avoid uneven result.
  - **Handle Missing Values**- Drop rows and columns with missing values to avoid errors in result.
  - **Fix Data Types**- Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
  - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 5. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 6. Load Data into `.csv` format and into MYSQL
  - **To CSV File**- Save the cleaned file into `.csv` format for any further use.
  - **Set Up Connections**: Connect to MySQL using `sqlalchemy` and load the cleaned data into each database.
  - **Table Creation**: Set up tables in both MySQL using Python SQLAlchemy to automate table creation and data insertion.

### 7. SQL Analysis: Complex Queries and Business Problem Solving
  - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
    - Find different payment methods, number of transactions, and quantity sold by payment method.
    - Identify the highest-rated category in each branch. Display the branch, category, and avg rating.
    - Identify the busiest day for each branch based on the number of transactions.
    - Calculate the total quantity of items sold per payment method.
    - Determine the average, minimum, and maximum rating of categories for each city.
    - Calculate the total profit for each category.
    - Determine the most common payment method for each branch.
    - Categorize sales into Morning, Afternoon, and Evening shifts.
    - Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023).
    


---
## Future Enhancements

Possible extensions to this project:
- Additional data sources to enhance analysis depth.
- Integration of Machine Learning Algorithm to make future sales prediction with other parameters.
---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.
---
