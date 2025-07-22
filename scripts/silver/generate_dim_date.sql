/*
========================================================================================================================
Script for Generation of a Date Dimension table
=========================================================================================================================
Script Purpose:
    This script creates a date table starting from Jan 1, 2018 to Dec 31, 2026.
	It also includes extra fields that mark quarters, seasons, US holiday and a Special Events field for important dates 
	for this business.
	To have the special events field populate, ensure that a special_events_calendar is loaded first.
=========================================================================================================================
*/


-- STEP 1: Create the dim_date table
IF OBJECT_ID ('silver.dim_date', 'U') IS NOT NULL
	DROP TABLE silver.dim_date
GO

CREATE TABLE silver.dim_date (
    date_key DATE PRIMARY KEY,
    year INT,
    month_num INT,
    month_name VARCHAR(15),
    day INT,
    day_of_week_name VARCHAR(10),
    day_of_week_num INT,
    quarter INT,
    week_num INT,
    season VARCHAR(10),
    is_weekend VARCHAR(5),
    is_holiday BIT,
    special_event VARCHAR(50)
);

-- STEP 2: Populate the date dimension
WITH DateSequence AS (
    SELECT CAST('2018-01-01' AS DATE) AS date_key
    UNION ALL
    SELECT DATEADD(DAY, 1, date_key)
    FROM DateSequence
    WHERE date_key < '2026-12-31'
)
INSERT INTO silver.dim_date (
    date_key, 
	year, 
	month_num,
	month_name, 
	day,
    day_of_week_name,
	day_of_week_num, 
	quarter,
	week_num,
    season,
	is_weekend,
	is_holiday,
	special_event
)
SELECT
    date_key,
    YEAR(date_key),
    MONTH(date_key),
    DATENAME(MONTH, date_key),
    DAY(date_key),
    DATENAME(WEEKDAY, date_key),
      -- Modified day_of_week_num: Monday = 1, Sunday = 7
    CASE 
        WHEN DATEPART(WEEKDAY, d.date_key) = 1 THEN 7
        ELSE DATEPART(WEEKDAY, d.date_key) - 1
    END AS day_of_week_num,
    DATEPART(QUARTER, date_key),
    DATEPART(WEEK, date_key),
    
    -- Season logic
    CASE 
        WHEN MONTH(date_key) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(date_key) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(date_key) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END AS season,

    -- Weekend flag
    CASE 
        WHEN DATENAME(WEEKDAY, date_key) IN ('Saturday', 'Sunday') THEN 'Yes'
        ELSE 'No'
    END AS is_weekend,

    -- Static U.S. holiday flag (partial list — customize as needed)
    CASE 
        WHEN CONVERT(VARCHAR, date_key, 23) IN (
            '2021-01-01', '2021-07-04', '2021-12-25',
            '2022-01-01', '2022-07-04', '2022-12-25',
            '2023-01-01', '2023-07-04', '2023-12-25',
            '2024-01-01', '2024-07-04', '2024-12-25',
            '2025-01-01', '2025-07-04', '2025-12-25',
            '2026-01-01', '2026-07-04', '2026-12-25'
        ) THEN 1
        ELSE 0
    END AS is_holiday,

    -- Special event flag - This pulls from the silver.special_events_calendar table so ensure that you've created that first
	e.special_event_name

FROM DateSequence as d
LEFT JOIN silver.special_events_calendar as e
	ON d.date_key BETWEEN e.event_start_date AND e.event_end_date
OPTION (MAXRECURSION 0);
