/*
The Blunder
=============
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
but did not realize her keyboard's  key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:actual-miscalculated  average monthly salaries), and round it up to the next integer.
*/

DECLARE @tbl_Employees AS TABLE(ID int,[Name] varchar(50),Salary int)
INSERT INTO @tbl_Employees VALUES(1,'Kristeen',1420)
INSERT INTO @tbl_Employees VALUES(2,'Ashley',2006)
INSERT INTO @tbl_Employees VALUES(3,'Julia',2210)
INSERT INTO @tbl_Employees VALUES(4,'Maria',3000)


SELECT CAST(CEILING(AVG(CAST(Salary AS decimal(18,2)))- AVG(CAST(REPLACE(Salary,0,'') AS decimal(18,2)))) AS INT) AS ErrAmount FROM @tbl_Employees
/*
HackerRank Submission
----------------------
SELECT CAST(CEILING(AVG(CAST(Salary AS decimal(18,2)))- AVG(CAST(REPLACE(Salary,0,'') AS decimal(18,2)))) AS INT) 
AS ErrAmount FROM Employees

*/
