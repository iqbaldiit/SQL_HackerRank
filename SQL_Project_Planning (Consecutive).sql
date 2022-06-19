/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project. 
Samantha is interested in finding the total number of different projects completed.
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
If there is more than one project that have the same number of completion days, then order by the start date of the project.
*/

CREATE TABLE Projects (Task_ID int, Start_Date Date,End_Date Date)
INSERT INTO Projects VALUES 
(1, '2015-10-01','2015-10-02')
,(2, '2015-10-02','2015-10-03')
,(3, '2015-10-03','2015-10-04')
,(4, '2015-10-13','2015-10-14')
,(5, '2015-10-14','2015-10-15')
,(6, '2015-10-28','2015-10-29')
,(7, '2015-10-30','2015-10-31')

--SELECT * FROM Projects

SELECT tab2.Start_Date,tab2.End_Date FROM (SELECT tab.PStart_date,MIN(tab.Start_Date) AS Start_Date,MAX(tab.End_Date) AS End_Date,COUNT(tab.Task_ID) AS NoOfDays  FROM (SELECT P.*, RANK() OVER (ORDER BY P.End_Date) AS Row_Id 
,DATEADD(DAY,-RANK()OVER (ORDER BY P.End_Date),P.End_Date) AS PStart_date
FROM Projects P)tab GROUP BY tab.PStart_date)tab2 ORDER BY tab2.NoOfDays,tab2.Start_Date


DROP TABLE Projects