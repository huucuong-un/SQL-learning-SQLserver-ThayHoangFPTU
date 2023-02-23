SELECT * FROM VnDict, Endict --tích Đề-các

SELECT * FROM VnDict CROSS JOIN Endict --tích Đề-các

SELECT * FROM VnDict vn, Endict en   --TÍCH ĐỀ-CÁC CÓ FILTER
			WHERE vn.Numbr = en.Numbr

			
SELECT * FROM VnDict, Endict 
			WHERE VnDict.Numbr = Endict.Numbr		--NÊN ĐẶT ALIAS THÌ GIÚP NGÂN GỌN CÂU LỆNH


--CHUẨN THẾ GIỚI
SELECT * FROM VnDict INNER JOIN Endict					--NHÌN SÂU TABLE RỒI GHÉP, KO GHÉP BỪA BÃI
			ON VnDict.Numbr = Endict.Numbr		

SELECT * FROM VnDict JOIN Endict					--NHÌN SÂU TABLE RỒI GHÉP, KO GHÉP BỪA BÃI
			ON VnDict.Numbr = Endict.Numbr	

-- THÍ NGHIỆM THÊM CHO INNER JOIN
SELECT * FROM EnDict
SELECT * FROM VnDict

SELECT * FROM EnDict e, VnDict v
		WHERE e.Numbr = v.Numbr

SELECT * FROM EnDict e, VnDict v
		WHERE e.Numbr > v.Numbr

SELECT * FROM EnDict e, VnDict v
		WHERE e.Numbr != v.Numbr

SELECT * FROM EnDict e JOIN VnDict v
		ON e.Numbr != v.Numbr



