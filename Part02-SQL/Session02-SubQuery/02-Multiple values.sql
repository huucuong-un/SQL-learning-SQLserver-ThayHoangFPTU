USE	Northwind

--------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP CHUẨN SELECT
-- SELECT * FROM <TABLE> WHERE...
-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT IN (MỘT TẬP HỢP NÀO ĐÓ)
-- VÍ DỤ: CITY IN ('LONDON', 'BERLIN')

--NẾU CÓ 1 CÂU SQL MÀ TRẢ VỀ ĐƯỢC 1 CỘT, NHIỀU DÒNG TA CÓ THỂ
-- XEM NÓ TƯƠNG ĐƯƠNG 1 TẬP HỢP

-- TA CÓ THỂ NHÉT CÂU 1 CỘT NHIỀU DÒNG VÀO TRONG MỆNH ĐỀ IN CỦA CÂU SQL BÊN NGOÀI
-- * CÚ PHÁP
--WHERE CỘT IN (MỘT CÂU SELECT TRẢ VỀ 1 CỘT NHÌU DÒNG - NHÌU VALUE CÙNG KIỂU 
--------------------------------------------------------------------------

-- THỰC HÀNH
--1. Liệt kê các nhóm hàng
SELECT * FROM Categories

--2. In ra các món hàng thuộc nhóm 1, 6, 8
SELECT * FROM Products WHERE CategoryID IN (1, 6 ,8)
SELECT * FROM Products WHERE CategoryID = 1 OR CategoryID = 6 OR CategoryID = 8

--3. In ra các món hàng thuộc nhóm bia/ rượu, thịt, và hải sản
SELECT * FROM Products WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName IN ('Seafood', 'Beverages', 'Meat/Poultry'))
	
--4. Nhân viên quê London phụ trách những đơn hàng nào
SELECT * FROM Employees 
SELECT * FROM Orders WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE City = 'London')

--BTVN
--
--1. Các nhà cung cấp đến từ Mĩ cung cấp những mặt hàng nào?
--2. Các nhà cung cấp đến từ Mĩ cung cấp những nhóm hàng nào?
--3. Các đơn hàng vận chuyển tới thành phố Sao Paulo đc vận chuyển bởi những hãng nào
--		Các cty nào đã vc hàng tới Sao Paulo
--4. Khách hàng đến từ thành phố Berlin, London, Marid có những đơn hàng nào
--		Liệt kê các đơn hàng của khách hàng đến từ Berlin, London, Madrid

