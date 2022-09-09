USE [biblioteka]
;

-- tutaj zaczyna si� import z pliku C:\temp\test.txt do tabeli dbo.test
BULK INSERT [dbo].[tblAuthor_Book]
	FROM   'C:\PYTHON_BOOTCAMP_PROJEKTY\ProjektZaliczeniowyBiblioteka\Biblioteka\tblAuthor_Book.csv'
	WITH
	(   FIRSTROW = 2,
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n', 
		CODEPAGE =  'utf-8'  
	)
	
select * from [dbo].[tblAuthor_Book]