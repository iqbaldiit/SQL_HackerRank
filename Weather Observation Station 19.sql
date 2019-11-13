/*
Weather Observation Station 19
=================================
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values 
of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

*/
DECLARE @tbl_STATION AS TABLE (ID int, CITY VARCHAR(21),STATE VARCHAR(2),LAT_N decimal(18,4),LONG_W decimal(18,4))

INSERT INTO @tbl_STATION VALUES (1,'NY','NY',123.433343,1223.45)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',24.5444,324.234)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',37.345434,123.23)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',1234.43344,324.45)


SELECT  FORMAT(SQRT( POWER(MAX(LAT_N)  - MIN(LAT_N),  2)+ POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 'F4') FROM @tbl_STATION;

/*
Hacker Rank Submission
----------------------
SELECT  FORMAT(SQRT( POWER(MAX(LAT_N)  - MIN(LAT_N),  2)+ POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 'F4') FROM STATION;

*/