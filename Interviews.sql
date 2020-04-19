/*
Interviews
=================================
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, 
hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest 
sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

*/

DECLARE @tbl_Contests AS TABLE (contest_id int,hacker_id int, [name] varchar(50) )
DECLARE @tbl_Colleges AS TABLE (college_id int, contest_id int)
DECLARE @tbl_Challenges AS TABLE (challenge_id int,college_id int)
DECLARE @tbl_View_Stats AS TABLE (challenge_id int,total_views int,total_unique_views int)
DECLARE @tbl_Submission_Stats AS TABLE (challenge_id int,total_submissions int,total_accepted_submissions int)



INSERT INTO @tbl_Contests VALUES (66406,17973,'Rose')
INSERT INTO @tbl_Contests VALUES (66556,79153,'Angela')
INSERT INTO @tbl_Contests VALUES (94828,80275,'Frank')

INSERT INTO @tbl_Colleges VALUES (11219,66406)
INSERT INTO @tbl_Colleges VALUES (32473,66556)
INSERT INTO @tbl_Colleges VALUES (56685,94828)

INSERT INTO @tbl_Challenges VALUES (18765,11219)
INSERT INTO @tbl_Challenges VALUES (47127,11219)
INSERT INTO @tbl_Challenges VALUES (60292,32473)
INSERT INTO @tbl_Challenges VALUES (72974,56685)


INSERT INTO @tbl_View_Stats VALUES (47127,26,19)
INSERT INTO @tbl_View_Stats VALUES (47127,15,14)
INSERT INTO @tbl_View_Stats VALUES (18765,43,10)
INSERT INTO @tbl_View_Stats VALUES (47127,72,13)
INSERT INTO @tbl_View_Stats VALUES (75516,35,17)
INSERT INTO @tbl_View_Stats VALUES (60292,11,10)
INSERT INTO @tbl_View_Stats VALUES (72974,41,15)
INSERT INTO @tbl_View_Stats VALUES (75516,75,11)


INSERT INTO @tbl_Submission_Stats VALUES (75516,34,12)
INSERT INTO @tbl_Submission_Stats VALUES (47127,27,10)
INSERT INTO @tbl_Submission_Stats VALUES (47127,56,18)
INSERT INTO @tbl_Submission_Stats VALUES (75516,74,12)
INSERT INTO @tbl_Submission_Stats VALUES (75516,83,8)
INSERT INTO @tbl_Submission_Stats VALUES (72974,68,24)
INSERT INTO @tbl_Submission_Stats VALUES (72974,82,14)
INSERT INTO @tbl_Submission_Stats VALUES (47127,28,11)


SELECT con.contest_id,con.hacker_id,con.[name]
,SUM(ISNULL(ss.total_submissions,0)) as total_submissions
,SUM(ISNULL(ss.total_accepted_submissions,0)) AS total_accepted_submissions
,SUM(ISNULL(vs.total_views,0)) AS total_views,SUM(ISNULL(vs.total_unique_views,0)) AS total_unique_views
FROM @tbl_Contests con
LEFT JOIN @tbl_Colleges col ON con.contest_id=col.contest_id
LEFT JOIN @tbl_Challenges cha ON col.college_id=cha.college_id
LEFT JOIN (SELECT challenge_id
					,SUM(total_submissions) AS total_submissions
					,SUM(total_accepted_submissions) AS total_accepted_submissions 
					FROM @tbl_Submission_Stats GROUP BY challenge_id) ss ON ss.challenge_id=cha.challenge_id

LEFT JOIN (SELECT challenge_id
					,SUM(total_views) AS total_views
					,SUM(total_unique_views) AS total_unique_views 
					FROM @tbl_View_Stats GROUP BY challenge_id) vs ON vs.challenge_id=cha.challenge_id
GROUP BY con.contest_id,con.hacker_id,con.[name] HAVING
SUM(ISNULL(ss.total_submissions,0))+ SUM(ISNULL(ss.total_accepted_submissions,0))
+SUM(ISNULL(vs.total_views,0))+SUM(ISNULL(vs.total_unique_views,0))>0
ORDER BY con.contest_id




/*
Hacker Rank Submission
----------------------

SELECT con.contest_id,con.hacker_id,con.[name]
,SUM(ISNULL(ss.total_submissions,0)) as total_submissions
,SUM(ISNULL(ss.total_accepted_submissions,0)) AS total_accepted_submissions
,SUM(ISNULL(vs.total_views,0)) AS total_views,SUM(ISNULL(vs.total_unique_views,0)) AS total_unique_views
FROM Contests con
LEFT JOIN Colleges col ON con.contest_id=col.contest_id
LEFT JOIN Challenges cha ON col.college_id=cha.college_id
LEFT JOIN (SELECT challenge_id
					,SUM(total_submissions) AS total_submissions
					,SUM(total_accepted_submissions) AS total_accepted_submissions 
					FROM Submission_Stats GROUP BY challenge_id) ss ON ss.challenge_id=cha.challenge_id

LEFT JOIN (SELECT challenge_id
					,SUM(total_views) AS total_views
					,SUM(total_unique_views) AS total_unique_views 
					FROM View_Stats GROUP BY challenge_id) vs ON vs.challenge_id=cha.challenge_id
GROUP BY con.contest_id,con.hacker_id,con.[name]HAVING
SUM(ISNULL(ss.total_submissions,0))+ SUM(ISNULL(ss.total_accepted_submissions,0))
+SUM(ISNULL(vs.total_views,0))+SUM(ISNULL(vs.total_unique_views,0))>0
ORDER BY con.contest_id

*/