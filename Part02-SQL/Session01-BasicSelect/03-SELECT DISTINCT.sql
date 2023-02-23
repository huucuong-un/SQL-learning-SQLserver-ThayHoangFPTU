USE Northwind
------------------------------------------------------------------------
-- LÍ THUYẾT
-- MỘT DATABASE LÀ NƠI CHỨA DATA(bán hàng, thư viện, quản lí sinh viên,..)
-- DATA được lưu dưới dạng TABLE, tách thành nhiều TABLE (nghệ thuật design db, NF)
-- Dùng lệnh SELECT để xem, để in dữ liệu từ table, hiển thị dưới dạng table
-- CÚ PHÁP CHUẨN: SELECT * FROM <TÊN TABLE>
--						* đại diện cho việc tui mún lấy all of columns
-- CÚ PHÁP MỞ RỘNG
--					SELECT TÊN CÁC CỘT MUỐN LẤY, CÁCH NHAU DẤU PHẨY FROM <TÊN-TABLE>
--					SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÍ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN HIỂN THỊ
--					SELECT <TÊN-CỘT> FROM <TÊN TABLE>
-- Khi ta SELECT ít cột từ table gốc thì có nguy cơ dữ liệu sẽ bị trùng lại
-- Ko phải ta bị sai, ko phải ng thiết kế table và ng nhập liệu bị sai
-- Do chúng ta có nhiều info trùng nhau/đặc điểm trùng nhau, nên nếu chỉ tập trung vào data này
-- trùng nhau chắc chắn xảy ra.
--LỆNH SELECT HỖ TRỢ LOẠI TRỪ CÁC DÒNG TRÙNG NHAU/TRÙNG 100%
--SELECT DISTINCT TÊN-CÁC-CỘT FROM <TABLE>


------------------------------------------------------------------------
--1. Liệt kê danh sách nhân viên
SELECT * FROM Employees
--Phân tích: 9 người nhưng chỉ có 4 title
SELECT TitleofCourtesy FROM Employees
SELECT DISTINCT TitleofCourtesy FROM Employees

--2. In ra thông tin khách hàng
SELECT * FROM Customers --92 ROWS

--3. Có bao nhiêu quốc gia xuất hiện trong thông tin k/h, in ra
SELECT Country FROM Customers --92 ROWS
SELECT DISTINCT Country FROM Customers --22 ROWS
