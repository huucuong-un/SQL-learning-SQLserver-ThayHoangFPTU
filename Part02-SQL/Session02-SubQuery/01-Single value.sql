USE	Northwind

--------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP CHUẨN SELECT
-- SELECT * FROM <TABLE> WHERE...
-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT LIKE PATTERN NÀO ĐÓ
-- WHERE CỘT BETWEEN RANGE
-- WHERE CỘT IN (TẬP HỢP GIÁ TRỊ ĐC LIỆT KÊ)

-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 VALUE/CELL

-- MỘT CÂU SELECT TÙY CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 TẬP GIÁ TRỊ/CELL
-- TẬP KẾT QUẢ NÀY ĐỒNG NHẤT (CÁC GIÁ TRỊ KHÁC NHAU CỦA 1 BIẾN)
-------------------------------------------------------------------------- 

--1. IN RA DANH SACH NHAN VIEN
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID = 1
SELECT FirstName FROM Employees 

--2. Liệt kê các nhân viên ở London
SELECT * FROM Employees WHERE City = 'London' 

--3. liet ke cac nhan vien cung que voi King Robert
SELECT * FROM Employees WHERE City = (SELECT City FROM Employees WHERE FirstName = 'Robert') AND FirstName <> 'Robert'

--4. Liệt kê các đơn hàng
SELECT * FROM Orders ORDER BY Freight DESC

--4.1. Liệt kê các đơn hàng trọng lượng lớn hơn 252kg
SELECT * FROM Orders  WHERE Freight > 252 ORDER BY Freight DESC


--4.1. Liệt kê các đơn hàng trọng lượng lớn hơn trọng lương đơn hàng 10555
SELECT * FROM Orders WHERE Freight > ( SELECT Freight FROM Orders WHERE OrderID = 10555) 
										AND OrderID <> 10555 ORDER BY Freight DESC


--1. Liệt kê danh sách các công ty chuyển hàng
SELECT * FROM Shippers
--2. Liệt kê các đơn hàng đc vận chuyển bởi công ty giao vận có mã số 1
SELECT * FROM Orders WHERE ShipVia = 1 

--4. Liệt kê các đơn hàng đc vận chuyển bởi công ty giao vận Speedy Express
SELECT * FROM Orders WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')
						AND Freight BETWEEN 50 AND 100

SELECT * FROM Orders WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')
						AND Freight >=50 AND Freight <= 100

--5. Chủng loại của Filo Mix

SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Products WHERE CategoryID = (SELECT CategoryID FROM Products WHERE ProductName = 'Filo Mix')


--6. Liệt kê nhân viên trẻ hơn Janet

SELECT * FROM Employees WHERE YEAR(BirthDate) > (SELECT YEAR(BirthDate) FROM Employees WHERE FirstName = 'Janet') 