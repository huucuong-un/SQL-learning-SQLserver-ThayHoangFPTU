USE Northwind -- Chọn để chơi với thùng chứa data nào đó
			  -- tại 1 thời điểm chơi 1 thùng chứa data

SELECT * FROM Customers

SELECT * FROM Employees

------------------------------------------------------------------------
-- LÍ THUYẾT
-- 1. DBE cung cấp câu lệnh SELECT dùng để
--		in ra màn hình 1 cái gì đó
--		in ra dữ liệu có trong table (hàng/cột) !!!!!!!!!!!!!
--		dùng cho mục đích nào đó thì kết quả hiển thị luôn là 1 table
------------------------------------------------------------------------

-- 1. Hôm nay là ngày bao nhiêu???
SELECT	GETDATE()

SELECT	GETDATE() AS [Hôm nay là ngày]

-- 2. Hôm nay là tháng mấy?
SELECT	MONTH(GETDATE()) AS [Bây giờ tháng mấy?]

-- 3. Trị tuyệt đối của -5 là mấy?
SELECT ABS(-5) AS [Trị tuyệt đối của -5 là mấy?]

-- 4. 5 + 5 là mấy?
SELECT 5 + 5 AS [5 + 5 là mấy?]

-- 5. In ra tên của mình
SELECT N'Be bị khùng' AS [My full name is] -- N dùng để đọc được dấu
SELECT N'BE' + N'BỊ KHÙNG' AS [My full name is]

-- 6. Tính tuổi
SELECT YEAR(GETDATE()) - 2003 AS [Tuổi]

-- SELECT N'BE' + N'BỊ KHÙNG' + (YEAR(GETDATE()) - 2003) + ' years old' LỖI VÌ CÁC KIỂU DỮ LIỆU KHÁC NHAU

SELECT N'BE' + N' BỊ KHÙNG ' + CONVERT(VARCHAR, (YEAR(GETDATE()) - 2002)) + '  years old' AS [My profile]

SELECT N'BE' + N' BỊ KHÙNG ' + CAST((YEAR(GETDATE()) - 2003) AS varchar) + '  years old'

--7. Phép nhân hai số
SELECT 10 * 10 AS [10 X 10 =]