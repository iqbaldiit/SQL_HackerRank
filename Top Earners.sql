/*
We define an employee's total earnings to be their monthly salary*months  worked, and the maximum total earnings to be the maximum total earnings 
for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total 
number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
*/

DECLARE @tbl_Employee AS TABLE (employee_is int,[name] varchar(50),months int, salary int)

INSERT INTO @tbl_Employee VALUES(1,'rose',15,1968)
INSERT INTO @tbl_Employee VALUES(2,'angela',1,3443)
INSERT INTO @tbl_Employee VALUES(3,'frank',17,1608)
INSERT INTO @tbl_Employee VALUES(4,'patrick',7,1345)
INSERT INTO @tbl_Employee VALUES(5,'lisa',11,2330)
INSERT INTO @tbl_Employee VALUES(6,'kimberly',16,4372)
INSERT INTO @tbl_Employee VALUES(7,'bonnie',8,1771)
INSERT INTO @tbl_Employee VALUES(8,'michael',6,2017)
INSERT INTO @tbl_Employee VALUES(9,'todd',5,3396)
INSERT INTO @tbl_Employee VALUES(10,'joe',9,3573)

SELECT *, (SELECT COUNT(*) FROM @tbl_Employee WHERE months*salary =tab.earnings)
FROM (SELECT MAX(months*salary) AS earnings
FROM @tbl_Employee)tab

/*
Hacker Rank Submission
----------------------
SELECT *, (SELECT COUNT(*) FROM Employee WHERE months*salary =tab.earnings)
FROM (SELECT MAX(months*salary) AS earnings
FROM Employee)tab

*/