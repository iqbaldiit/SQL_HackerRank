/*
Ollivander's Inventory
=================================
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of 
high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order 
of descending power. If more than one wand has same power, sort the result in order of descending age.

*/

DECLARE @tbl_Wands AS TABLE (ID int, [Code] int,coins_needed int,[power] int)
DECLARE @tbl_Wands_Property AS TABLE (Code int, [age] int,[is_evil] int)

INSERT INTO @tbl_Wands VALUES (1,4,3688,8)
INSERT INTO @tbl_Wands VALUES (2,3,9365,3)
INSERT INTO @tbl_Wands VALUES (3,3,7187,10)
INSERT INTO @tbl_Wands VALUES (4,3,734,8)
INSERT INTO @tbl_Wands VALUES (5,1,6020,2)
INSERT INTO @tbl_Wands VALUES (6,2,6773,7)
INSERT INTO @tbl_Wands VALUES (7,3,9873,9)
INSERT INTO @tbl_Wands VALUES (8,3,7721,7)
INSERT INTO @tbl_Wands VALUES (9,1,1647,10)
INSERT INTO @tbl_Wands VALUES (10,4,504,5)
INSERT INTO @tbl_Wands VALUES (11,2,7587,5)
INSERT INTO @tbl_Wands VALUES (12,5,9897,10)
INSERT INTO @tbl_Wands VALUES (13,3,4652,8)
INSERT INTO @tbl_Wands VALUES (14,2,5408,1)
INSERT INTO @tbl_Wands VALUES (15,2,3688,7)
INSERT INTO @tbl_Wands VALUES (16,4,6018,5)
INSERT INTO @tbl_Wands VALUES (17,2,7710,7)
INSERT INTO @tbl_Wands VALUES (18,2,8798,3)
INSERT INTO @tbl_Wands VALUES (19,4,3312,6)
INSERT INTO @tbl_Wands VALUES (20,5,7651,3)

INSERT INTO @tbl_Wands_Property VALUES (1,45,0)
INSERT INTO @tbl_Wands_Property VALUES (2,40,0)
INSERT INTO @tbl_Wands_Property VALUES (3,4,1)
INSERT INTO @tbl_Wands_Property VALUES (4,20,0)
INSERT INTO @tbl_Wands_Property VALUES (5,17,0)


SELECT w.ID,p.age,t.coins_needed,t.[power] FROM (SELECT Code,[power],MIN(coins_needed) as coins_needed FROM @tbl_Wands GROUP BY Code,[power])t
LEFT JOIN @tbl_Wands w ON t.Code=w.Code AND t.[power]=w.[power] AND t.coins_needed=w.coins_needed
LEFT JOIN @tbl_Wands_Property p ON t.Code=p.Code
WHERE p.is_evil=0 ORDER BY t.[power] DESC, p.age DESC



--SELECT W.ID,p.age,W.coins_needed,W.[power] 
--FROM @tbl_Wands AS W
--LEFT JOIN @tbl_Wands_Property P ON W.Code=P.Code 
--WHERE P.is_evil=0


/*
Hacker Rank Submission
----------------------

SELECT w.ID,p.age,t.coins_needed,t.[power] FROM (SELECT Code,[power],MIN(coins_needed) as coins_needed FROM Wands GROUP BY Code,[power])t
LEFT JOIN Wands w ON t.Code=w.Code AND t.[power]=w.[power] AND t.coins_needed=w.coins_needed
LEFT JOIN Wands_Property p ON t.Code=p.Code
WHERE p.is_evil=0 ORDER BY t.[power] DESC, p.age DESC

*/