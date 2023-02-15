/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
*/

DECLARE @points AS NVARCHAR(MAX)
DECLARE @inputNumber AS INT=5
DECLARE @pointNumber AS INT=@inputNumber

WHILE @inputNumber>0
BEGIN
	SET @points=''
	SET @pointNumber=@inputNumber
	
	WHILE @pointNumber>0
	BEGIN
		SET @points=@points+'* '
		SET @pointNumber=@pointNumber-1
	END
	print @points
	SET @inputNumber=@inputNumber-1
END

--SELECT @inputNumber
