# Arkose – Case Study: Customer Retention Analysis

## Context

This project was conducted independently, outside of any academic curriculum, in response to a real-world request from the Data team at **Arkose**, a European company operating a network of indoor climbing gyms. It was carried out as part of a personal upskilling initiative, applying data analysis to a business-driven scenario.

## Study Objectives

- Identify causes of subscription cancellation or customer inactivity  
- Analyze customer visit behavior and patterns  
- Detect early signs of disengagement  
- Provide actionable recommendations to the Data and Marketing teams

## Methodology and Tools

A hybrid approach combining:

- Exploratory data analysis with Python (Pandas, Matplotlib, Seaborn)  
- SQL queries using SQLite databases  
- Time-based behavioral visualizations  
- Strategic recommendations based on data-driven insights

## Repository Structure

```
arkose/
│
├── arkose - data analyst test - clients.csv # Customer data
├── arkose - data analyst test - passages.csv # Visit history
│
├── arkose_fidelisation.ipynb # Main analysis notebook
├── arkose_fidelisation.html # Interactive HTML version of the notebook
├── arkose_fidelisation.py # Python script version
│
├── arkose-sql-queries.sql # SQL queries used throughout the study
├── ma_base.db # SQLite database created for analysis
├── votre_base_de_donnees.db # Alternate test database
│
├── arkose_rapport.pdf # Executive summary report
└── README.md # Project overview

```

## Key Insights

- Customer segmentation based on activity levels  
- Identification of key drop-off periods  
- Frequency analysis relative to customer tenure  
- Detection of at-risk profiles (inactive > 90 days)  
- Correlation between visit behavior and subscription type

## Recommendations

The study concludes with concrete suggestions:

- Launch targeted reactivation campaigns  
- Implement alerts to track declining engagement  
- Offer flexible plans for irregular visitors  
- Leverage behavioral data for personalized customer experience

## Deliverables

- Executive report: `arkose_rapport.pdf`  
- Interactive notebook: `arkose_fidelisation.html`  
- SQL query documentation: `arkose-sql-queries.sql`

## Author

**Paul-Emmanuel Buffe**  
This case study was conducted autonomously as part of a proactive effort to deepen skills in data analysis.
