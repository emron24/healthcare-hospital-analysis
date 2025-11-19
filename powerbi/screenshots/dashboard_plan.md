# 📊 Power BI Dashboard Plan — Patient Readmission Analysis

The dashboard is organized into **three pages**, following the narrative flow of the project:

1. **Readmission Overview & KPIs** — Executive Summary
2. **Risk Factor Deep Dive** — Core Analysis leveraging Python/SQL findings
3. **Model Performance & Interpretability** — Predictive model validation and actionable insights

---

## 1️⃣ Page 1: Readmission Overview & KPIs

This page provides the context and baseline metrics necessary for management to understand the scope of the problem.

| Element | Visual Type | Data Source | Purpose |
|---------|-------------|-------------|---------|
| **Overall Readmission Rate** | KPI Card | `AVG(Readmitted_30days)` | Display the **11.39%** baseline rate prominently |
| **Total Encounters** | KPI Card | `COUNT(Encounter_ID)` | Show the sample size (approx. 100k+) |
| **Avg. Length of Stay** | KPI Card | `AVG(Length_of_Stay)` | Show the average hospitalization period (approx. 4 days) |
| **Top 5 Admission Types** | Bar Chart | `Admission_Type_ID × COUNT(Encounter_ID)` | Contextualize admission types driving volume |
| **LOS Trend** | Bar/Line Chart | `LOS_Bucket × AVG(Readmitted_30days)` | Show risk trend: **Long Stays (8+d)** have highest rate |
| **Slicers/Filters** | Slicer | `Age_Group`, `Gender` | Allow drill-down into demographics |

---

## 2️⃣ Page 2: Risk Factor Deep Dive

This page leverages the most powerful non-linear findings from the EDA to identify the top three high-risk segments.

| Element | Visual Type | Data Source | Key Insight Focus |
|---------|-------------|-------------|-------------------|
| **Risk Matrix Heatmap** | Matrix + Conditional Formatting | `Age_Group` × `Comorbidity_Count` × Avg. Readmission Rate | Highlight **[20–30) Age Group** as highest risk (16.54%) despite low comorbidities |
| **Diagnosis Risk** | Clustered Bar Chart | `Diagnosis_Category × Avg(Readmitted_30days)` | Identify focus areas: **External Causes/V-E Codes** and **Circulatory/Cardiovascular** |
| **Chronic Burden vs. Risk** | Scatter Plot | `Num_Prior_Admissions` × Avg. Readmission Rate | Confirm correlation between past utilization and future risk |
| **Medication Change Impact** | Gauge/Card | `AVG(Readmitted_30days)` by `Medication_Change` | Quantify risk associated with medication changes |

---

## 3️⃣ Page 3: Model Performance & Actionable Features

This page validates the model's predictive power and translates technical results into operational insights.

| Element | Visual Type | Data Source | Purpose |
|---------|-------------|-------------|---------|
| **Model Metrics** | KPI Cards | Pre-calculated in Python | Display **ROC-AUC (~0.67)** and **PR-AUC (~0.32)** |
| **Feature Importance** | Bar Chart | LightGBM Top 20 Feature Importance | Show top predictors: `Num_Prior_Admissions`, `Age_Group`, `Length_of_Stay`, etc. |
| **Model Value Statement** | Text Box | Summary | Recommend **targeting [20–30) cohort** and **intensifying long-stay planning** |

---

## 🎯 Why This Dashboard Matters

- **Executive-Friendly:** Page 1 provides KPIs and baseline context  
- **Clinically Relevant:** Page 2 highlights actionable risk factors  
- **Technically Validated:** Page 3 demonstrates predictive model performance and interpretability  

This layered design ensures the dashboard is both **business-ready** and **data-science-backed**, bridging technical depth with stakeholder clarity.
