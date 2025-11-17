-- sql/schema.sql

-- 1. Database Creation
CREATE DATABASE healthcare_project;
GO
USE healthcare_project;
GO

-- 2. Table Creation for Cleaned Patient Records
-- This schema aligns with the final 'patient_records_cleaned.csv' output from the notebook.
CREATE TABLE patient_records
(
  Encounter_ID INT PRIMARY KEY,
  -- Unique identifier for the encounter
  Patient_ID INT,
  -- Identifier for the patient (non-unique across encounters)
  Age_Group VARCHAR(15) NOT NULL,
  -- e.g., '[50-60)', '[70-80)'
  Gender VARCHAR(10) NOT NULL,
  Race VARCHAR(25) NOT NULL,
  Diagnosis_Category VARCHAR(50) NULL,
  -- Primary category derived from Diag_1 (Engineered)
  Length_of_Stay INT NOT NULL,
  -- In days
  LOS_Bucket VARCHAR(15) NOT NULL,
  -- e.g., 'Short', 'Medium', 'Long' (Engineered)
  Num_Prior_Admissions INT NOT NULL,
  -- Proxy for prior inpatient visits
  Num_Medications INT NOT NULL,
  Num_Lab_Procedures INT NOT NULL,
  Num_Procedures INT NOT NULL,
  Comorbidity_Count INT NOT NULL,
  -- Charlson-like proxy (Engineered)
  Medication_Change BIT NOT NULL,
  -- 1 if any medication was changed, 0 otherwise
  Readmitted_30days BIT NOT NULL
  -- TARGET: 1 = Readmitted within 30 days
);
GO