USE Northwind
------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- TA muốn sắp xếp dữ liệu/ sort theo tiêu chí nào đó, thường là tăng dần - ASCENDING/ASC
--																 GIẢM dần - DESCENDING/DESC
-- MẶC ĐỊNH KO NÓI GÌ THÌ LÀ SORT TĂNG DẦN

--SELECT ... FROM <TÊN-TABLE> ORDER BY TÊN-CỘT MUỐN SORT <KIỂU SORT>

------------------------------------------------------------------------

--1. In ra danh sách nv

SELECT * FROM Employees

--2. In ra ds nv tăng dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate ASC

--3. In ra ds nv giảm dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate DESC

--4. Tính tiền chi tiết mua hàng 
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS Subtotal FROM [Order Details]

--5. Tính tiền chi tiết mua hàng, sắp xếp giảm dần theo số tiền
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS Subtotal FROM [Order Details]
				ORDER BY Subtotal DESC	

--6. In ra danh sách nhân viên giảm dần theo tuổi
SELECT * FROM Employees
SELECT EmployeeID, FirstName, LastName, BirthDate, YEAR(GETDATE()) - YEAR(BirthDate) AS Age FROM Employees ORDER BY Age DESC 
