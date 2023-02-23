CREATE DATABASE DBDESIGN_ONETABLE
-- CREATE DÙNG ĐÊ TẠO CẤU TRÚC LƯU TRỮ

--TẠO RA CẤU TRÚC LƯU TRỮ- CHƯA NÓI DATA - DDL (PHÂN NHÁNH CỦA SQL)

USE DBDESIGN_ONETABLE

--TẠO TABLE LƯU TRỮ HỒ SƠ SV: MÃ SỐ( PHẦN BIỆT SV VỚI NHAU), TÊN, DOB, ĐỊA CHỈ
--1 SV ~~ 1 OBJECT ~~ 1 ENTITY
--1 TABLE DÙNG LƯU TRỪ NHIỀU ENTITY

CREATE TABLE StudentV1
(
	StudentID char(8),
	LastName nvarchar(40),	--tại sao ko gộp fullname?
	FirstName nvarchar(10), --n để lưu kí tự unicode
	DOB datetime,
	[Address] nvarchar(50),



)

--THAO TÁC TRÊN DATA -DML/DQL(DÀNH RIÊNG CHO SELECT)
SELECT * FROM StudentV1

--DƯA DATA VÀO TABLE/ MUA QUẦN ÁO BỎ VÀO TỦ
INSERT INTO StudentV1 VALUES('SE123456', N'Nguyễn', N'An','2003-1-1', N'... TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT

--MỘT SỐ CỘT CHƯA NHẬP ĨN, ĐC QUYỀN BỎ TRỐNG NẾU CỘT CHO PHÉP
--DEFAULT KHI THIẾT KẾ TỦ THÌ MẶC ĐỊNH NULL
INSERT INTO StudentV1 VALUES('SE123457', N'Lê', N'Bình','2003-2-1', NULL) 

--TÊN THÀNH PHỐ LÀ NULL, WHERE = NULL ĐC LUN VÌ NÓ LÀ DATA
--NULL Ở TRÊN WHERE ADDRESS IS NULL
INSERT INTO StudentV1 VALUES('SE123458', N'Võ', N'Cường','2003-3-1', N'NULL') 

--CHỈ MUỐN LƯU VÀI ĨN THOI, KO ĐỦ SỐ CỘT, MIỄN CỘT CÒN LẠI CHO PHÉP BỎ TRỐNG
INSERT INTO StudentV1(StudentID, LastName, FirstName)
	   VALUES('SE123459', N'Trần', N'Dũng') 

INSERT INTO StudentV1(LastName, FirstName, StudentID)
	   VALUES( N'Phạm', N'Em', 'SE123460') 



INSERT INTO StudentV1(LastName, FirstName, StudentID)
	   VALUES(NULL, NULL, NULL) --SIÊU NGUY HIỂM, SV TOÀN IN4 BỎ TRỐNG
								--GÀI CÁCH ĐƯA DATA VÀO CÁC CỘT SAO CHO HỢP LÍ
								--CONSTRAINT TRÊN DATA/CELL/COLUMN 

--CÚ NGUY HIỂM NÀY CÒN LỚN HƠN!!!!!!!!!!!!!!
--TRÙNG MÃ SỐ KO CHẤP NHẬN ĐC VÌ KO THỂ XÁC ĐỊNH THÔNG TIN -- GÀI RÀNG BUỘC DỮ LIỆU QUAN TRỌNG NÀY
--																CỘT MÀ VALUE CẤM TRÙNG
--																LÀM CHÌA KHÓA ĐỂ MỞ RA TÌM RA DUY NHẤT 1 ENTITY
--																CỘT NÀY DC GỌI LÀ PRIMARY KEY
INSERT INTO StudentV1(LastName, FirstName, StudentID)
	   VALUES( N'Đỗ', N'Giang', 'SE123460') 

SELECT * FROM StudentV1

SELECT * FROM StudentV1 WHERE StudentID = 'se123460'--ra 2 người ko chấp nhận đc


--gài cách đưa data vào table để ko có những hiện tượng bất thường, key trùng
CREATE TABLE StudentV2
(
	StudentID char(8) PRIMARY KEY, --bao hàm luôn notnull -- bắt buộc đưa data, cấm trùng
	LastName nvarchar(40) NOT NULL,	--tại sao ko gộp fullname? --notnull
	FirstName nvarchar(10) NOT NULL, --n để lưu kí tự unicode
	DOB datetime,
	[Address] nvarchar(50)

)

SELECT * FROM StudentV2

INSERT INTO StudentV2 VALUES('SE123456', N'Nguyễn', N'An','2003-1-1', N'... TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT


INSERT INTO StudentV2(StudentID, LastName, FirstName)
	   VALUES(NULL, NULL, NULL) --GÃY


INSERT INTO StudentV2(StudentID, LastName, FirstName)
	   VALUES('AHIHI', NULL, NULL) --GÃY

--COI CÓ ĐƯỢC TRÙNG MÃ SỐ SV HAY KHÔNG
INSERT INTO StudentV2 VALUES('SE123456', N'Nguyễn', N'An','2003-1-1', N'... TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT

CREATE TABLE StudentV3
(
	StudentID char(8) NOT NULL, --bao hàm luôn notnull -- bắt buộc đưa data, cấm trùng
	LastName nvarchar(40) NOT NULL,	--tại sao ko gộp fullname? --notnull
	FirstName nvarchar(10) NOT NULL, --n để lưu kí tự unicode
	DOB datetime,
	[Address] nvarchar(50),

	PRIMARY KEY(StudentID)

)
INSERT INTO StudentV3 VALUES('SE123456', N'Nguyễn', N'An','2003-1-1', N'... TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT
SELECT * FROM StudentV3

--------------------------------------------------------------------------
-- CONSTRAINT - TRONG ĐÓ CÓ PK CONSTRAINT
-- RÀNG BUỘC LÀ CÁCH DESIGNER ÉP CELL NÀO ĐÓ VALUE PHẢI NTN
--VÌ CÓ NHIỀU QUY TẮC, DỄ KIỂM SOÁT. TA SẼ ĐẶT TÊN CONSTRAINT NAME
--MẶC ĐỊNH DB ENGINE TỰ ĐẶT  TÊN CHO CÁC RÀNG BUỘC NÓ THẤY KHI BẢN GÕ LỆNH DDL
--DB ENGINE CHO MÌNH CƠ CHẾ TỰ ĐẶT TÊN CHO RÀNG BUỘC

CREATE TABLE StudentV4
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL,	
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	[Address] nvarchar(50),

	
	--PRIMARY KEY(StudentID) -- TỰ DB ENGINE ĐẶT TÊN CHO RÀNG BUỘC
	CONSTRAINT PK_STUDENTV6 PRIMARY KEY (StudentID)
)
INSERT INTO StudentV4 VALUES('SE123456', N'Nguyễn', N'An','2003-1-1', N'... TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT
SELECT * FROM StudentV4

-- DÂN PRO ĐÔI KHI CÒN LÀM CÁCH SAU. NGTA TÁCH HẲN VIỆC TẠO RÀNG BUỘC KHÓA CHÍNH. KHÓA NGOẠI
--RA HẲN CẤU TRÚC TABLE TỨC LÀ CREATE TABLE CHỈ CHỨA TÊN CẤU TRỤC - CỘT - DOMAIN
-- TẠO TABLE XONG RỒI CHỈNH SỬA TABLE - SỬA CÁI TỦ CHỨ KO PHẢI DATA TRONG TỦ


DROP TABLE StudentV5 
CREATE TABLE StudentV5
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL,	
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	[Address] nvarchar(50),

	
	--PRIMARY KEY(StudentID) -- TỰ DB ENGINE ĐẶT TÊN CHO RÀNG BUỘC
	--CONSTRAINT PK_STUDENTV5 PRIMARY KEY (StudentID)
)
INSERT INTO StudentV5 VALUES('SE123456', N'Nguyễn', N'An','2003-1-1', N'... TP.Hồ Chí Minh') --ĐƯA HẾT VÀO CÁC CỘT
SELECT * FROM StudentV5

ALTER TABLE StudentV5 ADD CONSTRAINT PK_STUDENTV5 PRIMARY KEY (StudentID) --QUAN TRỌNG

--THÊM ĐC THÌ XÓA ĐC
ALTER TABLE StudentV5 DROP CONSTRAINT PK_STUDENTV5