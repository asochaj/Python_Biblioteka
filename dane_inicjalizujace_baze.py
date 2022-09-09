"""Skrypt tworzy bazę danych o nazwie biblioteka oraz załadowuje wartości z plików csv"""

#Załadowanie bibliotek zewnętrznych
import pyodbc # Biblioteka do łączenia się po protokole ODBC
#  import pandas as pd


#ustawienie połączenia do bazy, poświwadczenia domenowe
db_mssql = pyodbc.connect("Driver={SQL Server Native Client 11.0};"
                          "Server=DELL-I-3793-01\SQLEXPRESS;"
                          "Database=master;"
                          "Trusted_Connection=yes;")

cursorMS = db_mssql.cursor() #definicja kursora

#skrypt do ręcznego uruchomienia w celu zdropowania i utworzenia bazy
#2022_08_08_Skrypt do tworzenia bazy biblioteka.sql

#załadowanie danych do tabeli tblAuthor
file1 = open("2022_08_07_Pobieranie danych z csv do tblAuthor.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblAuthor')

#załadowanie danych do tabeli tblAuthor_Book
file1 = open("2022_08_07_Pobieranie danych z csv do tblAuthor_Book.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblAuthor_Book')

#załadowanie danych do tabeli tblBook
file1 = open("2022_08_07_Pobieranie danych z csv do tblBook.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblBook')

#załadowanie danych do tabeli tblBooking
file1 = open("2022_08_07_Pobieranie danych z csv do tblBooking.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblBooking')

#załadowanie danych do tabeli tblBorrowing
file1 = open("2022_08_07_Pobieranie danych z csv do tblBorrowing.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblBorrowing')

#załadowanie danych do tabeli tblReview
file1 = open("2022_08_07_Pobieranie danych z csv do tblReview.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblReview')

#załadowanie danych do tabeli tblUser
file1 = open("2022_08_07_Pobieranie danych z csv do tblUser.sql","r")
zapytanie1 = file1.read()  #zapytanie tworzy bazę i zaczytuje dane
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('załadowano dane do tabeli tblUser')

#stworzenie widoku vReview
file1 = open("Tworzenie vReview.sql", "r")
zapytanie1 = file1.read()  #zapytanie tworzy widok vReciew
cursorMS.execute(zapytanie1)
cursorMS.commit()
print('Stworzono widok vReview')