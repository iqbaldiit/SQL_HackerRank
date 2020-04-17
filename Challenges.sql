/*
Challenges
=================================
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges 
created by each student. Sort your results by the total number of challenges in descending order. If more than one student created 
the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges 
and the count is less than the maximum number of challenges created, then exclude those students from the result.

*/

DECLARE @tbl_Hackers AS TABLE (hacker_id int, [name] varchar(50) )
DECLARE @tbl_Challenges AS TABLE (challenge_id int, hacker_id int)

INSERT INTO @tbl_Hackers VALUES (12299,'Rose')
INSERT INTO @tbl_Hackers VALUES (34856,'Angela')
INSERT INTO @tbl_Hackers VALUES (79345,'Frank')
INSERT INTO @tbl_Hackers VALUES (80491,'Patrick')
INSERT INTO @tbl_Hackers VALUES (81041,'Lisa')


INSERT INTO @tbl_Challenges VALUES (63693,81041)
INSERT INTO @tbl_Challenges VALUES (63117,79345)
INSERT INTO @tbl_Challenges VALUES (28225,34856)
INSERT INTO @tbl_Challenges VALUES (21989,12299)
INSERT INTO @tbl_Challenges VALUES (4653,12299)
INSERT INTO @tbl_Challenges VALUES (70070,79345)
INSERT INTO @tbl_Challenges VALUES (36905,34856)
INSERT INTO @tbl_Challenges VALUES (61136,80491)
INSERT INTO @tbl_Challenges VALUES (17234,12299)
INSERT INTO @tbl_Challenges VALUES (80308,79345)
INSERT INTO @tbl_Challenges VALUES (40510,34856)
INSERT INTO @tbl_Challenges VALUES (79820,80491)
INSERT INTO @tbl_Challenges VALUES (22720,12299)
INSERT INTO @tbl_Challenges VALUES (21394,12299)
INSERT INTO @tbl_Challenges VALUES (36261,34856)
INSERT INTO @tbl_Challenges VALUES (15334,12299)
INSERT INTO @tbl_Challenges VALUES (71435,79345)
INSERT INTO @tbl_Challenges VALUES (23157,34856)
INSERT INTO @tbl_Challenges VALUES (54102,34856)
INSERT INTO @tbl_Challenges VALUES (69065,81041)



--SELECT (SELECT t1.* FROM (SELECT C.hacker_id,H.[name],COUNT(C.challenge_id) AS challenges_created FROM @tbl_Challenges C
--LEFT JOIN @tbl_Hackers H ON C.hacker_id=H.hacker_id
--GROUP BY C.hacker_id,H.[name])t1 ORDER BY t1.challenges_created DESC, t1.hacker_id ASC)


SELECT C.Hacker_id, H.Name, COUNT(challenge_id)
FROM @tbl_Hackers H INNER JOIN @tbl_Challenges C
ON H.Hacker_Id = C.Hacker_Id
GROUP BY C.Hacker_Id, H.Name
HAVING COUNT(challenge_id) not in (
SELECT x.ChallengeCount FROM (  
        SELECT C.Hacker_id, H.Name, COUNT(challenge_id) AS ChallengeCount
        FROM @tbl_Hackers H Inner Join @tbl_Challenges C
        ON H.Hacker_Id = C.Hacker_Id
        GROUP BY C.Hacker_Id, H.Name
     ) x
WHERE x.ChallengeCount <> (SELECT top 1 COUNT(challenge_id) FROM @tbl_Challenges GROUP BY hacker_Id ORDER BY 1 DESC) 
GROUP BY x.ChallengeCount
HAVING COUNT(x.challengecount) > 1)
ORDER BY 3 DESC, 1




/*
Hacker Rank Submission
----------------------

SELECT C.Hacker_id, H.Name, COUNT(challenge_id)
FROM Hackers H INNER JOIN Challenges C
ON H.Hacker_Id = C.Hacker_Id
GROUP BY C.Hacker_Id, H.Name
HAVING COUNT(challenge_id) not in (
SELECT x.ChallengeCount FROM (  
        SELECT C.Hacker_id, H.Name, COUNT(challenge_id) AS ChallengeCount
        FROM Hackers H Inner Join Challenges C
        ON H.Hacker_Id = C.Hacker_Id
        GROUP BY C.Hacker_Id, H.Name
     ) x
WHERE x.ChallengeCount <> (SELECT top 1 COUNT(challenge_id) FROM Challenges GROUP BY hacker_Id ORDER BY 1 DESC) 
GROUP BY x.ChallengeCount
HAVING COUNT(x.challengecount) > 1)
ORDER BY 3 DESC, 1

*/