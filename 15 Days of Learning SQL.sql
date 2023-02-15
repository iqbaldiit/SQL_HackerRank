/*
Julia conducted a 15 days of learning SQL contest. The start date of the contest wAS March 01, 2016 and the end date wAS March 15, 2016.

Write a query to print total number of unique hackers who made at leASt 1 submission each day (starting on the first day of the contest), 
and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker hAS 
a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, 
sorted BY the date.
*/

/*
Steps
1. Find out the hacker who hAS at leASt 1 submission each day.
2. Find out the hacker who hAS highest number of submission.
3. Find out the duplicate submission number bASed on hacker id
4. print the lowest hacker id FROM duplicates.
*/

CREATE TABLE Hackers (hacker_id int, name varchar(50))
CREATE TABLE Submissions (submission_date date, submission_id int, hacker_id int, score int)




INSERT INTO Hackers VALUES (15758,'Rose'),(20703,'Angela'),(36396,'Frank'),(38289,'Patrick'),(44065,'Lisa'),(53473,'Kimberly'),(62529,'Bonnie'),(79722,'Michael')
INSERT INTO Submissions VALUES 
('2016-03-01', 8494,20703,0),('2016-03-01', 22403,53473,15),('2016-03-01', 23965,79722,60),('2016-03-01', 30173,36396,70),('2016-03-02', 34928,20703,0)
,('2016-03-02', 38740,15758,60),('2016-03-02', 42769,79722,25),('2016-03-02', 44364,79722,60),('2016-03-03', 45440,20703,0),('2016-03-03', 49050,36396,75)
,('2016-03-03', 50273,79722,5),('2016-03-04', 50344,20703,0),('2016-03-04', 51360,44065,90),('2016-03-04', 54404,53473,65),('2016-03-04', 61533,79722,45)
,('2016-03-05', 72852,20703,0),('2016-03-05', 74546,38289,0),('2016-03-05', 76487,62529,0),('2016-03-05', 82439,36396,10),('2016-03-05', 90006,36396,40)
,('2016-03-06', 90404,20703,0)


--1. Max number of submission
--2. Each Day
--3. Lowest ID if duplicate

;WITH Result AS (
SELECT s.submission_date,
       h.hacker_id,
       h.name,
       COUNT( submission_id) AS cnt, 
       DENSE_RANK() OVER (PARTITION BY h.hacker_id ORDER BY submission_date) AS dtCount,
       DENSE_RANK() OVER (PARTITION BY submission_date ORDER BY COUNT(*) DESC,h.hacker_id ) AS rnk1   
FROM Hackers h INNER JOIN Submissions s on h.hacker_id=s.hacker_id
GROUP BY s.submission_date,h.hacker_id,h.name)
,Result2 AS (
SELECT Result.*,
       DENSE_RANK() OVER (PARTITION BY submission_date ORDER BY cnt DESC,hacker_id ) AS rnk2,
       COUNT( hacker_id) OVER (PARTITION BY submission_date) AS subCount 
FROM Result WHERE dtCount=DATEDIFF(DAY,'2016-03-01',submission_date)+1
        )
SELECT Result.submission_date,Result2.subCount,Result.hacker_id,Result.name 
FROM Result INNER JOIN Result2 on Result.submission_date=Result2.submission_date
WHERE Result2.rnk2=1 and Result.rnk1=1
ORDER BY 1

DROP TABLE Hackers
DROP TABLE Submissions





