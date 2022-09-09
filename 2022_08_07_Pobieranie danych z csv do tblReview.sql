USE [biblioteka]
;

-- tutaj zaczyna si� import z pliku C:\temp\test.txt do tabeli dbo.test
BULK INSERT [dbo].[tblReview]
	FROM   'C:\PYTHON_BOOTCAMP_PROJEKTY\ProjektZaliczeniowyBiblioteka\Biblioteka\tblReview.csv'
	WITH
	(   FIRSTROW = 2,
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n', 
		CODEPAGE =  'utf-8'  
	)
	
select * from [dbo].[tblReview]