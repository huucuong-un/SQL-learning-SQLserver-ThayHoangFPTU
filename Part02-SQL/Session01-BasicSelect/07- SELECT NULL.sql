USE	Northwind

--------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG CỦA SELECT
-- TRONG THỰC TẾ CÓ Những dữ liệu/info ch xác định đc nó là gì
-- Hiện tượng dữ liệu chưa xác định, chưa biết, từ đưa vào sau
-- thì ta gọi giá trị chưa xác định này là NULL
-- TA DÙNG TOÁN TỬ 
-- IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ FILTE CELL CÓ GIÁ TRỊ NULL
--------------------------------------------------------------------------
--THỰC HÀNH
--1. In ra danh sách nhân viên
SELECT * FROM Employees --9

--2. Ai chưa xác định khu vực ở, region null
SELECT * FROM Employees WHERE Region IS NULL 

--3. Ai đã xác định khu vực cư trú
SELECT * FROM Employees WHERE Region IS NOT NULL  --5
SELECT * FROM Employees WHERE NOT(Region IS NULL)  --5

--4. Những nhân viên đại diện kinh doanh và xác định đc nơi cứ trú
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND Region IS NOT NULL  --3
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND NOT(Region IS NULL) --3

--5. Liệt kê danh sách khách hàng đến từ ANh Pháp Mĩ, có cả thông tin số fax và region
SELECT * FROM Customers WHERE Country IN('UK', 'France', 'USA') AND Fax IS NOT NULL 
															AND Region IS NOT NULL
