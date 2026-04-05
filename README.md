#👨‍💻 Customer Behavior Data Analysis
📌 Project Overview

In this project, I worked on analyzing customer shopping behavior using a retail dataset containing around 3900 transactions. The main objective was to understand how different factors like customer demographics, product categories, discounts, and subscription status affect purchasing patterns.

The project follows a complete end-to-end data analytics workflow, starting from raw data cleaning to generating business insights and visualizing them in a dashboard.

🛠️ Tools & Technologies Used
Python (Pandas, NumPy) → Data cleaning and preprocessing
SQL (PostgreSQL) → Business analysis and querying
Power BI → Dashboard and visualization

📂 Dataset Information
Total Records: ~3900
Features: Customer demographics, purchase details, product info, and behavioral data
Missing Values: Found in review_rating column and handled during preprocessing

🔍 Data Cleaning & Preparation (Python)
Loaded dataset using pandas and explored structure using .info() and .describe()
Identified missing values in review_rating and handled them using category-wise median imputation
Standardized column names into snake_case for better readability
Created new features:
age_group using quantile-based binning
purchase_frequency_days by converting categorical frequency into numeric values
spending_level to categorize customers based on purchase amount
is_repeat_customer to identify frequent buyers
Removed redundant columns after validating data consistency

📊 Data Analysis (SQL)
Performed multiple business-focused queries in PostgreSQL:

Compared revenue contribution by gender
Identified customers who used discounts but still spent above average
Found top-rated and most frequently purchased products
Compared spending behavior between subscribers and non-subscribers
Segmented customers into New, Returning, and Loyal groups
Analyzed top products within each category using ranking functions
Evaluated discount usage patterns across products
Measured revenue contribution across different age groups

📈 Dashboard (Power BI)
Created an interactive dashboard to visualize key insights:

Revenue distribution across segments
Customer segmentation and behavior patterns
Product performance and purchase trends

The dashboard allows filtering by category, age group, and subscription status, making it easier to explore the data.

<img width="836" height="467" alt="image" src="https://github.com/user-attachments/assets/4783b86e-91be-4dd4-9db3-e7248f2570e0" />


💡 Key Insights
Customers using discounts often had higher purchase amounts than average
Loyal customers contributed a significant share of total revenue
Certain product categories showed strong repeat purchase behavior
Subscription status had a noticeable impact on overall spending

🚀 Business Recommendations
Focus on retaining loyal customers through targeted offers
Optimize discount strategies to balance revenue and profit
Promote high-performing products in marketing campaigns
Improve subscription benefits to increase customer retention

📁 Project Structure
Python Notebook → Data cleaning & feature engineering
SQL File → Business queries and analysis
Power BI Dashboard → Visualization
README → Project documentation

💬 Final Note
This project helped me understand how to work with real-world data and apply data analytics concepts across different tools. It also gave me hands-on experience in connecting Python with SQL and building dashboards for business decision-making.
