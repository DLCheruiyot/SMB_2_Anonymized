/* 
==================================================================================================================
DDL and Load Script: Creates Special Events Calendar Table in the Silver Layer
==================================================================================================================
Script Purpose:
	This script checks whether an existing special events calendar table exists, drops it if so, creates a 
	new table and then loads the dates within the scripts.

====================================================================================================================
*/

IF OBJECT_ID ('silver.special_events_calendar', 'U') IS NOT NULL
	DROP TABLE silver.special_events_calendar
GO

CREATE TABLE silver.special_events_calendar (
	event_start_date DATE,
	event_end_date DATE,
	special_event_name NVARCHAR(150),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
)

INSERT INTO silver.special_events_calendar (
	event_start_date,
	event_end_date,
	special_event_name)

VALUES
('10/9/2021','10/13/2021','Soft Opening'),
('12/4/2021','12/8/2021','Sip & Bonfire'),
('2/9/2022','2/13/2022','Valentines Day'),
('12/17/2022','12/21/2022','Christmas Holiday Event'),
('2/10/2023','2/14/2023','Valentines Day'),
('4/22/2023','4/26/2023','Seasonal Festival'),
('5/6/2023','5/10/2023','Cinco de Mayo'),
('5/27/2023','5/31/2023','Memorial Day Weekend'),
('6/17/2023','6/21/2023','Rock Concert'),
('7/1/2023','7/4/2023','July 4 Independence Day'),
('7/8/2023','7/12/2023','Special Guest Visit'),
('9/9/2023','9/13/2023','Dog Days'),
('10/28/2023','11/1/2023','Reggae Concert'),
('11/4/2023','11/8/2023','Seasonal Festival'),
('11/18/2023','11/22/2023','Friendsgiving'),
('12/16/2023','12/20/2023','Christmas Holiday Event'),
('2/17/2024','2/21/2024','Valentines Day'),
('3/9/2024','3/13/2024','Painting Event'),
('4/27/2024','4/30/2024','Seasonal Festival'),
('5/4/2024','5/8/2024','Cinco de Mayo'),
('5/31/2024','6/4/2024','Memorial Day Weekend'),
('6/29/2024','7/3/2024','Art Day'),
('7/6/2024','7/9/2024','July 4 Independence Day'),
('8/17/2024','8/21/2024','Cooking Class'),
('9/14/2024','9/18/2024','Reggae Concert'),
('10/19/2024','10/23/2024','Painting Event'),
('10/26/2024','10/30/2024','Nevada Event'),
('11/2/2024','11/6/2024','Seasonal Festival'),
('11/16/2024','11/20/2024','Fall Soup Event'),
('12/22/2024','12/26/2024','Christmas Holiday Event'),
('2/15/2025','2/19/2025','Valentines Day'),
('3/1/2025','3/5/2025','Mardi Gras'),
('4/26/2025','4/30/2025','Seasonal Festival'),
('5/3/2025','5/6/2025','Cinco de Mayo'),
('5/24/2025','5/28/2025','Cooking Class'),
('5/31/2025','6/3/2025','Memorial Day Weekend'),
('6/14/2025','6/18/2025','Rock Concert'),
('7/4/2025','7/8/2025','July 4 Independence Day'),
('8/16/2025','8/20/2025','Grillin Day'),
('9/13/2025','9/17/2025','Reggae Concert');
