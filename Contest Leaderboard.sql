/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, 
name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, 
then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/

CREATE TABLE Hackers (hacker_id int,name  varchar(100))
CREATE TABLE Submissions (submission_id  int,hacker_id  int, challenge_id  int, score int)

INSERT INTO Hackers VALUES (4071,'Rose'),(74842,'Lisa')
INSERT INTO Submissions VALUES 
(6943,4071,19797,95)
,(9951,4071,49593,43)
,(10036,4071,49593,96)
,(67194,74842,63132,76)
,(53795,74842,19797,29)

--SELECT * FROM Hackers
--SELECT * FROM Submissions


SELECT * FROM (SELECT tab.hacker_id,tab.name,SUM(tab.score) score FROM (SELECT S.hacker_id,H.name,S.challenge_id ,MAX(S.score) score FROM Submissions S
LEFT JOIN Hackers H ON S.hacker_id=H.hacker_id WHERE S.score>0
GROUP BY  S.hacker_id,H.name,S.challenge_id)tab GROUP BY tab.hacker_id,tab.name)tab2 ORDER BY tab2.score DESC, tab2.hacker_id ASC




DROP TABLE Hackers
DROP TABLE Submissions
