/*
Weather Observation Station 20
=================================
A median is defined as a number separating the higher half of a data set from the lower half. Query the median 
of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

*/
DECLARE @tbl_STATION AS TABLE (ID int, CITY VARCHAR(21),STATE VARCHAR(2),LAT_N decimal(18,4),LONG_W decimal(18,4))

INSERT INTO @tbl_STATION VALUES (1,'NY','NY',123.433343,1223.45)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',24.5444,324.234)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',37.345434,123.23)
INSERT INTO @tbl_STATION VALUES (1,'NY','NY',1234.43344,324.45)


--SELECT  FORMAT(SQRT( POWER(MAX(LAT_N)  - MIN(LAT_N),  2)+ POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 'F4') FROM @tbl_STATION;
Select FORMAT(S.LAT_N,'F4') from @tbl_STATION AS S where (select count(Lat_N) from @tbl_STATION 
where Lat_N < S.LAT_N ) = (select count(Lat_N) from @tbl_STATION where Lat_N > S.LAT_N)

/*
Hacker Rank Submission
----------------------

SELECT FORMAT(S.LAT_N,'F4') FROM STATION AS S WHERE (SELECT COUNT(Lat_N) FROM STATION 
WHERE Lat_N < S.LAT_N ) = (SELECT COUNT(Lat_N) FROM STATION WHERE Lat_N > S.LAT_N)

*/