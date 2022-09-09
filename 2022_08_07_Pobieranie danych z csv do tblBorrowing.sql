USE [biblioteka]
;

-- tutaj zaczyna si� import z pliku C:\temp\test.txt do tabeli dbo.test
BULK INSERT [dbo].[tblBorrowing]
	FROM   'C:\PYTHON_BOOTCAMP_PROJEKTY\ProjektZaliczeniowyBiblioteka\Biblioteka\tblBorrowing.csv'
	WITH
	(   FIRSTROW = 2,
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n', 
		CODEPAGE =  'utf-8'  
	)
	
select * from [dbo].[tblBorrowing]