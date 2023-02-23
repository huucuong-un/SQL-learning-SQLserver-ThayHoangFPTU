USe Northwind

-------------------------------------------------------------------------------------------
-- LÍ THUYẾT 
-- DB ENGINE HỖ TRỢ 1 LOẠT NHÓM HÀM DÙNG THAO TÁC TRÊN NHÓM DÒNG/CỘT, GOM DATA TÍNH TOÁN
--TRÊN ĐÁM DATA GOM NÀY - NHÓM HÀM GOM NHÓM - AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT() SUM() MIN() MAX() AVG()

-- * CÚ PHÁP CHUẨN
-- SELECT CỘT.., HÀM GOM NHÓM(),.. FROM <TABLE>
------------------------------------------------------------------------------------------ 

--THỰC HÀNH
--1. LIỆT KÊ DANH SÁCH NHÂN VIÊN
SELECT * FROM Employees

--2. NĂM SINH NÀO LÀ BÉ NHẤT 
SELECT MIN(BirthDate) FROM Employees
SELECT MAX(BirthDate) FROM Employees

--3. AI SINH NĂM BÉ NHẤT, LỚN TUỔI NHẤT, IN RA IN4
SELECT * FROM Employees WHERE BirthDate = (
											SELECT MIN(BirthDate) FROM Employees
										  ) 
--4. trong các đơn hàng đơn hàng nào có trọng lượng lớn nhất
SELECT * FROM Orders WHERE Freight = (
										SELECT MAX(Freight) FROM Orders
									 )


--5. tính tổng khối lượng các đơn hàng
SELECT SUM(Freight) FROM Orders

--6. TÍNH XEM TRUNG BÌNH CÁC ĐƠN HÀNG NẶNG BAO NHIÊU
SELECT AVG(Freight) FROM Orders

--7. Liệt kê các đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả
SELECT * FROM Orders WHERE Freight > (SELECT AVG(Freight) FROM Orders)

--8. Có bao nhiêu đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả
SELECT COUNT(*) FROM Orders WHERE Freight > (SELECT AVG(Freight) FROM Orders)

SELECT COUNT(*) FROM (SELECT * FROM Orders WHERE Freight > (SELECT AVG(Freight) FROM Orders)) AS [AVG]

--ÔN TẬP

--1. In ra danh sách nhân viên
SELECT * FROM Employees

--2. Đếm xem mỗi khu vực có bao nhiêu nhân viên


SELECT COUNT(*) FROM Employees GROUP BY Region
SELECT Region, COUNT(*) FROM Employees AS [No employees] GROUP BY Region --ĐÚNG DO ĐẾM DÒNG
SELECT Region, COUNT(Region) FROM Employees AS [No employees] GROUP BY Region --SAI DO ĐẾM NULL

--3. Khảo sát đơn hàng 
SELECT * FROM Orders

-- MỖI QUỐC GIA CÓ BAO NHIÊU ĐƠN HÀNG?
SELECT ShipCountry , COUNT(*) AS [No Orders] FROM Orders GROUP BY ShipCountry

-- QUỐC GIA NÀO CÓ TỪ 100 ĐƠN HÀNG TRỞ LÊN
SELECT ShipCountry , COUNT(*) AS [No Orders] FROM Orders GROUP BY ShipCountry HAVING COUNT(*) >= 100

--5. QUỐC GIA NÀO CÓ NHIỀU ĐƠN HÀNG NHẤT
 SELECT ShipCountry , COUNT(*)  FROM  Orders GROUP BY ShipCountry
										HAVING COUNT(*) = 
				(SELECT MAX([No Orders]) FROM (SELECT ShipCountry , COUNT(*) AS [No Orders] FROM Orders GROUP BY ShipCountry) AS [COUNTRY]) 
								