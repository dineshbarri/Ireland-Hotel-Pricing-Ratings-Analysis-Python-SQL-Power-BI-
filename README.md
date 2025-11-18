
#  Ireland Hotels Data Analysis  

<div align="center">

![POWERBI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=Power%2520BI&logoColor=white)
![MICROSOFT SQL SERVER](https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![PYTHON](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

</div>

This end-to-end data analytics project focuses on analyzing **hotels in Ireland** using real-world data scraped from *Booking.com*.  
The project covers the full lifecycle of a modern data analytics workflow:

✔ Data Collection through Web Scraping  
✔ Data Cleaning & Preprocessing using Python  
✔ Exploratory Data Analysis using SQL (SSMS)  
✔ Visual Analytics with Power BI  
✔ Final Insights & Business Value Summary  

---

## 📌 Project Overview

Understanding hotel pricing, ratings, availability, and review patterns is crucial for tourism insights and hospitality decision-making.  
This project analyzes hotels across major Irish cities to uncover trends in:

- Hotel pricing for weekend stays  
- Rating distributions  
- Review behavior vs. hotel scores  
- Room availability  
- Free cancellation impact  
- City-wise pricing & rating patterns  

The analysis provides actionable insights useful for:

- Tourism boards  
- Hospitality businesses  
- Travelers  
- Market researchers  

---


## 📁 **Repository Structure**
```text
Ireland-Hotels-Data-Analysis/
│
├── data/
│   ├── raw/
│   │   └── hotels.csv                 # Original scraped data
│   └── processed/
│       └── hotels_cleaned.csv          # Cleaned dataset
│
├── notebooks/
│   └── ireland-hotels.ipynb           # Data cleaning & preprocessing
│
├── sql/
│   └── Hotels_Ireland.sql             # All SQL queries for analysis
│
├── powerbi/
│   └── Ireland_Hotels_Dashboard.pbix  # Power BI dashboard file
│
├── docs/
│   └── README.md                      # Project documentation
│
└── requirements.txt                   # Python dependencies
```


---

## 🏨 1. Data Collection (Web Scraping)

### ✔ Source  
Data was collected from **Booking.com**, focusing on:

- Hotels located in **Ireland**  
- **One-night weekend stay**  
- Extracted using **Instant Data Scraper (Chrome Extension)**  

### ✔ Fields Extracted (Raw Data)
The scraper collected attributes including:

- Hotel Name  
- City  
- Price per Night  
- Score / Rating  
- Number of Reviews  
- Review Category  
- Free Cancellation (Yes/No)  
- Rooms Left  
- Description Snippets  
- Link to Hotel Page  

The scraped dataset was stored as: **hotels_raw.csv**






