/*
The Count Function
=================================
Query a count of the number of cities in CITY having a Population larger than 100,000.

*/

DECLARE @tbl_CITY AS TABLE (ID int, [Name] varchar(17),CountryCode varchar(3),District varchar(20),[Population] int)
INSERT INTO @tbl_CITY VALUES (1,'CITY1','001','DIS1',100000)
INSERT INTO @tbl_CITY VALUES (2,'CITY2','002','DIS2',200000)
INSERT INTO @tbl_CITY VALUES (3,'CITY3','003','DIS3',300000)
INSERT INTO @tbl_CITY VALUES (4,'CITY4','004','DIS4',400000)
INSERT INTO @tbl_CITY VALUES (5,'CITY5','005','DIS5',500000)

SELECT COUNT(*) FROM @tbl_CITY WHERE [Population]>100000

/*
Hacker Rank Submission
----------------------
SELECT COUNT(*) FROM CITY WHERE [Population]>100000

*/