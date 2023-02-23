USE	Northwind

--------------------------------------------------------------------------
-- LÍ THUYẾT
-- CÚ PHÁP CHUẨN SELECT
-- SELECT * FROM <TABLE> WHERE...
-- WHERE CỘT TOÁN-TỬ-SO-SÁNG VALUE-CẦN-LỌC
-- CỘT > >= < <= != VALUE
--					DÙNG CÂU SUB-QUERY TÙY NGỮ CẢNH

-- CỘT >  >= < <= ALL (1 CÂU SUB 1 CỘT NHIỀU VALUE)
-- CỘT >  >= < <= ANY (1 CÂU SUB 1 CỘT NHIỀU VALUE)
-----------------------------------------------------------------------------------

-- THỰC HÀNH
--tạo 1 table có 1 cột là Numbr, chỉ chứa 1 đống số nguyên
CREATE TABLE Num
(
	Numbr int 
)

INSERT INTO Num values (1)
INSERT INTO Num values (1)
INSERT INTO Num values (2)
INSERT INTO Num values (9)
INSERT INTO Num values (5)
INSERT INTO Num values (100)
INSERT INTO Num values (101)

--1. In ra những số > 5
SELECT * FROM Num WHERE Numbr > 5
--2. In ra max

SELECT * FROM Num WHERE Numbr >= ALL (SELECT * FROM Num)
SELECT * FROM Num WHERE Numbr > ALL (SELECT * FROM Num) 

--3. Nhân viên lớn tuổi nhất
SELECT * FROM Employees WHERE BirthDate <= ALL (SELECT BirthDate FROM Employees)

--4. Đơn hàng có trọng lượng nặng nhất
SELECT * FROM Orders WHERE Freight >= ALL (SELECT Freight FROM Orders)

