USE [biblioteka]
;

-- tutaj zaczyna si� import z pliku C:\temp\test.txt do tabeli dbo.test
BULK INSERT [dbo].[tblUser]
	FROM   'C:\PYTHON_BOOTCAMP_PROJEKTY\ProjektZaliczeniowyBiblioteka\Biblioteka\tblUser.csv'
	WITH
	(   FIRSTROW = 2,
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n', 
		CODEPAGE =  'utf-8'  
	)
	
select * from [dbo].[tblUser]