/*
Average Population of Each Continent
=================================
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

*/

DECLARE @tbl_CITY AS TABLE (ID int, [Name] varchar(17),CountryCode varchar(3),District varchar(20),[Population] int)
DECLARE @tbl_COUNTRY AS TABLE (Code varchar(3), [Name] varchar(44),Continent varchar(13),Region varchar(25))

INSERT INTO @tbl_CITY VALUES (1,'CITY1','002','DIS1',100000)
INSERT INTO @tbl_CITY VALUES (2,'CITY2','001','California',200000)
INSERT INTO @tbl_CITY VALUES (3,'CITY3','004','DIS3',300000)
INSERT INTO @tbl_CITY VALUES (4,'CITY4','001','California',400000)
INSERT INTO @tbl_CITY VALUES (5,'CITY5','002','DIS5',500000)

INSERT INTO @tbl_COUNTRY VALUES ('001','USA','America','R1')
INSERT INTO @tbl_COUNTRY VALUES ('002','Jambia','Africa','R1')
INSERT INTO @tbl_COUNTRY VALUES ('003','CANADA','America','R1')
INSERT INTO @tbl_COUNTRY VALUES ('004','Namibia','Africa','R1')


SELECT CON.Continent,FLOOR(AVG(C.[Population])) FROM @tbl_CITY C
INNER JOIN @tbl_COUNTRY CON ON C.CountryCode=Con.Code
GROUP BY CON.Continent


/*
Hacker Rank Submission
----------------------

SELECT CON.Continent,FLOOR(AVG(C.[Population])) FROM CITY C
INNER JOIN COUNTRY CON ON C.CountryCode=Con.Code
GROUP BY CON.Continent

*/