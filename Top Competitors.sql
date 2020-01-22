/*
Top Competitors
=================================
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the 
respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending 
order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores 
in same number of challenges, then sort them by ascending hacker_id.

*/

DECLARE @tbl_Hackers AS TABLE (hacker_id int, [Name] varchar(20))
DECLARE @tbl_Difficulty AS TABLE (difficulty_level int, [score] int)
DECLARE @tbl_Challenges AS TABLE (challenge_id int,hacker_id int ,difficulty_level int)
DECLARE @tbl_Submissions AS TABLE (submission_id int,hacker_id int,challenge_id int,score int)


INSERT INTO @tbl_Hackers VALUES (5580, 'Rose')
INSERT INTO @tbl_Hackers VALUES (4839, 'Angela')
INSERT INTO @tbl_Hackers VALUES (27205, 'Frank')
INSERT INTO @tbl_Hackers VALUES (52243, 'Patrik')
INSERT INTO @tbl_Hackers VALUES (52348, 'Lisa')
INSERT INTO @tbl_Hackers VALUES (57645, 'Kimberly')
INSERT INTO @tbl_Hackers VALUES (77726, 'Bonnie')
INSERT INTO @tbl_Hackers VALUES (83082, 'Micheal')
INSERT INTO @tbl_Hackers VALUES (86870, 'Todd')
INSERT INTO @tbl_Hackers VALUES (90411, 'Joe')

INSERT INTO @tbl_Difficulty VALUES (1, 20)
INSERT INTO @tbl_Difficulty VALUES (2, 30)
INSERT INTO @tbl_Difficulty VALUES (3, 40)
INSERT INTO @tbl_Difficulty VALUES (4, 60)
INSERT INTO @tbl_Difficulty VALUES (5, 80)
INSERT INTO @tbl_Difficulty VALUES (6, 100)
INSERT INTO @tbl_Difficulty VALUES (7, 120)
INSERT INTO @tbl_Difficulty VALUES (8, 140)

INSERT INTO @tbl_Challenges VALUES (4810, 77726,4)
INSERT INTO @tbl_Challenges VALUES (21089,27205,1)
INSERT INTO @tbl_Challenges VALUES (36566,5580,7)
INSERT INTO @tbl_Challenges VALUES (66730,52243,6)
INSERT INTO @tbl_Challenges VALUES (71055,52243,2)


INSERT INTO @tbl_Submissions VALUES (94613,86870,71055,30)
INSERT INTO @tbl_Submissions VALUES (97431,90411,71055,30)
INSERT INTO @tbl_Submissions VALUES (97397,90411,66730,100)

SELECT tab.hacker_id,tab.[Name] FROM (SELECT S.hacker_id,H.[Name],COUNT (S.hacker_id) AS sCount  FROM @tbl_Submissions S
INNER JOIN @tbl_Challenges C ON S.challenge_id=C.challenge_id
INNER JOIN @tbl_Difficulty D ON C.difficulty_level=D.difficulty_level
INNER JOIN @tbl_Hackers H ON S.hacker_id=H.hacker_id 
WHERE S.score=D.score GROUP BY S.hacker_id,H.[Name] HAVING COUNT (S.hacker_id)>1)tab Order By tab.sCount DESC,tab.hacker_id ASC


/*
Hacker Rank Submission
----------------------

SELECT tab.hacker_id,tab.[Name] FROM (SELECT S.hacker_id,H.[Name],COUNT (S.hacker_id) AS sCount  FROM Submissions S
INNER JOIN Challenges C ON S.challenge_id=C.challenge_id
INNER JOIN Difficulty D ON C.difficulty_level=D.difficulty_level
INNER JOIN Hackers H ON S.hacker_id=H.hacker_id 
WHERE S.score=D.score GROUP BY S.hacker_id,H.[Name] HAVING COUNT (S.hacker_id)>1)tab Order By tab.sCount DESC,tab.hacker_id ASC

*/