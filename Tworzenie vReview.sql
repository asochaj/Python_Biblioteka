CREATE VIEW [dbo].[vReview]
AS
SELECT        dbo.tblReview.review_id, dbo.tblReview.stars, dbo.tblReview.review, dbo.tblBook.title, dbo.tblBook.ISBN, dbo.tblUser.name, dbo.tblUser.surname, dbo.tblReview.book_id
FROM            dbo.tblReview INNER JOIN
                         dbo.tblUser ON dbo.tblReview.user_id = dbo.tblUser.user_id INNER JOIN
                     dbo.tblBook ON dbo.tblReview.book_id = dbo.tblBook.book_id