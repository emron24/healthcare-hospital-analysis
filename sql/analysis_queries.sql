-- sql/analysis_queries.sql

USE healthcare_project;
GO

-- 1. Basic Sanity Check: Total Records and Distinct Patients
SELECT
  COUNT(*) AS Total_Encounters,
  COUNT(DISTINCT Patient_ID) AS Total_Unique_Patients
FROM patient_records;
GO

-- 2. Overall Readmission Rate (Baseline Rate)
SELECT
  CAST(SUM(CASE WHEN Readmitted_30days = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS Overall_Readmission_Rate_Percent
FROM patient_records;
GO

-- 3. Readmission Rate by Diagnosis Category (Key BI/Excel visual)
SELECT
  Diagnosis_Category,
  COUNT(*) AS Total_Encounters,
  CAST(SUM(CASE WHEN Readmitted_30days = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS Readmission_Rate_Percent
FROM patient_records
GROUP BY Diagnosis_Category
ORDER BY Readmission_Rate_Percent DESC;
GO

-- 4. Avg Length of Stay (LOS): Readmitted vs. Non-Readmitted
SELECT
  CASE WHEN Readmitted_30days = 1 THEN 'Readmitted' ELSE 'Not Readmitted' END AS Readmission_Status,
  AVG(CAST(Length_of_Stay AS FLOAT)) AS Avg_LOS_Days
FROM patient_records
GROUP BY Readmitted_30days;
GO

-- 5. Readmission Rate by Age Group and Comorbidity Count (Heatmap Data)
-- This provides the cross-tabulation data needed for the Power BI/Excel Heatmap visual.
SELECT
  Age_Group,
  Comorbidity_Count,
  COUNT(*) AS Total_Encounters,
  CAST(SUM(CASE WHEN Readmitted_30days = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS Readmission_Rate_Percent
FROM patient_records
GROUP BY Age_Group, Comorbidity_Count
ORDER BY Age_Group, Comorbidity_Count;
GO

-- 6. Readmission Rate Trend by LOS Bucket (for Line/Bar Chart)
SELECT
  LOS_Bucket,
  COUNT(*) AS Total_Encounters,
  CAST(SUM(CASE WHEN Readmitted_30days = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS Readmission_Rate_Percent
FROM patient_records
GROUP BY LOS_Bucket
-- Custom ordering to ensure buckets are presented logically (Short -> Medium -> Long)
ORDER BY
    CASE
        WHEN LOS_Bucket LIKE 'Short%' THEN 1
        WHEN LOS_Bucket LIKE 'Medium%' THEN 2
        WHEN LOS_Bucket LIKE 'Long%' THEN 3
        ELSE 4
    END;
GO

-- 7. High-Level Risk Factor Check: Impact of Medication Change
SELECT
  CASE WHEN Medication_Change = 1 THEN 'Med Change Occurred' ELSE 'No Med Change' END AS Medication_Status,
  COUNT(*) AS Total_Encounters,
  CAST(SUM(CASE WHEN Readmitted_30days = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS Readmission_Rate_Percent
FROM patient_records
GROUP BY Medication_Change;
GO

-- 8. Top 5 Race/Gender Combinations by Readmission Rate
SELECT TOP 5
  Race,
  Gender,
  COUNT(*) AS Total_Encounters,
  CAST(SUM(CASE WHEN Readmitted_30days = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS Readmission_Rate_Percent
FROM patient_records
GROUP BY Race, Gender
HAVING COUNT(*) > 500
-- Filter to ensure statistically stable rates
ORDER BY Readmission_Rate_Percent DESC;
GO