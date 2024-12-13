﻿-- A Ngôn ngữ định nghĩa dữ liệu (Data Definition Language)
-- 1. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)

-- 2. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT

-- 3. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100)

-- 4. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM DROP COLUMN GHICHU

-- 5. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR(20)

-- 6. Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM ADD CONSTRAINT CK_DVT CHECK(DVT in ('cay', 'hop', 'cai', 'quyen', 'chuc'))

-- 7. Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM ADD CONSTRAINT CK_GIA CHECK(GIA >= 500)

-- 8. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE CTHD ADD CONSTRAINT CK_SL CHECK(SL >= 1)

-- 9. Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG ADD CONSTRAINT CK_NGDK CHECK(NGDK > NGSINH)

-- B Ngôn ngữ thao tác dữ liệu (Data Manipulation Language)
-- 1. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM KHACHHANG

-- 10. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM1 
SET GIA += GIA * 0.05 
WHERE NUOCSX = 'Thai Lan' 

-- 11. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM1 
SET GIA -= GIA * 0.05 
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000

/* 12. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 
10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1) */
UPDATE KHACHHANG1 
SET LOAIKH = 'VIP' 
WHERE (NGDK < '1/1/2007' AND DOANHSO >= 10000000) OR (NGDK > '1/1/2007' AND DOANHSO >= 2000000)

-- C Ngôn ngữ truy vấn dữ liệu
-- 13. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc'

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP FROM SANPHAM 
WHERE DVT IN ('cay', 'quyen')

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP FROM SANPHAM 
WHERE LEFT(MASP, 1) = 'B' AND RIGHT(MASP, 2) = '01'

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP,TENSP FROM SANPHAM 
WHERE (NUOCSX IN ('Trung Quoc', ' Thai Lan')) AND (GIA BETWEEN 30000 AND 40000)

-- 18. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA FROM HOADON 
WHERE NGHD IN ('1/1/2007', '2/1/2007')

-- 19. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA FROM HOADON 
WHERE YEAR(NGHD) = 2007 AND MONTH(NGHD) = 1 
ORDER BY NGHD ASC, TRIGIA DESC

-- 20. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT HD.MAKH, HOTEN 
FROM HOADON HD INNER JOIN KHACHHANG KH 
ON HD.MAKH = KH.MAKH 
WHERE NGHD = '1/1/2007'

-- 21. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT HD.SOHD, TRIGIA 
FROM HOADON HD INNER JOIN NHANVIEN NV 
ON HD.MANV = NV.MANV 
WHERE HOTEN = 'Nguyen Van B' AND NGHD = '28/10/2006'

-- 22. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT CT.MASP, TENSP 
FROM CTHD CT INNER JOIN SANPHAM SP 
ON CT.MASP = SP.MASP
WHERE SOHD IN (
	SELECT SOHD 
	FROM HOADON HD INNER JOIN KHACHHANG KH 
	ON HD.MAKH = KH.MAKH
	WHERE HOTEN = 'Nguyen Van A' AND YEAR(NGHD) = 2006 AND MONTH(NGHD) = 10 
)

-- 23. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD FROM CTHD WHERE MASP = 'BB01' 
UNION
SELECT SOHD FROM CTHD WHERE MASP = 'BB02' 
