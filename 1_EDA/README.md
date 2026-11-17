# Exploratory Data Analysis (with SQL)
![Project 1 EDA banner](../Images/1_1_Project1_EDA.png)
Project that utilizes SQL to transform real-life job posting data into useful insights relating to the job market
# Executive Summary
- Scope: Used 3 queries to answer 3 questions about the data engineer job market
- Data modeling: Used multi-table joins to extract insights
- Analytics: Applied aggregations, filtering, and sorting to find the highest demand, pay, and overall value for different skills

# Tech Stack
- Query Engine: DuckDB
- Language: SQL
- Development: VS Code for SQL editing & terminal for DuckDB CLI
- Version Control: Git/GitHub

# Query Structure
1. [Top Demanded Skills](./01_top_demanded_skills.sql) - Analyzes the top 10 skills that are currently in demand in the data engineer job market
2. [Top Paid Skills](./02_top_paid_skills.sql) - Analyzes the top 25 skills that engineers get paid the most for
3. [Most Optimal Skills](./03_optimal_skills.sql) - Discovers the most optimal skills to learn by balancing the top paid skills with the most demanded skills using natural log

