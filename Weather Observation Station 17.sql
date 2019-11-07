/*
Weather Observation Station 17
=================================
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. 
Round your answer to 4 decimal places.
*/

DECLARE @tbl_STATION AS TABLE (ID int, CITY VARCHAR(21),STATE VARCHAR(2),LAT_N decimal(18,4),LONG_W decimal(18,4))

INSERT INTO @tbl_STATION VALUES (1,'NY','NY',123.433343,1223.45)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',24.5444,324.234)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',37.345434,123.23)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',1234.43344,324.45)

SELECT CONVERT(DECIMAL(18,4),LONG_W) FROM @tbl_STATION WHERE LAT_N IN (SELECT MIN(LAT_N) FROM @tbl_STATION WHERE LAT_N >38.7780)

/*
Hacker Rank Submission
----------------------
SELECT CONVERT(DECIMAL(18,4),LONG_W) FROM STATION WHERE LAT_N IN (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N >38.7780)

*/
