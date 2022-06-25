/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

CREATE TABLE Students (ID int, Name varchar(100))
CREATE TABLE Friends  (ID int, Friend_ID int)
CREATE TABLE Packages  (ID int, salary decimal(18,2))

INSERT INTO Students VALUES (1,'Ashley'),(2,'Samantha'),(3,'Julia'),(4,'Scarlet')
INSERT INTO Friends VALUES (1,2),(2,3),(3,4),(4,1)
INSERT INTO Packages VALUES (1,15.20),(2,10.06),(3,11.55),(4,12.12)


SELECT S.Name, Stu_P.salary AS Stu_Salary,FN_P.salary AS FN_Salary FROM Friends F
INNER JOIN Students S ON F.ID=S.ID
LEFT JOIN Packages Stu_P ON F.ID=Stu_P.ID
LEFT JOIN Packages FN_P ON F.Friend_ID=FN_P.ID
WHERE FN_P.salary>Stu_P.salary

SELECT S.Name FROM Friends F
INNER JOIN Students S ON F.ID=S.ID
LEFT JOIN Packages Stu_P ON F.ID=Stu_P.ID
LEFT JOIN Packages FN_P ON F.Friend_ID=FN_P.ID
WHERE FN_P.salary>Stu_P.salary
ORDER BY FN_P.salary


DROP TABLE Students
DROP TABLE Friends
DROP TABLE Packages
