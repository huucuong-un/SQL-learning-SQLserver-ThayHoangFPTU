USE	Northwind

--------------------------------------------------------------------------
--LÍ THUYẾT
--CÚ PHÁP MỞ RỘNG SELECT
-- KHI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >= ... AND <= ..., TA CÓ THỂ THAY THẾ
-- BẰNG MỆNH ĐỀ BETWEEN, IN
-- * Cú pháp: CỘT BETWEEN VALUE-1 AND VALUE-2
--						  >>>>>>> BETWEEN THAY THẾ CHO 2 MỆNH ĐỀ >= <= AND 	


-- * Cú pháp: CỘT IN( MỘT TẬP IN CÁC giá trị đc liệt kê cách nhau bằng dấu phẩy)
--						 >>>>>>>> IN thay thế cho các OR	
--------------------------------------------------------------------------

--1. Liệt kê danh sách nhân viên sinh trong năm 1960...1970
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 AND YEAR(BirthDate) <= 1970
						ORDER BY BirthDate DESC		--4		

SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970
						ORDER BY BirthDate DESC		--4	
--2. Liệt kê các đơn hàng có trọng lượng từ 100...500
SELECT * FROM Orders WHERE Freight BETWEEN 100 AND 500		--174

--3. Liệt kê các đơn hàng gửi tới Anh, Pháp, Mĩ
SELECT * FROM Orders WHERE ShipCountry = 'USA' OR ShipCountry = 'UK' OR ShipCountry = 'France'	--255

SELECT * FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'France')								--255

--4. Liệt kê các đơn hàng KO gửi tới Anh, Pháp, Mĩ
SELECT * FROM Orders WHERE NOT(ShipCountry = 'USA' OR ShipCountry = 'UK' OR ShipCountry = 'France')	--575

SELECT * FROM Orders WHERE ShipCountry NOT IN('USA', 'UK', 'France')								--575

--5. Liệt kê các đơn hàng trong năm 1996 ngoại trừ các tháng 6 7 8 9
SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996 AND MONTH(OrderDate) NOT IN (6, 7, 8, 9)

--LƯU Ý IN: CHỈ KHI TA LIỆT KÊ ĐC TẬP GIÁ TRỊ THÌ MỚI CHƠI IN




