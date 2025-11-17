USE healthcare_project;
GO

BULK INSERT patient_records
FROM 'C:\\Users\\Emron nabizadeh\\Documents\\Data-analyst\\Project\\healthcare-hospital-analysis\\data\\processed\\patient_records_cleaned.csv'
WITH
(
    FIRSTROW = 2,               -- Skip header
    FIELDTERMINATOR = ',',      -- Comma delimiter
    ROWTERMINATOR = '\n',       -- Line feed
    TABLOCK
);
GO

SELECT COUNT(*) AS Total_Records
FROM patient_records;
GO
