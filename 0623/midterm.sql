CREATE TABLE tabletest( 
dis NVARCHAR(MAX), 
sta NVARCHAR(MAX), 
address NVARCHAR(MAX),
das NVARCHAR(MAX),
state NVARCHAR(MAX),
cha NVARCHAR(MAX),
fee NVARCHAR(MAX),
way NVARCHAR(MAX),
ope NVARCHAR(MAX),
sty NVARCHAR(MAX),
no NVARCHAR(MAX)
) 

BULK INSERT CSVTable 
FROM 'D:\csv.txt' 
WITH( 
FIELDTERMINATOR = ',', 
ROWTERMINATOR = '\n' 
) 
SELECT * FROM tabletest