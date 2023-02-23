USE Cartesian
CREATE DATABASE Cartesian


CREATE TABLE EnDict    -- DDL (1 nhánh của SQL) (Data Definition Language)
(
	Numbr int,
	EnDesc varchar(30)
)
--Từ điển tiếng anh số đếm
DROP TABLE EnDict	--DDL

	--DML Data Manipulation Language

INSERT INTO EnDict VALUES(1, 'one')
INSERT INTO EnDict VALUES(2, 'two')
INSERT INTO EnDict VALUES(3, 'three')

-- PHẦN NÀY THÊM CHO OUTER JOIN
INSERT INTO EnDict VALUES(4, 'four')


CREATE TABLE VnDict    -- DDL (1 nhánh của SQL) (Data Definition Language)
(
	Numbr int,
	VnDesc nvarchar(30)
)
--Từ điển tiếng việt số đếm
--DROP TABLE VnDict	--DDL
	--DML Data Manipulation Language

INSERT INTO VnDict VALUES(1, N'một')
INSERT INTO VnDict VALUES(2, N'hai')
INSERT INTO VnDict VALUES(3, N'ba')
INSERT INTO VnDict VALUES(5, N'năm')


SELECT * FROM EnDict
SELECT * FROM VnDict
--BÔI ĐEN CẢ 2 LỆNH NÀY CHẠY, THÌ NÓ KHÔNG PHẢI LÀ JOIN, NÓ LÀ 2 CÂU RIÊNG BIỆT CHẠY 
--CÙNG LÚC , CHO 2 KẾT QUẢ RIÊNG BIỆT
--JOIN LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RAM, KO ẢNH HƯỞNG DỮ LIỆU GỐC CỦA MỖI TABLE
-- JOIN LÀ SELECT CÙNG LÚC KIỂU TABLE

SELECT * FROM VnDict, EnDict -- sinh table mới, tạm thời lúc chạy
							 -- số cột = tổng 2 bên
							 -- số dòng = tích 2 bên
--GHÉP TABLE, JOIN BỊ TRÙNG TÊN CỘT, DÙNG ALIAS, ĐẶT TÊN GIẢ
SELECT * FROM VnDict vn, EnDict en ORDER BY vn.Numbr --đặt tên giả cho table

SELECT	vn.Numbr, vn.VnDesc, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Numbr

SELECT	vn.*, en.EnDesc FROM VnDict vn, EnDict en ORDER BY en.Numbr

SELECT	vn.*, en.* FROM VnDict vn, EnDict en ORDER BY en.Numbr

--CÚ PHÁP VIẾT THỨ 2 -- chuẩn
SELECT vn.*, en.EnDesc FROM VnDict vn CROSS JOIN EnDict en ORDER BY en.Numbr --CROSS JOIN


--có cặp ghép xài đc, vì có sự tương hợp trong cell nào đó

SELECT * FROM VnDict vn, EnDict en
		WHERE vn.Numbr = en.Numbr --rút từ 3x3 xuống còn 3
		--tìm điểm chung	--INNER JOIN
		--GHÉP CÓ CHỌN LỌC TÌM TƯƠNG QUAN CỘT, CELL ĐỂ GHÉP -> INNER/OUTER JOIN
																--EQUI JOIN	
