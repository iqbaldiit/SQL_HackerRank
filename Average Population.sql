/*
Average Population
=================================
Query the average population for all cities in CITY, rounded down to the nearest integer.

*/

DECLARE @tbl_CITY AS TABLE (ID int, [Name] varchar(17),CountryCode varchar(3),District varchar(20),[Population] int)
INSERT INTO @tbl_CITY VALUES (1,'CITY1','001','DIS1',100000)
INSERT INTO @tbl_CITY VALUES (2,'CITY2','002','California',200000)
INSERT INTO @tbl_CITY VALUES (3,'CITY3','003','DIS3',300000)
INSERT INTO @tbl_CITY VALUES (4,'CITY4','004','California',400000)
INSERT INTO @tbl_CITY VALUES (5,'CITY5','005','DIS5',500000)

SELECT ROUND(AVG([Population]),0) AS TotalPopulation FROM @tbl_CITY

/*
Hacker Rank Submission
----------------------
SELECT ROUND(AVG([Population]),0) AS TotalPopulation FROM CITY

*/