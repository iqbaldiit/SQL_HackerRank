/*
Japan Population
=================================
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

*/

DECLARE @tbl_CITY AS TABLE (ID int, [Name] varchar(17),CountryCode varchar(3),District varchar(20),[Population] int)
INSERT INTO @tbl_CITY VALUES (1,'CITY1','001','DIS1',100000)
INSERT INTO @tbl_CITY VALUES (2,'CITY2','JPN','California',200000)
INSERT INTO @tbl_CITY VALUES (3,'CITY3','JPN','DIS3',300000)
INSERT INTO @tbl_CITY VALUES (4,'CITY4','004','California',400000)
INSERT INTO @tbl_CITY VALUES (5,'CITY5','JPN','DIS5',500000)

SELECT SUM([Population]) AS Pop FROM @tbl_CITY WHERE CountryCode='JPN'

/*
Hacker Rank Submission
----------------------
SELECT SUM([Population]) AS Pop FROM CITY WHERE CountryCode='JPN';

*/