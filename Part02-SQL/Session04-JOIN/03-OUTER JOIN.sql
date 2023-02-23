USE Cartesian

--1. LIỆT KÊ CÁC CẶP TỪ ĐIỂN TIẾNG ANH
SELECT * FROM EnDict e, VnDict v
		WHERE e.Numbr = v.Numbr

SELECT * FROM EnDict e INNER JOIN VnDict v
		ON e.Numbr = v.Numbr

SELECT * FROM EnDict e JOIN VnDict v
		ON e.Numbr = v.Numbr
-- bên trên là 3 câu tương đương

--Muốn 4Four và 5Nam thì tích Đề-các
SELECT * FROM EnDict CROSS JOIN VnDict

--3. lấy tiếng anh làm chuẩn, tìm nghĩa TV tương đương
-- Nếu không có tưng đương vẫn hiện ra

SELECT * FROM EnDict e LEFT JOIN VnDict v
		ON e.Numbr = v.Numbr

SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v
		ON e.Numbr = v.Numbr

--3. lấy tiếng việt làm chuẩn, tìm nghĩa Anh tương đương
-- Nếu không có tưng đương vẫn hiện ra

SELECT * FROM VnDict v LEFT JOIN EnDict e
		ON v.Numbr = e.Numbr

SELECT * FROM VnDict v LEFT OUTER JOIN EnDict e
		ON v.Numbr = e.Numbr

--Vẫn lấy tiếng việt làm chuẩn nhưng nằm bên phải


SELECT * FROM EnDict e RIGHT JOIN VnDict v
		ON e.Numbr = v.Numbr

SELECT * FROM EnDict e RIGHT OUTER JOIN VnDict v
		ON e.Numbr = v.Numbr

--5. LẤY FULL
SELECT * FROM EnDict e FULL JOIN VnDict v
		ON e.Numbr = v.Numbr

SELECT * FROM EnDict e FULL OUTER JOIN VnDict v
		ON e.Numbr = v.Numbr

--6. In ra bộ từ điển tieng anh chuẩn (Anh làm chuẩn) của những con số từ 3 trở lên

SELECT * FROM EnDict e LEFT JOIN VnDict v
		ON e.Numbr = v.Numbr
		WHERE e.Numbr >= 3

SELECT * FROM EnDict e LEFT JOIN VnDict v
		ON e.Numbr = v.Numbr
		WHERE v.Numbr >= 3

		
SELECT * FROM EnDict e FULL JOIN VnDict v
		ON e.Numbr = v.Numbr
		WHERE e.Numbr >= 3

SELECT * FROM EnDict e FULL JOIN VnDict v
		ON e.Numbr = v.Numbr
		WHERE v.Numbr >= 3

SELECT * FROM EnDict e FULL JOIN VnDict v
		ON e.Numbr = v.Numbr
		WHERE v.Numbr >= 3 OR e.Numbr >= 3