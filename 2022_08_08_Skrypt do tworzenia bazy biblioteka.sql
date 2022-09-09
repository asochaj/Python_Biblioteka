USE master;

-- #####Je�li baza o nazwie nie istnieje to j�tworzy, j�sli istnieje to j� usuwa i tworzy now� o nazwie biblioteka#####
IF NOT EXISTS ( SELECT * FROM sys.databases WHERE name = 'biblioteka' )
	BEGIN
		CREATE DATABASE [biblioteka]
	END;

ELSE
	BEGIN
		EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'biblioteka';
		
		use [biblioteka];
		
		use [master];
		
		USE [master];
		
		ALTER DATABASE [biblioteka] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE;
		
		USE [master];
		
		/****** Object:  Database [biblioteka]    Script Date: 07.08.2022 22:11:18 ******/
		DROP DATABASE [biblioteka];
		
		CREATE DATABASE [biblioteka];
		
	END;

-- #####Tworzenie zestawu tabel i powi�za� pomi�dzy atrybutami #####
-- nale�y wyeksportowa� widok z programu db diagram do SSMS, usun�� wszystkie GO i przeklei� kod mi�dzy BEGI i END

USE [biblioteka]
;


BEGIN

	CREATE TABLE [tblUser] (
	  [user_id] int PRIMARY KEY IDENTITY(1, 1),
	  [name] nvarchar(100),
	  [surname] nvarchar(100),
	  [birth_date] date,
	  [email] nvarchar(100),
	  [password] nvarchar(30),
	  [phone] nvarchar(20),
	  [gender] nvarchar(1),
	  [city] nvarchar(30),
	  [street] nvarchar(30),
	  [house_no] nvarchar(10),
	  [librarian] int,
	  [false_login_counter] int,
	  [false_login_date] date
	)


	CREATE TABLE [tblBook] (
	  [book_id] int PRIMARY KEY IDENTITY(1, 1),
	  [ISBN] nvarchar(30),
	  [title] nvarchar(200),
	  [pages] int,
	  [cover] varchar(1),
	  [book_genre] nvarchar(50),
	  [thumbnail] nvarchar(200),
	  [publisher] nvarchar(50),
	  [published_year] int,
	  [description] nvarchar(1500),
	  [state] int
	)


	CREATE TABLE [tblAuthor] (
	  [author_id] int PRIMARY KEY IDENTITY(1, 1),
	  [name] nvarchar(100),
	  [birth_date] date,
	  [biography] nvarchar(200)
	)


	CREATE TABLE [tblAuthor_Book] (
	  [autor_book_id] int PRIMARY KEY IDENTITY(1, 1),
	  [author_id] int,
	  [book_id] int
	)


	CREATE TABLE [tblBooking] (
	  [booking_id] int PRIMARY KEY IDENTITY(1, 1),
	  [user_id] int,
	  [book_id] int,
	  [starttime] date,
	  [endtime] date
	)


	CREATE TABLE [tblBorrowing] (
	  [boorrow_id] int PRIMARY KEY IDENTITY(1, 1),
	  [user_id] int,
	  [book_id] int,
	  [starttime] date,
	  [endtime] date
	)


	CREATE TABLE [tblReview] (
	  [review_id] int PRIMARY KEY IDENTITY(1, 1),
	  [book_id] int,
	  [user_id] int,
	  [stars] float,
	  [review] nvarchar(100)
	)
	



	ALTER TABLE [tblBorrowing] ADD FOREIGN KEY ([user_id]) REFERENCES [tblUser] ([user_id]) ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE [tblBorrowing] ADD FOREIGN KEY ([book_id]) REFERENCES [tblBook] ([book_id])  ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE [tblBooking] ADD FOREIGN KEY ([user_id]) REFERENCES [tblUser] ([user_id])  ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE [tblBooking] ADD FOREIGN KEY ([book_id]) REFERENCES [tblBook] ([book_id])  ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE [tblReview] ADD FOREIGN KEY ([book_id]) REFERENCES [tblBook] ([book_id])  ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE [tblReview] ADD FOREIGN KEY ([user_id]) REFERENCES [tblUser] ([user_id])  ON DELETE CASCADE ON UPDATE CASCADE;


	ALTER TABLE [tblAuthor_Book] ADD FOREIGN KEY ([book_id]) REFERENCES [tblBook] ([book_id])  ON DELETE CASCADE ON UPDATE CASCADE;


CREATE VIEW [dbo].[vReview]
AS
SELECT        dbo.tblReview.review_id, dbo.tblReview.stars, dbo.tblReview.review, dbo.tblBook.title, dbo.tblBook.ISBN, dbo.tblUser.name, dbo.tblUser.surname, dbo.tblReview.book_id
FROM            dbo.tblReview INNER JOIN
                         dbo.tblUser ON dbo.tblReview.user_id = dbo.tblUser.user_id INNER JOIN
                         dbo.tblBook ON dbo.tblReview.book_id = dbo.tblBook.book_id
GO


END;