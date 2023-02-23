USE Northwind
------------------------------------------------------------------------
-- LÍ THUYẾT
-- MỘT DATABASE LÀ NƠI CHỨA DATA(bán hàng, thư viện, quản lí sinh viên,..)
-- DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE (nghệ thuật design db, NF)
-- Dùng lệnh SELECT để xem, để in dữ liệu từ table, hiển thị dưới dạng table
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN TABLE>
--						* đại diện cho việc tui mún lấy all of columns
-- CÚ PHÁP MỞ RỘNG
--					SELECT TÊN CÁC CỘT MUỐN LẤY, CÁCH NHAU DẤU PHẨY FROM <TÊN-TABLE>
--					SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--					SELECT <TÊN-CỘT> FROM <TÊN TABLE>
-- DATA trả về có cell/ ô có Null, hiểu rằng chưa xác định value/giá trị, chứa có, chưa biết
-- từ từ cập nhật sau. Ví dụ sv kí tên vào ds thi, cột điểm ngay lúc kí tên gọi là NULL
-- thi xong mới có điểm, mang trạng thái chưa xác định
------------------------------------------------------------------------

--1. Xem thông tin của tất cả các khách hàng đang giao dịch với mình
SELECT * FROM Customers
--INSERT INTO Customers(CustomerID, CompanyName, ContactName)
				--VALUES ('ALFKI', 'FPT UNIVERSITY', 'THANH NGUYEN KHAC')
				-- bị chửi vì trùng PK

INSERT INTO Customers(CustomerID, CompanyName, ContactName)
				VALUES ('FPTU', 'FPT UNIVERSITY', 'THANH NGUYEN KHAC')
				-- ngon

--2. Xem thông tin nhân viên, xem hết các cột
SELECT * FROM Employees

--3. Xem các sản phẩm có trong kho
SELECT * FROM Products

--4. Mua hàng, thì thông tin sẽ nằm ở table Order và OrderDetails
SELECT * FROM Orders --830 bills

--5. Xem thông tin công ty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers(CompanyName, Phone) VALUES ('Fedex Vietnam', '(084)865995127')

--6. Xem chi tiết mua hàng
SELECT * FROM Orders				--  PHẦN TRÊN CỦA BILL SIÊU THỊ

SELECT * FROM [Order Details]		-- PHẦN TABLE KẺ GIÓNG LỀ MÓN HÀNG ĐÃ MUA

--7. In ra thông tin khách hàng, chỉ gồm cột Id, ComName, ContactName, Country
SELECT CustomerID, CompanyName, ContactName, Country FROM Customers

--8. In ra thông tin nhân viên, chỉ cần ID, Last, First, Title, DoB
-- Tên người tách thành Last & First: dành cho mục tiêu sort theo tiêu chí nào đó. Để in ra theo đúng phong cách
-- , qui ước của mỗi quốc gia
SELECT * FROM Employees
SELECT EmployeeID ,LastName, FirstName, Title, BirthDate FROM Employees

--9. In ra thông tin nhân viên, ghép tên cho đẹp/ gộp cột, tính luôn tuổi
SELECT EmployeeID ,LastName + ' ' + FirstName AS FullName, Title, BirthDate FROM Employees
SELECT EmployeeID ,LastName + ' ' + FirstName AS FullName, Title, BirthDate, YEAR(BirthDate) FROM Employees
SELECT EmployeeID ,LastName + ' ' + FirstName AS FullName, Title, BirthDate, - YEAR(BirthDate) + YEAR(GETDATE()) AS Age FROM Employees

--10. In ra thông tin chi tiết mua hàng
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity  FROM [Order Details]

--CÔNG THỨC TÍNH TỔNG TIỀN PHẢI TRẢ TỪNG MÓN, CÓ TRỪ GIẢM GIÁ
--SL * ĐG - TIỀN GIẢM GIÁ ==> PHẢI TRẢ
--SL * ĐG - SL * ĐG * DISCOUNT(%) ==> PHẢI TRẢ
SELECT *, UnitPrice * Quantity * (1 - Discount) AS TotalPrice  FROM [Order Details]

