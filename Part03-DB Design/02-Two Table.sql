CREATE DATABASE DBDESIGN_ONEMANY

USE DBDESIGN_ONEMANY

--TABLE 1 TẠO TRC, TABLE N TẠO SAU

CREATE TABLE MajorV1 
(
	MajorID char(2) PRIMARY KEY, --MẶC ĐỊNH DBENGINE TỰ TẠO TÊN RÀNG BUỘC
	MajorName nvarchar(40) NOT NULL
	--
)
DROP TABLE MajorV1
INSERT INTO MajorV1 VALUES('SE', N'Kĩ Thuật phần mềm')
INSERT INTO MajorV1 VALUES('IA', N'An Toàn Thông Tin')

DROP TABLE StudentV5
CREATE TABLE StudentV1
(
	StudentID char(8) NOT NULL, 
	LastName nvarchar(40) NOT NULL,	
	FirstName nvarchar(10) NOT NULL, 
	DOB datetime,
	[Address] nvarchar(50),
	MajorID char(2) REFERENCES MajorV1(MajorID)-- tên cột khóa ngoại/tham chiếu ko cần trùng bên 1-Key
												--nhưng bắt buộc trùng 100% kiểu dữ liệu
												--xin tham chiếu

	
	CONSTRAINT PK_STUDENTV5 PRIMARY KEY (StudentID)
)
INSERT INTO StudentV1 VALUES('SE1', N'Nguyễn', N'An', NULL, NULL, 'SE') --ĐƯA HẾT VÀO CÁC CỘT
INSERT INTO StudentV1 VALUES('SE2', N'Nguyễn', N'An', NULL, NULL, 'ah') --ko đc tại vì ko có 'ah' bên major

SELECT * FROM StudentV1
SELECT * FROM MajorV1

DROP TABLE StudentV1

--THIẾT KẾ TRÊN LÀ SAI VÌ 2 TABLE ĐỘC LẬP