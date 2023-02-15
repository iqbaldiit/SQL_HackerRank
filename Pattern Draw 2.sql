/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
*/

DECLARE @points AS NVARCHAR(MAX)
DECLARE @inputNumber AS INT=20
DECLARE @pointNumber AS INT=0
DECLARE @index AS INT=0

WHILE @inputNumber>@pointNumber
BEGIN
	SET @points=''
	SET @index=0	
	WHILE @index<=@pointNumber
	BEGIN
		SET @points=@points+'* '
		SET @index=@index+1
	END
	print @points
	SET @pointNumber=@pointNumber+1
END


--SELECT @inputNumber
