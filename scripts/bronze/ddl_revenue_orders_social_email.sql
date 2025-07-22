/*
===============================================================================================================
DDL Script: Create Bronze Tables
===============================================================================================================
Script Purpose:
  This script creates tables in 'bronze' schema, dropping existing tables if they already exist.

===============================================================================================================
*/

IF OBJECT_ID ('bronze.bank_transactions' , 'U') IS NOT NULL
	DROP TABLE bronze.bank_transactions;
GO
  
CREATE TABLE bronze.bank_transactions (
	bank_date DATE,
	bank_transaction NVARCHAR(15),
	bank_transaction_name NVARCHAR (150),
	bank_memo NVARCHAR (150),
	bank_amount DECIMAL (12, 2)
);
GO

IF OBJECT_ID ('bronze.wd_order_details' , 'U') IS NOT NULL
	DROP TABLE bronze.wd_order_details;
GO
  
CREATE TABLE bronze.wd_order_details (
	order_num INT,
	cust_num INT,
	cust_birth_date DATE,
	cust_first_name NVARCHAR (50),
	order_taxes DECIMAL (12, 2),
	order_subtotal DECIMAL (12, 2),
	cust_last_name NVARCHAR (50),
	cust_email NVARCHAR (50),
	order_date DATE,
	cust_city NVARCHAR (50),
	cust_state NVARCHAR (5),
	cust_zip INT,
	cust_status NVARCHAR (50),
	order_total DECIMAL (12, 2),
	quantity INT,
	prod_sales_price DECIMAL (12, 2),
	prod_item_discount DECIMAL (12, 2),
	prod_retail_price DECIMAL (12, 2),
	prod_SKU NVARCHAR (50)
);
-- prod_name and prod_type removed for anonymization
GO

IF OBJECT_ID ('bronze.mailchimp_email_marketing' , 'U') IS NOT NULL
	DROP TABLE bronze.mailchimp_email_marketing;
GO

CREATE TABLE bronze.mailchimp_email_marketing (
unique_id NVARCHAR(50),
email_title NVARCHAR(255),
email_subject NVARCHAR(255),
email_audience NVARCHAR(255),
send_date DATETIME,
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
times_liked_on_facebook INT);

GO

IF OBJECT_ID ('bronze.facebook_data', 'U') IS NOT NULL
	DROP TABLE bronze.facebook_data;
GO

CREATE TABLE bronze.facebook_data (
facebook_date DATE,
facebook_follows INT,
facebook_interactions INT,
facebook_link_clicks INT,
facebook_reach INT,
facebook_visits INT);

GO

IF OBJECT_ID ('bronze.instagram_data', 'U') IS NOT NULL
	DROP TABLE bronze.instagram_data;
GO

CREATE TABLE bronze.instagram_data (
instagram_date DATE,
instagram_interaction INT,
instagram_follows INT NULL,
instagram_link_clicks INT,
instagram_reach INT,
instagram_visits INT);

GO
