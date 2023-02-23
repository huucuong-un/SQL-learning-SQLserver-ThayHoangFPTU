--THÍ NGHIỆM CÁC LOẠI RÀNG BUỘC - CONSTRAINTS - QUY TẮC GÀI TRÊN DATA

--1. RÀNG BUỘC PRIMARY KEY
--TẠM THỜI CHẤP NHẬN PK LÀ 1 CỘT( TƯƠNG LAI CÓ THỂ CÓ NHIỀU CỘT) MÀ GIÁ TRỊ CỦA NÓ TRÊN MỌI DÒNG 
--KO TRÙNG LẠI, MỤC ĐÍCH DÙNG ĐỂ WHERE RA 1 DÒNG DUY NHẤT
--
-- VALUE CỦA KEY NÀY CÓ THỂ ĐC TẠO RA THEO 2 CÁCH
--CÁCH 1: TỰ NHẬP = TAY, DB ENGINE SẼ TỰ KIỂM TRA GIÙM MÌNH CÓ TRÙNG KO?
--			NẾU TRÙN DB ENGINE TỰ BÁO VI PHẠM PK CONSTRAINT
--CÁCH 2: KO CẦN NHẬP = TAY VALUE CỦA PK, DB ENGINE TỰ GENERATE CHO 1 MÌNH CON SỐ KO TRÙNG LẠI, CON SỐ TỰ TĂNG, CON SỐ HEXA


--THỰC HÀNH
-- Thiết kế table lưu thông tin đăng ký event nào đó (giống đk qua Google form)
-- thông tin cần lưu trữ: số thứ tự đăng ký, tên full, email, ngày giờ đăng ký, sđt
-- * phân tích:
-- ngày giờ đky: ko bắt nhập, default
-- stt: ko nhập, tự gán
-- email, phone: ko cho trùng, 1 email 1 lần đăng ký
--      ...
USE DBDESIGN_ONETABLE

/*
CREATE TABLE Registration
(
	SEQ int PRIMARY KEY, --phải nhập số, SAI
	FirstName nvarchar(10),
	LastName nvarchar(30),
	Email varchar(50),
	Phone varchar(11),
	RegDate datetime DEFAULT GetDate() -- CONSTRAINT DEFAULT
)
*/

CREATE TABLE Registration
(
	SEQ int PRIMARY KEY IDENTITY, --IDENTITY MẶC ĐỊNH ĐI TỪ MỘT VÀ ++ CHO NGƯỜI SAU
									-- IDENTITY(1, 5) TỪ 1, 6, 11.. BƯỚC NHẢY
	FirstName nvarchar(10),
	LastName nvarchar(30),
	Email varchar(50),
	Phone varchar(11),
	RegDate datetime DEFAULT GetDate() -- CONSTRAINT DEFAULT
)

--ĐĂNG KÝ EVENT
INSERT INTO Registration VALUES (N'An', N'Nguyễn', 'an@...', '090x') --báo lỗi do ko map đc các cột

INSERT INTO Registration VALUES (N'An', N'Nguyễn', 'an@...', '090x', NULL) --báo lỗi do ko map đc các cột

INSERT INTO Registration(FirstName, LastName, Email, Phone) VALUES (N'Bình', N'Lê', 'binh@...', '091x') --tự lấy giờ default trên hệ thống


SELECT * FROM Registration