/*
===============================================================================
Stored Procedure: Load Bronze Layer (Revenue, Orders, Social Media Metrics, Email Metrics) 
(Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads sales data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze_sales;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze_sales AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Bronze Layer (Sales Data)';
		PRINT '================================================';

		-- Bank Transactions File Load

		PRINT '------------------------------------------------';
		PRINT 'Loading Bank Transactions Table';
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.bank_transactions';
		TRUNCATE TABLE bronze.bank_transactions;
		PRINT '>> Inserting Data Into: bronze.bank_transactions';
		BULK INSERT bronze.bank_transactions
		FROM '<<your_path_here>>\bank_transactions.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			CODEPAGE = '65001',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		-- Wine Direct Order Details File Load

		PRINT '------------------------------------------------';
		PRINT 'Loading Wine Direct Order Details Table';
		PRINT '------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.wd_order_details';
		TRUNCATE TABLE bronze.wd_order_details;
		PRINT '>> Inserting Data Into: bronze.wd_order_details';
		BULK INSERT bronze.wd_order_details
		FROM '<<your_path_here>>\wd_order_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			CODEPAGE = '65001',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		-- Mailchimp (Email Marketing) File Load

		PRINT '------------------------------------------------';
		PRINT 'Loading Mailchimp Table';
		PRINT '------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.mailchimp_email_marketing';
		TRUNCATE TABLE bronze.mailchimp_email_marketing;
		PRINT '>> Inserting Data Into: bronze.mailchimp_email_marketing';
		BULK INSERT bronze.mailchimp_email_marketing
		FROM '<<your_path_here>>\mailchimp_email_marketing.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			CODEPAGE = '65001',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		-- Facebook Data Load

		PRINT '------------------------------------------------';
		PRINT 'Loading Facebook Data Table';
		PRINT '------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.facebook_data';
		TRUNCATE TABLE bronze.facebook_data;
		PRINT '>> Inserting Data Into: bronze.facebook_data';
		BULK INSERT bronze.facebook_data
		FROM '<<your_path_here>>\facebook_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			CODEPAGE = '65001',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		-- Instagram Data Load

		PRINT '------------------------------------------------';
		PRINT 'Loading Instagram Data Table';
		PRINT '------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.instagram_data';
		TRUNCATE TABLE bronze.instagram_data;
		PRINT '>> Inserting Data Into: bronze.instagram_data';
		BULK INSERT bronze.instagram_data
		FROM '<<your_path_here>>\instagram_data.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			CODEPAGE = '65001',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END
