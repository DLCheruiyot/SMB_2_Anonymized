
# 📊 SMB_2_Anonymized: End-to-End Data Warehouse for a Small Hospitality Business

This repository showcases a fully anonymized SQL Server-based data warehouse project designed for a small, consumer-facing business. The solution includes structured ETL layers (Bronze → Silver → Gold), performance-optimized views, and an integrated Power BI report — all built to support robust insights across sales, customer behavior, marketing, and revenue trends.

> ⚠️ All customer, product, and financial data has been anonymized for public sharing. No real customer names, emails, product identifiers, or original business names remain.

---

## 📁 Project Structure

```
📂 SMB_2_Anonymized/
├── 📜 create_database.sql
├── 📜 ddl_bronze.sql
├── 📜 ddl_silver.sql
├── 📜 ddl_gold_views.sql
├── 📜 load_silver_data.sql
├── 📸 report_snapshots/
│   ├── revenue_trend.png
│   ├── customer_segmentation.png
│   ├── email_performance.png
│   └── product_summary.png
└── README.md
```

---

## 🔍 Features

- **Layered Data Architecture**  
  - **Bronze Layer:** Raw, structured tables with anonymized inputs.
  - **Silver Layer:** Cleansed and transformed business-ready tables.
  - **Gold Layer:** Final reporting views for direct use in BI tools.

- **Anonymization Logic Highlights**  
  - Randomized names, emails, quantities, and revenue values.
  - Product names and customer PII removed or obfuscated.
  - Business-specific terms replaced (e.g. "Mellowood" → "Winery").
  - Revenue values scaled slightly to mask actual figures.

- **Power BI Integration (Not Included)**  
  Screenshots demonstrate visualizations without distributing `.pbix`. The report includes:
  - Revenue trends (YoY, QoQ, monthly)
  - Top customer segments and regions
  - Email campaign analytics
  - Product performance summaries
  - Social media impact metrics

---

## 🖼️ Sample Visualizations

> Below are select Power BI report snapshots created using the anonymized dataset.

| Revenue Trend (YoY%) | Customer Segments |
|----------------------|-------------------|
| ![](report_snapshots/revenue_trend.png) | ![](report_snapshots/customer_segmentation.png) |

| Email Engagement | Product Revenue Summary |
|------------------|-------------------------|
| ![](report_snapshots/email_performance.png) | ![](report_snapshots/product_summary.png) |

---

## 🚀 How to Use

1. **Clone this repo** and open in SQL Server Management Studio (SSMS).
2. Run the `create_database.sql` script to generate a fresh anonymized database.
3. Load schema scripts (`ddl_bronze.sql`, `ddl_silver.sql`, `ddl_gold_views.sql`) in order.
4. Use `load_silver_data.sql` to populate and transform the Silver layer.
5. (Optional) Connect Power BI Desktop to explore the model using your own visuals.

---

## 🔐 Disclaimer

This anonymized dataset is intended for educational, portfolio, and demonstration purposes only.  
All business identifiers, financial values, and sensitive fields have been randomized or removed.

If you'd like a walkthrough of the full Power BI report or have questions about the modeling decisions, feel free to reach out or open an issue.

---

## 🧠 Author

**Daniel Cheruiyot**  
Data & Insights Analyst | BI Developer  
📧 [LinkedIn](https://www.linkedin.com/in/cheruiyotdaniel)  
