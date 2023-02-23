USE	Northwind

--------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT
-- Trong thực tế có những lúc ta muốn tìm dữ liệu/filter theo kiểu gần udng91
-- gần đúng trên kiểu chuỗi
-- ĐỂ SỬ DỤNG TOÁN TỬ LIKE, TA CẦN THÊM 2 THỨ TRỢ GIÚP, DẤU % VÀ DẤU _
-- % đại diện cho 1 chuỗi bất kì nào đó
-- _ đại diện cho 1 kí tự bất kì nào đó

--1. In ra ds nhân viên
SELECT * FROM Employees

--2. Nhân viên nào có tên bắt đầu bằng chữ A
SELECT * FROM Employees WHERE FirstName LIKE 'A%' --2

--2.1 Nhân viên nào có tên bắt đầu bằng chữ A, IN RA CẢ FULLNAME ĐẦY ĐỦ
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'

--3. Nhân viên nào tên có chữ A cuối cùng
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], Title FROM Employees WHERE FirstName LIKE '%A'

--4. Nhân viên nào tên có 4 kí tự
SELECT * FROM Employees WHERE FirstName LIKE '____'

--5. Xem ds các sẩn phẩm món hàng đang có
SELECT * FROM Products

--6. Những sản phẩm bắt đầu bằng Ch
SELECT * FROM Products WHERE ProductName LIKE 'Ch%' --6

--7. Nhưững sản phẩm tê6n có 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '_____'

--7. Nhưững sản phẩm trong tên sp từ cuối là tên có 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '_____'

