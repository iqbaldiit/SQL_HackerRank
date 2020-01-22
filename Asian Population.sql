/*
Asian Population
=================================
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

*/

DECLARE @tbl_CITY AS TABLE (ID int, [Name] varchar(17),CountryCode varchar(3),District varchar(20),[Population] int)
DECLARE @tbl_COUNTRY AS TABLE (Code varchar(3), [Name] varchar(44),Continent varchar(13),Region varchar(25))

INSERT INTO @tbl_CITY VALUES (1,'CITY1','002','Dhaka',100000)
INSERT INTO @tbl_CITY VALUES (2,'CITY2','001','CTG',200000)
INSERT INTO @tbl_CITY VALUES (3,'CITY3','004','SYLHET',300000)
INSERT INTO @tbl_CITY VALUES (4,'CITY4','001','TOKYO',400000)
INSERT INTO @tbl_CITY VALUES (5,'CITY5','002','DIS5',500000)

INSERT INTO @tbl_COUNTRY VALUES ('001','BANGLADESH','ASIA','R1')
INSERT INTO @tbl_COUNTRY VALUES ('002','Jambia','Africa','R1')
INSERT INTO @tbl_COUNTRY VALUES ('003','JAPAN','ASIA','R1')
INSERT INTO @tbl_COUNTRY VALUES ('004','NEPAL','ASIA','R1')


SELECT SUM(C.[Population]) FROM @tbl_CITY C
WHERE C.CountryCode IN (SELECT Code FROM @tbl_COUNTRY WHERE Continent='Asia')


/*
Hacker Rank Submission
----------------------

SELECT SUM([Population]) FROM CITY C
WHERE C.CountryCode IN (SELECT Code FROM COUNTRY WHERE Continent='Asia')

*/