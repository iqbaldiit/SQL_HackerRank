/*
Query the following two values from the STATION table:

1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.

*/

DECLARE @tbl_STATION AS TABLE (ID int, CITY VARCHAR(21),STATE VARCHAR(2),LAT_N decimal(18,2),LONG_W decimal(18,2))

INSERT INTO @tbl_STATION VALUES (1,'NY','NY',123.433,1223.45)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',24.54,324.234)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',123.345,123.23)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',1234.433,324.45)

SELECT ROUND(SUM(LAT_N),2),ROUND(SUM(LONG_W),2) FROM @tbl_STATION 

/*
Hacker Rank Submission
----------------------
SELECT ROUND(SUM(LAT_N),2),ROUND(SUM(LONG_W),2) FROM STATION 

*/