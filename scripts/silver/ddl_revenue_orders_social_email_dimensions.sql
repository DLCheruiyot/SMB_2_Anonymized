/*
===============================================================================================================
DDL Script: Create Silver Tables (Revenue, Orders, Customers, Products, Social Media Metrics, Email Mktg Metrics)
===============================================================================================================
Script Purpose:
  This script creates tables in 'silver' schema, dropping existing tables if they already exist.

===============================================================================================================
*/

-- Defining Revenue Table - derived from bankfeed
IF OBJECT_ID ('silver.revenue' , 'U') IS NOT NULL
	DROP TABLE silver.revenue;
GO
  
CREATE TABLE silver.revenue (
	transaction_date DATE,
	bank_transaction NVARCHAR(15),
	transaction_name NVARCHAR (150),
	transaction_amount DECIMAL (12, 2),
	transaction_type NVARCHAR (50),
	revenue_type NVARCHAR (50),
	retail_revenue_source NVARCHAR (50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Defining Order Details Table - derived from POS Platforms
IF OBJECT_ID ('silver.wd_order_details' , 'U') IS NOT NULL
	DROP TABLE silver.wd_order_details;
GO
  
CREATE TABLE silver.wd_order_details (
	order_num INT,
	order_date DATE,
	cust_num INT,
	prod_SKU NVARCHAR (50),
	quantity INT,
	prod_sales_price DECIMAL (12, 2),
	prod_item_discount DECIMAL (12, 2),
	order_subtotal DECIMAL (12, 2),
	order_taxes DECIMAL (12, 2),
	order_total DECIMAL (12, 2),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

-- Defining Products Dimension table - derived from POS Platforms
-- Product name and Product Type removed for anonymity
IF OBJECT_ID ('silver.dim_products' , 'U') IS NOT NULL
	DROP TABLE silver.dim_products;
GO
  
CREATE TABLE silver.dim_products (
	prod_SKU NVARCHAR (50),
	prod_retail_price DECIMAL (12, 2),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

-- Defining Customers Dimension table - derived from CRM
IF OBJECT_ID ('silver.dim_customers' , 'U') IS NOT NULL
	DROP TABLE silver.dim_customers;
GO
  
CREATE TABLE silver.dim_customers (
	cust_num INT,
	cust_status NVARCHAR (50),
	cust_full_name NVARCHAR (100),
	cust_birth_date DATE,
	active_since DATE,
	cust_email NVARCHAR (50),
	cust_city NVARCHAR (50),
	cust_state NVARCHAR (5),
	cust_zip INT,
	last_order_date DATE,
	cust_tenure_days INT,
	data_quality_flag NVARCHAR(100)
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

-- Defining Email Metrics table - derived from Mailchimp
IF OBJECT_ID ('silver.mailchimp_email_marketing' , 'U') IS NOT NULL
	DROP TABLE silver.mailchimp_email_marketing;
GO

CREATE TABLE silver.mailchimp_email_marketing (
	unique_id NVARCHAR(50),
	email_audience NVARCHAR(255),
	send_date DATE,
	send_time TIME(0),
	send_weekday NVARCHAR(25),
	total_recipients INT,
	successful_deliveries INT,
	soft_bounces INT,
	hard_bounces INT,
	total_bounces INT,
	times_forwarded INT,
	forwarded_opens INT,
	unique_opens INT,
	open_rate FLOAT,
	total_opens INT,
	unique_clicks INT,
	click_rate FLOAT,
	total_clicks INT,
	email_unsubscribes INT,
	abuse_complaints INT,
	times_liked_on_facebook INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
	);

GO

-- Defining Social Media Metrics table - derived from META
IF OBJECT_ID ('silver.facebook_data', 'U') IS NOT NULL
	DROP TABLE silver.facebook_data;
GO

CREATE TABLE silver.facebook_data (
	facebook_date DATE,
	facebook_follows INT,
	facebook_interactions INT,
	facebook_link_clicks INT,
	facebook_reach INT,
	facebook_visits INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
	);

GO
-- Defining Social Media Metrics table - derived from META
IF OBJECT_ID ('silver.instagram_data', 'U') IS NOT NULL
	DROP TABLE silver.instagram_data;
GO

CREATE TABLE silver.instagram_data (
	instagram_date DATE,
	instagram_follows INT NULL,
	instagram_interactions INT,
	instagram_link_clicks INT,
	instagram_reach INT,
	instagram_visits INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
	);

GO
