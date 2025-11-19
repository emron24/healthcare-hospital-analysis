# 🏥 Healthcare Analytics — Patient Readmission Prediction

This project analyzes hospital readmission risk using real-world patient data. It combines Python, SQL, Excel, and Power BI to uncover clinical drivers of 30-day readmission and deliver stakeholder-ready insights.

---

## 📦 Project Structure
```
HEALTHCARE-HOSPITAL-ANALYSIS/

├── .vscode/

|
├── data/
│   ├── processed/
│   │   └── patient_records_cleaned.csv
│   └── raw/
│       ├── IDS_mapping.csv
│       └── diabetic_data.csv
|
├── docs/
│   ├── project_summary.md
│   └── visuals/
│       ├── age_comorbidity_heatmap.png
│       ├── age_group_readmission.png
│       ├── correlation_heatmap.png
│       ├── diagnosis_category_readmission.png
│       ├── lgbm_feature_importance1.png
│       ├── los_bucket_readmission.png
│       └── los_distribution.png
|
├── excel/
│   ├── charts.xlsx
│   └── pivot-tables.xlsx
|
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_analysis.ipynb
│   └── 03_modeling.ipynb
|
├── powerbi/
│   ├── healthcare_dashboard.pbix
│   └── screenshots/
|
└── sql/
    ├── analysis_queries.sql
    ├── bulk_insert.sql
    └── schema.sql
├── README.md
├── requirements.txt
├── .gitignore
```

## 🧠 Business Objective

Hospital readmissions are costly and often preventable. This project identifies key predictors of readmission to support:
- Targeted discharge planning
- Risk stratification
- Operational resource allocation

---

## 🧪 Data Overview

### 🔹 Raw Data (`data/raw/`)
- `diabetic_data.csv`: Primary patient dataset
- `IDS_mapping.csv`: Diagnosis code mappings

### 🔹 Processed Data (`data/processed/`)
- `patient_records_cleaned.csv`: Cleaned and enriched dataset used across all layers

---

## 🐍 Python Analysis (`notebooks/`)

- `01_data_cleaning.ipynb`: Cleans and buckets variables (LOS, Prior Admissions)
- `02_exploratory_analysis.ipynb`: Visualizes trends and correlations
- `03_modeling.ipynb`: Builds predictive models (e.g., LGBM) and extracts feature importance

---

## 🗃️ SQL Analysis (`sql/`)

- `schema.sql`: Defines normalized database schema
- `bulk_insert.sql`: Loads cleaned data into SQL tables
- `analysis_queries.sql`: Validates Python insights using SQL joins and aggregations

---

## 📊 Excel Analysis (`excel/`)

### 🔹 `pivot-table.xlsx`
- Raw pivot tables with conditional formatting:
  - Age × Comorbidity
  - Diagnosis × LOS
  - Prior Admissions

### 🔹 `charts.xlsx`
- Stakeholder-ready visuals with annotations and slicers:
  - `README_Excel`: Cover sheet with chart summaries
  - `Age_Comorbidity_Chart`: Clustered column chart + heatmap pivot
  - `Diagnosis_LOS_Chart`: Clustered column chart + annotated spikes
  - `Prior_Admissions_Chart`: Horizontal bar chart + Age Group slicer

---

## 📊 Power BI Dashboard (`powerbi/`)

- Interactive dashboard with slicers for Age, Diagnosis, LOS, and Prior Admissions
- Visual storytelling aligned with Excel and SQL findings
- Designed for clinical operations and executive review

---

## 🖼️ Visual Assets (`docs/visuals/docs/`)

Includes annotated PNGs for README, presentations, and thumbnails:
- Age group risk charts
- LOS distribution
- Diagnosis-based readmission
- Correlation heatmap
- Feature importance (LGBM)

---

## 💡 Key Insights

| Driver | Insight |
|--------|--------|
| Age × Comorbidity | `[20–30)` age group with 0 comorbidities → **145.2% readmission** |
| Diagnosis × LOS | Genitourinary System spikes in medium LOS; V-E Codes spike in short LOS |
| Prior Admissions | 6+ prior admissions → **40.58% readmission**; strong upward trend |

---

## 🧰 Tools Used

- Python: `pandas`, `matplotlib`, `seaborn`, `scikit-learn`, `lightgbm`
- SQL: PostgreSQL (via SSMS)
- Excel: Pivot tables, slicers, conditional formatting, charts
- Power BI: Interactive dashboard design
- Git/GitHub: Version control and project presentation

---

## 📁 How to Explore

1. Start with `charts.xlsx` → `README_Excel` for visual summaries
2. Dive into `notebooks/` for Python logic and feature engineering
3. Explore `sql/analysis_queries.sql` for SQL validation
4. Open `powerbi/screenshots/` for dashboard visuals
5. Browse `docs/visuals/docs/` for annotated PNGs

---

## 🚀 Portfolio Impact

This project demonstrates:
- End-to-end analytics workflow across platforms
- Ability to translate technical findings into stakeholder-ready visuals
- Strong documentation, reproducibility, and recruiter-facing polish


