USE Northwind
------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- MỆNH ĐỀ WHERE: DÙNG LÀM BỘ LỌC/FILTER NHỮNG DỮ LIỆU TA CẦN THEO 1 TIÊU CHÍ NÀO ĐÓ
-- VÍ DỤ: LỌC ra những sv có quê Bình Dương

-- CÚ PHÁP DÙNG BỘ LỌC
-- SELECT * (cột bạn muốn in ra) FROM <TÊN-TABLE> WHERE <ĐIỀU KIỆN LỌC>
-- *ĐIỀU KIỆN LỌC: TÌM TỪNG DÒNG, VỚI CÁI-CỘT CÓ GIÁ TRỊ CẦN LỌC
--					LỌC THEO TÊN CỘT VỚI VALUE THẾ NÀO, LẤY TÊN CỘT, XEM VALUE TRONG CELL
--					CÓ THỎA ĐIỀU KIỆN LỌC HAY KHÔNG

--ĐỂ VIẾT ĐK LỌC, TA CẦN
--  > tên cột
--  value của cột (cell)
--	toán tử (operator) > >= < <= = (một dấu = thoi) !=
--  nhiều đk lọc đi kèm, dùng thêm logic operators, AND, OR, NOT 
--VÍ DỤ: WHER City = N'Bình Dương' AND Gpa >= 8

--LỌC LIÊN QUAN ĐẾN GIÁ TRỊ/VALUE/CELL CHỨA GÌ, TA PHẢI QUAN TÂM TỚI DATA TYPES
--SỐ: nguyên/thực, ghi số như truyền thống 5, 10, 3.14, 9.8
--Chuỗi kí tự: 'A', 'Ahihi'
--Ngày tháng: '2003-01-01'
------------------------------------------------------------------------
--THỰC HÀNH 
--1. In ra danh sách các khách hàng
SELECT * FROM Customers

--2. In ra ds kh đến từ Ý
SELECT * FROM Customers WHERE Country = 'Italy' --3

--3. In ra danh sách khách hàng đến từ Mĩ
SELECT * FROM Customers WHERE Country = 'USA' --13

--4. In ra những khách hàng đến từ Mĩ, Ý
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy'

--SORT THEO Ý, MĨ, ĐỂ GOM CÙNG CÙM CHO DỄ THEO DÕI
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Italy' ORDER BY Country

--5. In ra khách hàng đến từ thủ đô Đức
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' 

--6. In ra các thông tin của nhân viên
SELECT * FROM Employees

--7. In ra thông tin nhân viên có năm sinh từ 1960 tới bây giờ
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960

--8. In ra thông tin nhân viên có tuổi từ 60 trở lên
SELECT * FROM Employees WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) >= 60

--9. Những nhân viên nào ở LONDON
SELECT * FROM Employees WHERE City = 'London'

--10. Những ai ko ở LONDON
SELECT * FROM Employees WHERE City != 'London'
SELECT * FROM Employees WHERE City <> 'London'

--Đảo mệnh đề!!!!
SELECT * FROM Employees WHERE NOT(City = 'London')

--11.In ra hồ sơ nhân viên có mã số là 1
-- đi vào ngân hàng giao dịch, hoặc đưa số tk, kèm cmnd, filter theo cmnd
SELECT * FROM Employees WHERE EmployeeID = 1 --kiểu số, kiểu số ko có nháy đơn

--WHERE TRÊN KEY LCHỈ REA 1 MÀ THÔI
--SELECT MÀ CÓ WHERE KEY CHỈ 1 DÒNG TRẢ VỀ, DISTINCT LÀ VÔ NGHĨA


-- CÔNG THỨCC FULL KO CHE CỦA SELECT
-- SELECT ... FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY
--		DISTINCT	

--12. Xem thông tin Đơn hàng
SELECT * FROM Orders --830

--13. Xem thông tin Đơn hàng sắp xếp giảm dần theo trọng lượng
SELECT * FROM Orders ORDER BY Freight DESC

--14. Xem thông tin Đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng >= 500kg
SELECT * FROM Orders Where Freight >= 500 ORDER BY Freight DESC

--15. Xem thông tin Đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng nằm trong khoảng từ 100 đến 500 và Ship bởi công ty giao vận số 1
SELECT * FROM Orders Where Freight >= 100 AND Freight <= 500  AND ShipVia = 1  ORDER BY Freight DESC

--16. Và ko ship tới LONDON

SELECT * FROM Orders Where Freight >= 100 AND Freight <= 500  AND ShipVia = 1 AND ShipCity!= 'London' ORDER BY Freight DESC
SELECT * FROM Orders Where Freight >= 100 AND Freight <= 500  AND ShipVia = 1 AND NOT(ShipCity = 'London') ORDER BY Freight DESC

--17. Liệt kê k/h đến từ mĩ hoặc mexico
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Mexico'

--18. Liệt kê k/h ko đến từ mĩ hoặc mexico
SELECT * FROM Customers WHERE NOT(Country = 'USA' OR Country = 'Mexico')
SELECT * FROM Customers WHERE Country != 'USA' AND Country != 'Mexico'