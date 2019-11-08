/*
Weather Observation Station 18
=================================
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

 1. a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 2. b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 3. c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 4. d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

*/
DECLARE @tbl_STATION AS TABLE (ID int, CITY VARCHAR(21),STATE VARCHAR(2),LAT_N decimal(18,4),LONG_W decimal(18,4))

INSERT INTO @tbl_STATION VALUES (1,'NY','NY',123.433343,1223.45)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',24.5444,324.234)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',37.345434,123.23)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',1234.43344,324.45)

SELECT FORMAT(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),'F4') FROM @tbl_STATION;

/*
Hacker Rank Submission
----------------------
SELECT FORMAT(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),'F4') FROM STATION;

*/