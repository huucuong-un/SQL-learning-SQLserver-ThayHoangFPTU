USe Northwind

-------------------------------------------------------------------------------------------
-- LÍ THUYẾT 
-- DB ENGINE HỖ TRỢ 1 LOẠT NHÓM HÀM DÙNG THAO TÁC TRÊN NHÓM DÒNG/CỘT, GOM DATA TÍNH TOÁN
--TRÊN ĐÁM DATA GOM NÀY - NHÓM HÀM GOM NHÓM - AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT() SUM() MIN() MAX() AVG()

-- * CÚ PHÁP CHUẨN
-- SELECT CỘT.., HÀM GOM NHÓM(),.. FROM <TABLE>


-- * CÚ PHÁP MỞ RỘNG
-- SELECT CỘT..., HÀM GOM NHÓM,. .. FROM <TABLE>...GROUP BY (GOM THEO CỤM CỘT NÀO) HAVING....

--	HÀM COUNT(??) ĐẾM SỐ LẦN XUẤT HIỆN CỦA 1 CÁI GÌ ĐÓ
--		COUNT(*): ĐẾM SỐ DÒNG TRONG TABLE, ĐẾM TẤT CẢ CÁC DÒNG
--		COUNT(*) FROM... WHERE...
--				CHỌN RA NHỮNG DÒNG THỎA TIÊU CHÍ WHERE NÀO ĐÓ TRƯỚC RỒI MỚI ĐẾM
--			FILTER ỒI MỚI ĐẾM

---------------------------------------------------------------------------------------------

--1. In ra danh sách các nhân viên
SELECT * FROM Employees

--2. Đếm xem có bao nhiêu nhân viên
SELECT COUNT(*) FROM Employees
SELECT COUNT(*) AS [Numbers of Employees] FROM Employees
--3. Có bao nhiêu NV ở London
SELECT COUNT(*) FROM Employees WHERE City = 'London'

--4. Có bao nhiêu lượt thành phố xuất hiện, không care lặp lại hay không
SELECT COUNT(City) FROM Employees

--5. Đếm xem có bao nhiêu Region
SELECT COUNT(Region) FROM Employees --NẾU CELL CỦA CỘT CHỨA NULL THÌ KHÔNG ĐẾM

--6. cÓ BAO NHIÊU KHU VỰC NULL
SELECT COUNT(*) FROM Employees WHERE Region IS NULL

--7. Có bao nhiêu thành phố trong table NV
SELECT * FROM Employees

SELECT City From Employees --9
SELECT DISTINCT City FROM Employees --5

-- SUB QUERY MỚI, COI 1 CÂU SELECT LÀ 1 TABLE, BIẾN TABLE NÀY VÀO TRONG MỆNH ĐỀ FROM


SELECT * FROM (SELECT DISTINCT City FROM Employees ) AS CITIES --AS CITIES LÀ TÊN GIẢ, 1 TABLE PHẢI CÓ TÊN, LÀ QUY TẮC BẮT BUỘC CÓ


SELECT COUNT(*) FROM (SELECT DISTINCT City FROM Employees ) AS CITIES

SELECT COUNT(DISTINCT City) FROM Employees

--8. Đếm xem mỗi thành phố có bao nhiêu nhân viên
--GẶP TỪ MỖI CHÍNH LÀ "CHIA ĐỂ TRỊ"
SELECT * FROM Employees

SELECT City, COUNT(City) AS [No of cities] FROM Employees GROUP BY City
 
 --KHI XÀI HÀM GOM NHÓM, BẠN CÓ QUYỀN LIỆT KÊ TÊN CỘT NHƯNG
 -- CỘT LẺ ĐÓ BẮT BUỘC PHẢI XUẤT HIỆN TRONG MỆNH ĐỀ GROUP BY
 -- ĐỂ ĐẢM BẢO LOGIC: CỘT HIỂN THỊ | SỐ LƯỢNG ĐI KÈM
 -- NẾU GOM THEO KEY THÌ VÔ NGHĨA

 --9. Thành phố nào có 2 nhân viên trở lên
  
 SELECT City, COUNT(City) AS [No cities] FROM Employees GROUP BY City
												HAVING COUNT(*) >= 2		
												
--10. Thành phố nào có nhiều nhân viên nhất
SELECT City, COUNT(City) AS [No cities] FROM Employees GROUP BY City
													HAVING COUNT(City) >= ALL (SELECT COUNT(City) FROM Employees GROUP BY City)
--10. Đếm số nhân viên của Seattle và London
SELECT City, COUNT(City) AS [No EMPLOYEES] FROM Employees WHERE City IN ('London', 'Seattle')
													GROUP BY City
--11. Trong hai thành phố đó, tp nào có nhiều hơn 3 nv
SELECT City, COUNT(City) AS [No EMPLOYEES] FROM Employees WHERE City IN ('London', 'Seattle')
													GROUP BY City HAVING COUNT(City) > 3

--12. đếm xem có bao nhiêu đơn hàng đã bán ra
SELECT * FROM Orders
SELECT COUNT(*) AS [No Orders] FROM Orders --830

SELECT COUNT(OrderID) AS [No Orders] FROM Orders --830

--12.1. Đếm xem nước Mĩ có bao nhiêu đơn hàng
SELECT COUNT(*) AS [No USA Orders]  FROM Orders WHERE ShipCountry = 'USA' 
--12.2. MĨ ANH PHÁP CHIẾM TỔNG CỘNG BAO NHIÊU ĐƠN HÀNG
SELECT COUNT(*) AS [No USA, UK, FRANCE ORDERS] FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'France')
--12.3. MĨ ANH PHÁP MỖI QUỐC GIA CÓ BAO NHIÊU ĐƠN HÀNG 
SELECT ShipCountry ,COUNT(*) AS [No Orders] FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'France') GROUP BY ShipCountry 

--12.4. A P M QUỐC GIA NÀO CÓ TRÊN 100 ĐƠN HÀNG
SELECT ShipCountry ,COUNT(*) AS [No Orders] FROM Orders GROUP BY ShipCountry HAVING COUNT(*) > 100 


--13. đếm xem có bao nhiêu mặt hàng có trong kho
--14. đếm xem có bao nhiêu lượt quốc gia đã mua hàng
--15. đếm xem có bao nhiêu quốc gia đã mua hàng( mỗi quốc gia đếm 1 lần)
--16. đếm số lượng đơn hàng của mỗi quốc gia
--17. Quốc gia nào có nhiều đơn hàng nhất
--17. Quốc gia nào có từ 10 đơn hàng trở lên
--18. Đếm xem mỗi chủng loại có bao nhiêu mặt hàng
