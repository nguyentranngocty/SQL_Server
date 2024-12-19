CREATE DATABASE QLDT
USE QLDT

-------- Tạo bảng CONGVIEC --------
CREATE TABLE CONGVIEC
(
	MADT char(3) NOT NULL,
	SOTT int NOT NULL,
	TENCV nvarchar(50),
	NGAYBD smalldatetime,
	NGAYKT smalldatetime
)

-------- Tạo bảng KHOA --------
CREATE TABLE KHOA
(
	MAKHOA char(4) NOT NULL,
	TENKHOA  nvarchar(40),
	NAMTL int,
	PHONG  varchar(3),
	DIENTHOAI  int,
	TRGKHOA    char(3),
	NGNHANCHUC  smalldatetime
)

-------- Tạo bảng GIAOVIEN --------
CREATE TABLE GIAOVIEN
(
	MAGV char(3) NOT NULL,
	HOTEN   nvarchar(40),
	LUONG   int,
	PHAI    nvarchar(3),
	NGSINH  smalldatetime,
	DIACHI  nvarchar(60),
	GVQLCM  char(3) ,
	MABM    char(4)
);

-------- Tạo bảng BOMON --------
CREATE TABLE BOMON
(
	MABM char(4) NOT NULL,
	TENBM  nvarchar(40),
	PHONG  varchar(3),
	DIENTHOAI int,
	TRUONGBM  char(3),
	MAKHOA  char(4),
	NGNHANCHUC  smalldatetime
);

-------- Tạo bảng CHUDE --------
CREATE TABLE CHUDE
(
	MACD char(4) NOT NULL,
	TENCD nvarchar(30)
)

-------- Tạo bảng DETAI --------
CREATE TABLE DETAI
(
	MADT char(3) NOT NULL,
	TENDT nvarchar(40),
	CAPQL nvarchar(10),
	KINHPHI int,
	NGAYBD smalldatetime,
	NGAYKT smalldatetime,
	MACD char(4),
	GVCNDT char(3)
)

-------- Tạo bảng THAMGIADT --------
CREATE TABLE THAMGIADT
(
	MAGV char(3) NOT NULL,
	MADT char(3) NOT NULL,
	STT int NOT NULL,
	PHUCAP float,
	KETQUA nvarchar(10)
)

-------- Tạo bảng NGUOITHAN --------
CREATE TABLE NGUOITHAN
(
	MAGV char(3) NOT NULL,
	TEN nvarchar (10) NOT NULL,
	NGSINH smalldatetime,
	PHAI nvarchar(3)
)

-------- Tạo bảng GV_DT --------
CREATE TABLE GV_DT
(
	MAGV char(3) NOT NULL,
	DIENTHOAI int NOT NULL
)

-------- Tạo khóa chính --------
ALTER TABLE CONGVIEC ADD CONSTRAINT PK_CONGVIEC PRIMARY KEY (MADT,SOTT)
ALTER TABLE KHOA ADD CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
ALTER TABLE GIAOVIEN ADD CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
ALTER TABLE BOMON ADD CONSTRAINT PK_BOMON PRIMARY KEY (MABM)
ALTER TABLE CHUDE ADD CONSTRAINT PK_CHUDE PRIMARY KEY (MACD)
ALTER TABLE DETAI ADD CONSTRAINT PK_DETAI PRIMARY KEY (MADT)
ALTER TABLE THAMGIADT ADD CONSTRAINT PK_THAMGIADT PRIMARY KEY (MADT,MAGV,STT)
ALTER TABLE NGUOITHAN ADD CONSTRAINT PK_NGUOITHAN PRIMARY KEY (MAGV,TEN)
ALTER TABLE GV_DT ADD CONSTRAINT PK_GV_DT PRIMARY KEY (MAGV,DIENTHOAI)

-------- Tạo khóa ngoại --------
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GIAOVIEN_GIAOVIEN FOREIGN KEY (GVQLCM) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GIAOVIEN_BOMON FOREIGN KEY (MABM) REFERENCES BOMON(MABM)
ALTER TABLE GV_DT ADD CONSTRAINT FK_GV_DT_GIAOVIEN FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA_GIAOVIEN FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE BOMON ADD CONSTRAINT FK_BOMON_GIAOVIEN FOREIGN KEY (TRUONGBM) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE BOMON ADD CONSTRAINT FK_BOMON_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE NGUOITHAN ADD CONSTRAINT FK_NGUOITHAN_GIAOVIEN FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE DETAI ADD CONSTRAINT FK_DETAI_GIAOVIEN FOREIGN KEY (GVCNDT) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE DETAI ADD CONSTRAINT FK_DETAI_CHUDE FOREIGN KEY (MACD) REFERENCES CHUDE(MACD)
ALTER TABLE CONGVIEC ADD CONSTRAINT FK_CONGVIEC_DETAI FOREIGN KEY (MADT) REFERENCES DETAI(MADT)
ALTER TABLE THAMGIADT ADD CONSTRAINT FK_THAMGIADT_CONGVIEC FOREIGN KEY (MADT, STT) REFERENCES CONGVIEC(MADT, SOTT)
ALTER TABLE THAMGIADT ADD CONSTRAINT FK_THAMGIADT_GIAOVIEN FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)

-------- Dữ liệu bảng KHOA --------
INSERT INTO KHOA VALUES('CNTT',N'Công nghệ thông tin', 1995, N'B11', 0838123456, NULL, '2005-02-20')
INSERT INTO KHOA VALUES('HH',N'Hoa học', 1980, N'B41', 0838456456, NULL, '2001-10-15')
INSERT INTO KHOA VALUES('SH',N'Sinh học', 1980, N'B31',0838454545, NULL, '2000-10-11')
INSERT INTO KHOA VALUES('VL',N'Vật lý', 1976, N'B21', 0838223223, NULL, '2003-09-18')

-------- Dữ liệu bảng BOMON --------
INSERT INTO BOMON VALUES('CNTT', N'Công nghệ tri thức', N'B15', 0838126126, NULL, 'CNTT', NULL)
INSERT INTO BOMON VALUES('HHC', N'Hóa hữu cơ', N'B44', 0838222222, NULL, 'HH', NULL)
INSERT INTO BOMON VALUES('HL', N'Hóa lý', N'B42', 0838878787, NULL, 'HH', NULL)
INSERT INTO BOMON VALUES('HPT', N'Hóa Phân Tích', N'B43', 0838777777, NULL, 'HH', '2007-10-15')
INSERT INTO BOMON VALUES('HTTT', N'Hệ thống thông tin', N'B13', 0838125125,NULL, 'CNTT', '2004-09-20')
INSERT INTO BOMON VALUES('MMT', N'Mạng máy tính', N'B16', 0838676767, NULL, 'CNTT', '2005-05-15')
INSERT INTO BOMON VALUES('SH', N'Sinh hóa', 'B33', 0838898989, NULL, 'SH', NULL)
INSERT INTO BOMON VALUES('VLDT', N'Vật lý điện tử', N'B23', 0838234234, NULL, 'VL', NULL)
INSERT INTO BOMON VALUES('VLUD', N'Vật lý ứng dụng', N'B24', 0838454545, NULL, 'VL', '2006-02-18')
INSERT INTO BOMON VALUES('VS', N'Vi sinh', N'B32', 0838909090, NULL, 'SH', '2007-01-01')


-------- Dữ liệu bảng GIAOVIEN --------
INSERT INTO GIAOVIEN VALUES('001', N'Nguyễn Hoài An', 2000, N'Nam', '1973-02-15', N'25/3 Lạc Long Quân, Q10, TP HCM', NULL, 'MMT')
INSERT INTO GIAOVIEN VALUES('002', N'Trần Trà Hương', 2500, N'Nữ', '1960-06-20', N'115  Trần Hưng Đạo, Q1, TP HCM', NULL, 'HTTT')
INSERT INTO GIAOVIEN VALUES('003', N'Nguyễn Ngọc Ánh', 2200, N'Nữ', '1975-05-11', N'12/21 Võ Văn Ngân Thủ Đức, TP HCM', NULL, 'HTTT')
INSERT INTO GIAOVIEN VALUES('004', N'Trương Nam Sơn', 2300, N'Nam', '1959-06-20', N'215 Lý Thường Kiệt, TP Biên Hòa', NULL, 'VS')
INSERT INTO GIAOVIEN VALUES('005', N'Lý Hoàng Hà', 2500, N'Nam', '1954-10-23', N'20/5 Nguyễn Xí, Q Bình Thạnh, TP HCM', NULL, 'VLDT')
INSERT INTO GIAOVIEN VALUES('006', N'Trần Bạch Tuyết', 1500, N'Nữ', '1980-05-20', N'127 Hùng Vương, TP Mỹ Tho', NULL, 'VS')
INSERT INTO GIAOVIEN VALUES('007', N'Nguyễn An Trung', 2100, N'Nam', '1976-06-05', N'234 3/2, TP Biên Hòa', NULL, 'HPT')
INSERT INTO GIAOVIEN VALUES('008', N'Trần Trung Hiếu', 1800, N'Nam', '1977-08-06', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', NULL, 'HPT')
INSERT INTO GIAOVIEN VALUES('009', N'Trần Hoàng Nam', 2000, N'Nam', '1975-11-22', N'234 Trần Não, An Phú, TP HCM', NULL, 'MMT')
INSERT INTO GIAOVIEN VALUES('010', N'Phạm Nam Thanh', 1500, N'Nam', '1980-12-12', N'221 Hùng Vương, Q5, TP HCM', NULL, 'HPT')

-------- Dữ liệu cho cột GVQLCM --------
UPDATE GIAOVIEN SET GVQLCM = '002' WHERE MAGV = '003'
UPDATE GIAOVIEN SET GVQLCM = '004' WHERE MAGV = '006'
UPDATE GIAOVIEN SET GVQLCM = '007' WHERE MAGV = '008'
UPDATE GIAOVIEN SET GVQLCM = '001' WHERE MAGV = '009'
UPDATE GIAOVIEN SET GVQLCM = '007' WHERE MAGV = '010'

-------- Dữ liệu cột TRGKHOA --------
UPDATE KHOA SET TRGKHOA = '002' WHERE MAKHOA = 'CNTT'
UPDATE KHOA SET TRGKHOA = '007' WHERE MAKHOA = 'HH'
UPDATE KHOA SET TRGKHOA = '004' WHERE MAKHOA = 'SH'
UPDATE KHOA SET TRGKHOA = '005' WHERE MAKHOA = 'VL'

-------- Dữ liệu cột TRUONGBM --------
UPDATE BOMON SET TRUONGBM = '007' WHERE MABM = 'HPT'
UPDATE BOMON SET TRUONGBM = '002' WHERE MABM = 'HTTT'
UPDATE BOMON SET TRUONGBM = '001' WHERE MABM = 'MMT'
UPDATE BOMON SET TRUONGBM = '005' WHERE MABM = 'VLUD'
UPDATE BOMON SET TRUONGBM = '004' WHERE MABM = 'VS'

-------- Dữ liêu bảng CHUDE --------
INSERT INTO CHUDE VALUES('NCPT', N'Nghiên cứu phát triển')
INSERT INTO CHUDE VALUES('QLGD', N'Quản lý giáo dục')
INSERT INTO CHUDE VALUES('UDCN', N'Ứng dụng công nghệ')

-------- Dữ lieu bảng DETAI --------
INSERT INTO DETAI VALUES('001', N'HTTT quản lý các trường DH', N'DHQG', 20.0, '2007-10-20','2008-10-20', 'QLGD', '002')
INSERT INTO DETAI VALUES('002', N'HTTT quản lý giao vu cho mot Khoa', N'Trường', 20.0, '2000-10-12','2001-10-12', 'QLGD', '002')
INSERT INTO DETAI VALUES('003', N'Nghiên cứu chế tạo sợ Nano Platin', N'DHQG', 300.0, '2008-05-15','2010-05-15', 'NCPT', '005')
INSERT INTO DETAI VALUES('004', N'Tạo vât liệu sinh học bằng màng ối người',N'Nhà Nước', 100.0, '2007-01-01', '2009-12-31','NCPT', '004')
INSERT INTO DETAI VALUES('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '2003-10-10','2002-12-10', 'UDCN', '007')
INSERT INTO DETAI VALUES('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '2006-10-20','2009-10-20', 'NCPT', '004')
INSERT INTO DETAI VALUES('007', N'HTTT quản lý thư viện ở các trường DH', N'Trường', 20.0, '2009-05-10','2010-05-10', 'QLGD', '001')

-------- Dữ liệu bảng CONGVIEC --------
INSERT INTO CONGVIEC VALUES('001', 1, N'Khởi tạo và thiết lập kế hoạch', '2007-10-20','2008-12-20')
INSERT INTO CONGVIEC  VALUES('001', 2, N'Xác định yêu cầu', '2008-12-21', '2008-03-21')
INSERT INTO CONGVIEC VALUES('001', 3, N'Phân tích hệ thống', '2008-03-22', '2008-05-22')
INSERT INTO CONGVIEC VALUES('001', 4, N'Thiết kế hệ thống', '2008-05-23', '2008-06-23')
INSERT INTO CONGVIEC VALUES('001', 5, N'Cài đặt thử nghiệm', '2008-06-24', '2008-10-20')
INSERT INTO CONGVIEC VALUES('002', 1, N'Khởi tạo và thiết lập kế hoạch', '2009-05-10', '2009-07-10')
INSERT INTO CONGVIEC VALUES('002', 2, N'Xác định yêu cầu', '2009-07-11','2009-10-11')
INSERT INTO CONGVIEC VALUES('002', 3, N'Phân tích hệ thống', '2009-10-12','2009-12-20')
INSERT INTO CONGVIEC VALUES('002', 4, N'Thiết kế hệ thống', '2009-12-21', '2010-03-22')
INSERT INTO CONGVIEC VALUES('002', 5, N'Cài đặt thử nghiệm', '2010-03-23', '2010-05-10')
INSERT INTO CONGVIEC VALUES('006', 1, N'Lấy mấu', '2006-10-20', '2007-02-20')
INSERT INTO CONGVIEC VALUES('006', 2, N'Nuôi cấy', '2007-02-21', '2008-08-21')

-------- Dữ liệu bảng THAMGIADT --------
INSERT INTO THAMGIADT VALUES('001', '002', 1,  0.0, NULL)
INSERT INTO THAMGIADT VALUES('001', '002', 2, 2.0, NULL)
INSERT INTO THAMGIADT VALUES('002', '001', 4, 2.0, N'Dạt')
INSERT INTO THAMGIADT VALUES('003', '001', 1, 1.0, N'Dạt')
INSERT INTO THAMGIADT VALUES('003', '001', 2, 0.0, N'Dạt')
INSERT INTO THAMGIADT VALUES('003', '001', 4, 1.0, N'Dạt')
INSERT INTO THAMGIADT VALUES('003', '002', 2, 0.0, NULL)
INSERT INTO THAMGIADT VALUES('004', '006', 1, 0.0, N'Dạt')
INSERT INTO THAMGIADT VALUES('004', '006', 2, 2.0, N'Dạt')
INSERT INTO THAMGIADT VALUES('006', '006', 2, 1.5, N'Dạt')
INSERT INTO THAMGIADT VALUES('009', '002', 3, 0.5, NULL)
INSERT INTO THAMGIADT VALUES('009', '002', 4, 1.5, NULL)

-------- Dữ liệu bảng NGUOITHAN --------
INSERT INTO NGUOITHAN VALUES('001', N'Hùng', '1990-01-14', N'Nan')
INSERT INTO NGUOITHAN VALUES('001', N'Thủy', '1994-12-08', N'Nữ')
INSERT INTO NGUOITHAN VALUES('003', N'Hà', '1998-09-03', N'Nữ')
INSERT INTO NGUOITHAN VALUES('003', N'Thu', '1998-09-03', N'Nữ')
INSERT INTO NGUOITHAN VALUES('007', N'Mai', '2003-03-26', N'Nữ')
INSERT INTO NGUOITHAN VALUES('007', N'Vy', '2000-02-14', N'Nữ')
INSERT INTO NGUOITHAN VALUES('008', N'Nam', '1991-05-06', N'Nam')
INSERT INTO NGUOITHAN VALUES('009', N'An', '1996-08-19', N'Nam')
INSERT INTO NGUOITHAN VALUES('010', N'Nguyệt', '2006-01-14', N'Nữ')

-------- Dữ liệu bảng GV_DT --------
INSERT INTO GV_DT VALUES('001', 0838912112)
INSERT INTO GV_DT VALUES('001', 0903123123)
INSERT INTO GV_DT VALUES('002', 0913454545)
INSERT INTO GV_DT VALUES('003', 0838121212)
INSERT INTO GV_DT VALUES('003', 0903656565)
INSERT INTO GV_DT VALUES('003', 0937125125)
INSERT INTO GV_DT VALUES('006', 0937888888)
INSERT INTO GV_DT VALUES('008', 0653717171)
INSERT INTO GV_DT VALUES('008', 0913232323)

-- Truy vấn
-- Q1: Cho biết họ tên và mức lương của các giáo viên nữ
SELECT HOTEN, LUONG
FROM GIAOVIEN
WHERE PHAI = N'Nữ';

-- Q2: Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%
SELECT HOTEN, LUONG * 1.1 AS LUONG_MOI
FROM GIAOVIEN;

-- Q3: Cho biết mã của các giáo viên có họ tên bắt đầu là “Nguyễn” và lương trên 2000
-- hoặc giáo viên là trưởng bộ môn nhận chức sau năm 1995.
SELECT MAGV
FROM GIAOVIEN
WHERE (HOTEN LIKE N'Nguyễn%' AND LUONG > 2000)
   OR MAGV IN (
       SELECT TRUONGBM
       FROM BOMON
       WHERE YEAR(NGNHANCHUC) > 1995
   );

-- Q4: Cho biết tên những giáo viên khoa “Công nghệ thông tin”
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
JOIN KHOA K ON B.MAKHOA = K.MAKHOA
WHERE K.TENKHOA = N'Công nghệ thông tin';

-- Q5: Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó
SELECT B.*, G.HOTEN AS TEN_TRUONG_BM
FROM BOMON B
LEFT JOIN GIAOVIEN G ON B.TRUONGBM = G.MAGV;

-- Q6: Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc
SELECT G.HOTEN, B.*
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM;

-- Q7: Cho biết tên đề tài và giáo viên chủ nhiệm đề tài
SELECT D.TENDT, G.HOTEN AS TEN_CHU_NHIEM
FROM DETAI D
JOIN GIAOVIEN G ON D.GVCNDT = G.MAGV;

-- Q8: Với mỗi khoa cho biết thông tin trưởng khoa
SELECT K.TENKHOA, G.HOTEN AS TEN_TRUONG_KHOA
FROM KHOA K
JOIN GIAOVIEN G ON K.TRGKHOA = G.MAGV;

-- Q9: Cho biết các giáo viên của bộ môn “Vi sinh” có tham gia đề tài 006
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
WHERE G.MABM IN (
    SELECT MABM
    FROM BOMON
    WHERE TENBM = N'Vi sinh'
) AND T.MADT = '006';

-- Q10: Với những đề tài thuộc cấp quản lý “Thành phố”, cho biết mã đề tài,
-- đề tài thuộc về chủ đề nào, họ tên người chủ nhiệm đề tài cùng với ngày sinh
-- và địa chỉ của người ấy.
SELECT D.MADT, D.TENDT, CD.TENCD, G.HOTEN, G.NGSINH, G.DIACHI
FROM DETAI D
JOIN CHUDE CD ON D.MACD = CD.MACD
JOIN GIAOVIEN G ON D.GVCNDT = G.MAGV
WHERE D.CAPQL = N'Thành phố';

-- Q11: Tìm họ tên của từng giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên đó.
SELECT G1.HOTEN AS GIAOVIEN, G2.HOTEN AS NGUOI_PHU_TRACH
FROM GIAOVIEN G1
LEFT JOIN GIAOVIEN G2 ON G1.GVQLCM = G2.MAGV;

-- Q12: Tìm họ tên của những giáo viên được “Nguyễn Thanh Tùng” phụ trách trực tiếp.
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN GIAOVIEN TUNG ON G.GVQLCM = TUNG.MAGV
WHERE TUNG.HOTEN = N'Nguyễn Thanh Tùng';

-- Q13: Cho biết tên giáo viên là trưởng bộ môn "Hệ thống thông tin".
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM
WHERE B.TENBM = N'Hệ thống thông tin';

-- Q14: Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề "Quản lý giáo dục".
SELECT G.HOTEN
FROM DETAI D
JOIN CHUDE CD ON D.MACD = CD.MACD
JOIN GIAOVIEN G ON D.GVCNDT = G.MAGV
WHERE CD.TENCD = N'Quản lý giáo dục';

-- Q15: Cho biết tên các công việc của đề tài "HTTT quản lý các trường ĐH" có thời gian bắt đầu trong tháng 3/2008.
SELECT C.TENCV
FROM CONGVIEC C
JOIN DETAI D ON C.MADT = D.MADT
WHERE D.TENDT = N'HTTT quản lý các trường ĐH'
  AND MONTH(C.NGAYBD) = 3 AND YEAR(C.NGAYBD) = 2008;

-- Q16: Cho biết tên giáo viên và tên người quản lý chuyên môn của giáo viên đó.
SELECT G1.HOTEN AS GIAOVIEN, G2.HOTEN AS NGUOI_QLCM
FROM GIAOVIEN G1
LEFT JOIN GIAOVIEN G2 ON G1.GVQLCM = G2.MAGV;

-- Q17: Cho các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007.
SELECT *
FROM CONGVIEC
WHERE NGAYBD BETWEEN '2007-01-01' AND '2007-08-01';

-- Q18: Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
SELECT DISTINCT G2.HOTEN
FROM GIAOVIEN G1
JOIN GIAOVIEN G2 ON G1.MABM = G2.MABM
WHERE G1.HOTEN = N'Trần Trà Hương' AND G1.MAGV != G2.MAGV;

-- Q19: Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.
SELECT DISTINCT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM
JOIN DETAI D ON G.MAGV = D.GVCNDT;

-- Q20: Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
SELECT DISTINCT G.HOTEN
FROM GIAOVIEN G
JOIN KHOA K ON G.MAGV = K.TRGKHOA
JOIN BOMON B ON G.MAGV = B.TRUONGBM;

-- Q21: Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài.
SELECT DISTINCT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM
JOIN DETAI D ON G.MAGV = D.GVCNDT;

-- Q22: Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
SELECT DISTINCT K.TRGKHOA
FROM KHOA K
JOIN DETAI D ON K.TRGKHOA = D.GVCNDT;

-- Q23: Cho biết mã số các giáo viên thuộc bộ môn "HTTT" hoặc có tham gia đề tài mã "001".
SELECT DISTINCT G.MAGV
FROM GIAOVIEN G
LEFT JOIN THAMGIADT T ON G.MAGV = T.MAGV
WHERE G.MABM IN (
    SELECT MABM
    FROM BOMON
    WHERE TENBM = N'HTTT'
) OR T.MADT = '001';

-- Q24: Cho biết giáo viên làm việc cùng bộ môn với giáo viên "002".
SELECT DISTINCT G2.HOTEN
FROM GIAOVIEN G1
JOIN GIAOVIEN G2 ON G1.MABM = G2.MABM
WHERE G1.MAGV = '002' AND G1.MAGV != G2.MAGV;

-- Q25: Tìm những giáo viên là trưởng bộ môn.
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM;

-- Q26: Cho biết họ tên và mức lương của các giáo viên.
SELECT HOTEN, LUONG
FROM GIAOVIEN;

-- Q27: Cho biết số lượng giáo viên và tổng lương của họ.
SELECT COUNT(*) AS SO_LUONG_GIAO_VIEN, SUM(LUONG) AS TONG_LUONG
FROM GIAOVIEN;

-- Q28: Cho biết số lượng giáo viên và lương trung bình của từng bộ môn.
SELECT B.TENBM, COUNT(G.MAGV) AS SO_LUONG_GV, AVG(G.LUONG) AS LUONG_TB
FROM BOMON B
LEFT JOIN GIAOVIEN G ON B.MABM = G.MABM
GROUP BY B.TENBM;

-- Q29: Cho biết tên chủ đề và số lượng đề tài thuộc về chủ đề đó.
SELECT CD.TENCD, COUNT(D.MADT) AS SO_LUONG_DT
FROM CHUDE CD
LEFT JOIN DETAI D ON CD.MACD = D.MACD
GROUP BY CD.TENCD;

-- Q30: Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó tham gia.
SELECT G.HOTEN, COUNT(T.MADT) AS SO_LUONG_DT
FROM GIAOVIEN G
LEFT JOIN THAMGIADT T ON G.MAGV = T.MAGV
GROUP BY G.HOTEN;

-- Q31: Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiệm.
SELECT G.HOTEN, COUNT(D.MADT) AS SO_DE_TAI_CN
FROM GIAOVIEN G
LEFT JOIN DETAI D ON G.MAGV = D.GVCNDT
GROUP BY G.HOTEN;

-- Q32: Với mỗi giáo viên cho biết tên giáo viên và số người thân của giáo viên đó.
SELECT G.HOTEN, COUNT(NT.TEN) AS SO_NGUOI_THAN
FROM GIAOVIEN G
LEFT JOIN NGUOITHAN NT ON G.MAGV = NT.MAGV
GROUP BY G.HOTEN;

-- Q33: Cho biết tên những giáo viên đã tham gia từ 3 đề tài trở lên.
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
GROUP BY G.HOTEN
HAVING COUNT(T.MADT) >= 3;

-- Q34: Cho biết số lượng giáo viên đã tham gia vào đề tài "Ứng dụng hóa học xanh".
SELECT COUNT(DISTINCT T.MAGV) AS SO_LUONG_GV
FROM DETAI D
JOIN THAMGIADT T ON D.MADT = T.MADT
WHERE D.TENDT = N'Ứng dụng hóa học xanh';

-- Q35: Cho biết mức lương cao nhất của các giảng viên.
SELECT MAX(LUONG) AS LUONG_CAO_NHAT
FROM GIAOVIEN;

-- Q36: Cho biết những giáo viên có lương lớn nhất.
SELECT HOTEN, LUONG
FROM GIAOVIEN
WHERE LUONG = (SELECT MAX(LUONG) FROM GIAOVIEN);

-- Q37: Cho biết lương cao nhất trong bộ môn "HTTT".
SELECT MAX(G.LUONG) AS LUONG_CAO_NHAT
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
WHERE B.TENBM = N'HTTT';

-- Q38: Cho biết tên giáo viên lớn tuổi nhất của bộ môn "Hệ thống thông tin".
SELECT TOP 1 G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
WHERE B.TENBM = N'Hệ thống thông tin'
ORDER BY G.NGSINH;

-- Q39: Cho biết tên giáo viên nhỏ tuổi nhất khoa "Công nghệ thông tin".
SELECT TOP 1 G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
JOIN KHOA K ON B.MAKHOA = K.MAKHOA
WHERE K.TENKHOA = N'Công nghệ thông tin'
ORDER BY G.NGSINH DESC;

-- Q40: Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.
SELECT G.HOTEN, K.TENKHOA
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
JOIN KHOA K ON B.MAKHOA = K.MAKHOA
WHERE G.LUONG = (SELECT MAX(LUONG) FROM GIAOVIEN);

-- Q41: Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ.
SELECT G.HOTEN, G.LUONG, B.TENBM
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
WHERE G.LUONG = (
    SELECT MAX(G2.LUONG)
    FROM GIAOVIEN G2
    WHERE G2.MABM = G.MABM
);

-- Q42: Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE D.MADT NOT IN (
    SELECT T.MADT
    FROM THAMGIADT T
    JOIN GIAOVIEN G ON T.MAGV = G.MAGV
    WHERE G.HOTEN = N'Nguyễn Hoài An'
);

-- Q43: Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia và thông tin chủ nhiệm.
SELECT D.TENDT, G.HOTEN AS TEN_CHU_NHIEM
FROM DETAI D
JOIN GIAOVIEN G ON D.GVCNDT = G.MAGV
WHERE D.MADT NOT IN (
    SELECT T.MADT
    FROM THAMGIADT T
    JOIN GIAOVIEN GV ON T.MAGV = GV.MAGV
    WHERE GV.HOTEN = N'Nguyễn Hoài An'
);

-- Q44: Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.
SELECT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
JOIN KHOA K ON B.MAKHOA = K.MAKHOA
WHERE K.TENKHOA = N'Công nghệ thông tin'
  AND G.MAGV NOT IN (
    SELECT T.MAGV
    FROM THAMGIADT T
);

-- Q45: Tìm những giáo viên không tham gia bất kỳ đề tài nào.
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE G.MAGV NOT IN (
    SELECT T.MAGV
    FROM THAMGIADT T
);

-- Q46: Cho biết giáo viên có lương lớn hơn lương của giáo viên “Nguyễn Hoài An”.
SELECT G.HOTEN, G.LUONG
FROM GIAOVIEN G
WHERE G.LUONG > (
    SELECT LUONG
    FROM GIAOVIEN
    WHERE HOTEN = N'Nguyễn Hoài An'
);

-- Q47: Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài.
SELECT DISTINCT G.HOTEN
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM
WHERE G.MAGV IN (
    SELECT T.MAGV
    FROM THAMGIADT T
);

-- Q48: Tìm giáo viên trùng tên và cùng giới tính với giáo viên khác trong cùng bộ môn.
SELECT G1.HOTEN, G1.PHAI, B.TENBM
FROM GIAOVIEN G1
JOIN GIAOVIEN G2 ON G1.HOTEN = G2.HOTEN AND G1.PHAI = G2.PHAI AND G1.MABM = G2.MABM
JOIN BOMON B ON G1.MABM = B.MABM
WHERE G1.MAGV <> G2.MAGV;

-- Q49: Tìm những giáo viên có lương lớn hơn lương của ít nhất một giáo viên bộ môn Công nghệ phần mềm.
SELECT DISTINCT G1.HOTEN
FROM GIAOVIEN G1
WHERE G1.LUONG > ANY (
    SELECT G2.LUONG
    FROM GIAOVIEN G2
    JOIN BOMON B ON G2.MABM = B.MABM
    WHERE B.TENBM = N'Công nghệ phần mềm'
);

-- Q50: Tìm những giáo viên có lương lớn hơn lương của tất cả giáo viên thuộc bộ môn Hệ thống thông tin.
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE G.LUONG > ALL (
    SELECT G2.LUONG
    FROM GIAOVIEN G2
    JOIN BOMON B ON G2.MABM = B.MABM
    WHERE B.TENBM = N'Hệ thống thông tin'
);

-- Q51: Cho biết tên khoa có đông giáo viên nhất.
SELECT TOP 1 K.TENKHOA, COUNT(G.MAGV) AS SO_LUONG_GV
FROM KHOA K
JOIN BOMON B ON K.MAKHOA = B.MAKHOA
JOIN GIAOVIEN G ON B.MABM = G.MABM
GROUP BY K.TENKHOA
ORDER BY SO_LUONG_GV DESC

-- Q52: Cho biết họ tên giáo viên chủ nhiệm nhiều đề tài nhất.
SELECT TOP 1 G.HOTEN, COUNT(D.MADT) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN DETAI D ON G.MAGV = D.GVCNDT
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q53: Cho biết mã bộ môn có nhiều giáo viên nhất.
SELECT TOP 1 B.MABM, COUNT(G.MAGV) AS SO_LUONG_GV
FROM BOMON B
JOIN GIAOVIEN G ON B.MABM = G.MABM
GROUP BY B.MABM
ORDER BY SO_LUONG_GV DESC

-- Q54: Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất.
SELECT TOP 1 G.HOTEN, B.TENBM, COUNT(T.MADT) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
JOIN THAMGIADT T ON G.MAGV = T.MAGV
GROUP BY G.HOTEN, B.TENBM
ORDER BY SO_DE_TAI DESC

-- Q55: Cho biết tên giáo viên tham gia nhiều đề tài nhất của bộ môn HTTT.
SELECT TOP 1 G.HOTEN, COUNT(T.MADT) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
JOIN THAMGIADT T ON G.MAGV = T.MAGV
WHERE B.TENBM = N'HTTT'
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q56: Cho biết tên giáo viên và tên bộ môn của giáo viên có nhiều người thân nhất.
SELECT TOP 1 G.HOTEN, B.TENBM, COUNT(NT.TEN) AS SO_NGUOI_THAN
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
LEFT JOIN NGUOITHAN NT ON G.MAGV = NT.MAGV
GROUP BY G.HOTEN, B.TENBM
ORDER BY SO_NGUOI_THAN DESC

-- Q57: Cho biết tên trưởng bộ môn mà chủ nhiệm nhiều đề tài nhất.
SELECT TOP 1 G.HOTEN, COUNT(D.MADT) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM
JOIN DETAI D ON G.MAGV = D.GVCNDT
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q58: Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM CHUDE C
    WHERE NOT EXISTS (
        SELECT *
        FROM DETAI D
        JOIN THAMGIADT T ON D.MADT = T.MADT
        WHERE T.MAGV = G.MAGV AND D.MACD = C.MACD
    )
);

-- Q58: Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM CHUDE C
    WHERE NOT EXISTS (
        SELECT *
        FROM DETAI D
        JOIN THAMGIADT T ON D.MADT = T.MADT
        WHERE T.MAGV = G.MAGV AND D.MACD = C.MACD
    )
);

-- Q59: Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn "Hóa Hữu Cơ" tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE NOT EXISTS (
    SELECT *
    FROM GIAOVIEN G
    JOIN BOMON B ON G.MABM = B.MABM
    WHERE B.TENBM = N'Hóa Hữu Cơ'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q60: Cho biết tên đề tài có tất cả giảng viên bộ môn "Hệ thống thông tin" tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE NOT EXISTS (
    SELECT *
    FROM GIAOVIEN G
    JOIN BOMON B ON G.MABM = B.MABM
    WHERE B.TENBM = N'Hệ thống thông tin'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q61: Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là "QLGD".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM DETAI D
    WHERE D.MACD = 'QLGD'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q62: Cho biết tên giáo viên nào tham gia tất cả các đề tài mà giáo viên "Trần Trà Hương" đã tham gia.
SELECT G1.HOTEN
FROM GIAOVIEN G1
WHERE NOT EXISTS (
    SELECT *
    FROM THAMGIADT T1
    JOIN GIAOVIEN G2 ON T1.MAGV = G2.MAGV
    WHERE G2.HOTEN = N'Trần Trà Hương'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T2
        WHERE T2.MAGV = G1.MAGV AND T2.MADT = T1.MADT
    )
);

-- Q63: Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa "Sinh Học" tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE NOT EXISTS (
    SELECT *
    FROM GIAOVIEN G
    JOIN BOMON B ON G.MABM = B.MABM
    JOIN KHOA K ON B.MAKHOA = K.MAKHOA
    WHERE K.TENKHOA = N'Sinh Học'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q64: Cho biết tên giáo viên nào tham gia tất cả các công việc của đề tài "006".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM CONGVIEC C
    WHERE C.MADT = '006'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = C.MADT AND T.STT = C.SOTT
    )
);

-- Q65: Cho biết tên giáo viên nào đã tham gia tất cả các đề tài của chủ đề "Ứng dụng công nghệ".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM DETAI D
    JOIN CHUDE C ON D.MACD = C.MACD
    WHERE C.TENCD = N'Ứng dụng công nghệ'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q58: Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM CHUDE C
    WHERE NOT EXISTS (
        SELECT *
        FROM DETAI D
        JOIN THAMGIADT T ON D.MADT = T.MADT
        WHERE T.MAGV = G.MAGV AND D.MACD = C.MACD
    )
);

-- Q59: Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn "Hóa Hữu Cơ" tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE NOT EXISTS (
    SELECT *
    FROM GIAOVIEN G
    JOIN BOMON B ON G.MABM = B.MABM
    WHERE B.TENBM = N'Hóa Hữu Cơ'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q60: Cho biết tên đề tài có tất cả giảng viên bộ môn "Hệ thống thông tin" tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE NOT EXISTS (
    SELECT *
    FROM GIAOVIEN G
    JOIN BOMON B ON G.MABM = B.MABM
    WHERE B.TENBM = N'Hệ thống thông tin'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q61: Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là "QLGD".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM DETAI D
    WHERE D.MACD = 'QLGD'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q62: Cho biết tên giáo viên nào tham gia tất cả các đề tài mà giáo viên "Trần Trà Hương" đã tham gia.
SELECT G1.HOTEN
FROM GIAOVIEN G1
WHERE NOT EXISTS (
    SELECT *
    FROM THAMGIADT T1
    JOIN GIAOVIEN G2 ON T1.MAGV = G2.MAGV
    WHERE G2.HOTEN = N'Trần Trà Hương'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T2
        WHERE T2.MAGV = G1.MAGV AND T2.MADT = T1.MADT
    )
);

-- Q63: Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa "Sinh Học" tham gia.
SELECT D.TENDT
FROM DETAI D
WHERE NOT EXISTS (
    SELECT *
    FROM GIAOVIEN G
    JOIN BOMON B ON G.MABM = B.MABM
    JOIN KHOA K ON B.MAKHOA = K.MAKHOA
    WHERE K.TENKHOA = N'Sinh Học'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q64: Cho biết tên giáo viên nào tham gia tất cả các công việc của đề tài "006".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM CONGVIEC C
    WHERE C.MADT = '006'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = C.MADT AND T.STT = C.SOTT
    )
);

-- Q65: Cho biết tên giáo viên nào đã tham gia tất cả các đề tài của chủ đề "Ứng dụng công nghệ".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM DETAI D
    JOIN CHUDE C ON D.MACD = C.MACD
    WHERE C.TENCD = N'Ứng dụng công nghệ'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q66: Tìm các đề tài có ít nhất 5 giáo viên tham gia.
SELECT D.TENDT, COUNT(T.MAGV) AS SO_GV_THAM_GIA
FROM DETAI D
JOIN THAMGIADT T ON D.MADT = T.MADT
GROUP BY D.TENDT
HAVING COUNT(T.MAGV) >= 5;

-- Q67: Cho biết giáo viên tham gia nhiều công việc nhất trong tất cả các đề tài.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_CONG_VIEC
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
GROUP BY G.HOTEN
ORDER BY SO_CONG_VIEC DESC

-- Q68: Tìm tên đề tài có chi phí cao nhất.
SELECT TOP 1 TENDT, KINHPHI
FROM DETAI
ORDER BY KINHPHI DESC

-- Q69: Tìm giáo viên có tổng phụ cấp cao nhất từ các công việc họ tham gia.
SELECT TOP 1 G.HOTEN, SUM(T.PHUCAP) AS TONG_PHUCAP
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
GROUP BY G.HOTEN
ORDER BY TONG_PHUCAP DESC

-- Q70: Tìm giáo viên có số lượng người thân nhiều nhất.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_NGUOI_THAN
FROM GIAOVIEN G
JOIN NGUOITHAN N ON G.MAGV = N.MAGV
GROUP BY G.HOTEN
ORDER BY SO_NGUOI_THAN DESC

-- Q71: Tìm bộ môn có tổng lương giáo viên cao nhất.
SELECT TOP 1 B.TENBM, SUM(G.LUONG) AS TONG_LUONG
FROM BOMON B
JOIN GIAOVIEN G ON B.MABM = G.MABM
GROUP BY B.TENBM
ORDER BY TONG_LUONG DESC

-- Q72: Tìm giáo viên là trưởng bộ môn tham gia ít đề tài nhất.
SELECT TOP 1 G.HOTEN, COUNT(T.MADT) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN BOMON B ON G.MAGV = B.TRUONGBM
LEFT JOIN THAMGIADT T ON G.MAGV = T.MAGV
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI ASC

-- Q73: Tìm giáo viên làm chủ nhiệm nhiều đề tài có chi phí lớn hơn 100 triệu nhất.
SELECT TOP 1 G.HOTEN, COUNT(D.MADT) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN DETAI D ON G.MAGV = D.GVCNDT
WHERE D.KINHPHI > 100000000
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q74: Tìm khoa có số lượng bộ môn lớn nhất.
SELECT TOP 1 K.TENKHOA, COUNT(B.MABM) AS SO_BO_MON
FROM KHOA K
JOIN BOMON B ON K.MAKHOA = B.MAKHOA
GROUP BY K.TENKHOA
ORDER BY SO_BO_MON DESC

-- Q75: Tìm giáo viên có số lượng công việc hoàn thành nhiều nhất.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_CONG_VIEC
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
WHERE T.KETQUA = N'Hoàn thành'
GROUP BY G.HOTEN
ORDER BY SO_CONG_VIEC DESC

-- Q76: Tìm tên đề tài có số lượng công việc nhiều nhất.
SELECT TOP 1 D.TENDT, COUNT(C.SOTT) AS SO_CONG_VIEC
FROM DETAI D
JOIN CONGVIEC C ON D.MADT = C.MADT
GROUP BY D.TENDT
ORDER BY SO_CONG_VIEC DESC

-- Q77: Tìm giáo viên có số lượng đề tài chưa hoàn thành nhiều nhất.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
WHERE T.KETQUA = N'Chưa hoàn thành'
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q78: Tìm các giáo viên tham gia tất cả các đề tài thuộc cấp quản lý "Cấp nhà nước".
SELECT G.HOTEN
FROM GIAOVIEN G
WHERE NOT EXISTS (
    SELECT *
    FROM DETAI D
    WHERE D.CAPQL = N'Cấp nhà nước'
      AND NOT EXISTS (
        SELECT *
        FROM THAMGIADT T
        WHERE T.MAGV = G.MAGV AND T.MADT = D.MADT
    )
);

-- Q79: Tìm tên đề tài mà giáo viên "Nguyễn Văn A" tham gia nhưng không hoàn thành.
SELECT D.TENDT
FROM DETAI D
JOIN THAMGIADT T ON D.MADT = T.MADT
JOIN GIAOVIEN G ON T.MAGV = G.MAGV
WHERE G.HOTEN = N'Nguyễn Văn A' AND T.KETQUA = N'Chưa hoàn thành';

-- Q80: Tìm giáo viên có số lượng đề tài tham gia trong năm 2023 nhiều nhất.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
JOIN DETAI D ON T.MADT = D.MADT
WHERE YEAR(D.NGAYBD) = 2023
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q81: Tìm các đề tài có trưởng bộ môn "Lê Văn B" làm chủ nhiệm.
SELECT D.TENDT
FROM DETAI D
JOIN GIAOVIEN G ON D.GVCNDT = G.MAGV
WHERE G.HOTEN = N'Lê Văn B';

-- Q82: Tìm giáo viên có số lượng đề tài thuộc chủ đề "Môi trường" tham gia nhiều nhất.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
JOIN DETAI D ON T.MADT = D.MADT
JOIN CHUDE C ON D.MACD = C.MACD
WHERE C.TENCD = N'Môi trường'
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Q83: Tìm giáo viên có lương cao nhất trong bộ môn "Công nghệ thông tin".
SELECT TOP 1 G.HOTEN, G.LUONG
FROM GIAOVIEN G
JOIN BOMON B ON G.MABM = B.MABM
WHERE B.TENBM = N'Công nghệ thông tin'
ORDER BY G.LUONG DESC

-- Q84: Tìm đề tài có chi phí thấp nhất trong số các đề tài thuộc chủ đề "Khoa học dữ liệu".
SELECT TOP 1 D.TENDT, D.KINHPHI
FROM DETAI D
JOIN CHUDE C ON D.MACD = C.MACD
WHERE C.TENCD = N'Khoa học dữ liệu'
ORDER BY D.KINHPHI ASC

-- Q85: Tìm giáo viên tham gia nhiều đề tài thuộc "Cấp trường" nhất.
SELECT TOP 1 G.HOTEN, COUNT(*) AS SO_DE_TAI
FROM GIAOVIEN G
JOIN THAMGIADT T ON G.MAGV = T.MAGV
JOIN DETAI D ON T.MADT = D.MADT
WHERE D.CAPQL = N'Cấp trường'
GROUP BY G.HOTEN
ORDER BY SO_DE_TAI DESC

-- Phần ràng buộc toàn vẹn:
-- R1: Tên tài phải duy nhất.
ALTER TABLE DETAI
ADD CONSTRAINT UC_TENDT UNIQUE (TENDT);

-- R2: Trưởng bộ môn phải sinh trước 1975.
ALTER TABLE BOMON
ADD CONSTRAINT CK_TRUONGBM_NAMSINH CHECK (
    TRUONGBM IN (
        SELECT MAGV
        FROM GIAOVIEN
        WHERE YEAR(NGSINH) < 1975
    )
);

-- R3: Một bộ môn có tối thiểu 1 giáo viên nữ.
-- R1: Bộ môn phải có ít nhất 1 giáo viên nữ.
CREATE TRIGGER trg_CheckFemale ON BOMON
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM GIAOVIEN g
            WHERE g.MABM = i.MABM AND g.PHAI = N'Nữ'
        )
    )
    BEGIN
        RAISERROR(N'Bộ môn phải có ít nhất 1 giáo viên nữ.', 16, 1);
        ROLLBACK TRANSACTION; -- Quan trọng: rollback transaction để ngăn chặn thay đổi
    END
END;

-- R2: Một giáo viên phải có ít nhất 1 số điện thoại.
CREATE TRIGGER trg_CheckPhone ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM GV_DT gvdt
            WHERE gvdt.MAGV = i.MAGV
        )
    )
    BEGIN
        RAISERROR(N'Giáo viên phải có ít nhất 1 số điện thoại.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R3: Một giáo viên có tối đa 3 số điện thoại.
CREATE TRIGGER trg_MaxPhone ON GV_DT
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE (SELECT COUNT(*) FROM GV_DT WHERE MAGV = i.MAGV) > 3
    )
    BEGIN
        RAISERROR(N'Giáo viên chỉ được có tối đa 3 số điện thoại.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R4: Một bộ môn phải có tối thiểu 4 giáo viên.
CREATE TRIGGER trg_MinTeachersInDept ON GIAOVIEN
AFTER INSERT, DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        WHERE (SELECT COUNT(*) FROM GIAOVIEN WHERE MABM = d.MABM) < 4
    )
    BEGIN
        RAISERROR(N'Mỗi bộ môn phải có ít nhất 4 giáo viên.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R5: Trưởng bộ môn phải là người lớn tuổi nhất trong bộ môn.
CREATE TRIGGER trg_ ON BOMON
AFTER UPDATE -- Thay vì INSTEAD OF UPDATE để không bỏ qua logic cập nhật BOMON
AS
BEGIN
    IF EXISTS (
      SELECT 1
      FROM inserted i
      WHERE NOT EXISTS (
        SELECT 1
        FROM GIAOVIEN g
        INNER JOIN BOMON b ON g.MABM = b.MABM
        WHERE b.MABM = i.MABM AND g.MAGV = i.TRUONGBM
        AND g.NGSINH = (SELECT MIN(NGSINH) FROM GIAOVIEN WHERE MABM = i.MABM)
      )
    )
    BEGIN
        RAISERROR(N'Trưởng bộ môn phải là người lớn tuổi nhất trong bộ môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R6: Nếu một giáo viên đã là trưởng bộ môn thì không làm người quản lý chuyên môn.
CREATE TRIGGER trg_NoConflictDeptHead ON GIAOVIEN
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE EXISTS (
            SELECT 1
            FROM BOMON b
            WHERE b.TRUONGBM = i.MAGV AND i.GVQLCM IS NOT NULL
        )
    )
    BEGIN
        RAISERROR(N'Giáo viên là trưởng bộ môn không được làm người quản lý chuyên môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R7: Trưởng bộ môn phải là người lớn tuổi nhất trong bộ môn.
CREATE TRIGGER trg_DeptHeadOldest ON BOMON
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.TRUONGBM IS NOT NULL AND NOT EXISTS (
            SELECT 1
            FROM GIAOVIEN g
            WHERE g.MABM = i.MABM
              AND g.MAGV = i.TRUONGBM
              AND g.NGSINH = (SELECT MIN(NGSINH) FROM GIAOVIEN WHERE MABM = i.MABM)
        )
    )
    BEGIN
        RAISERROR(N'Trưởng bộ môn phải là người lớn tuổi nhất trong bộ môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R8: Nếu một giáo viên đã là trưởng bộ môn thì không làm người quản lý chuyên môn.
CREATE TRIGGER trg_NoConflictDeptHead ON GIAOVIEN
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE EXISTS (SELECT 1 FROM BOMON b WHERE b.TRUONGBM = i.MAGV) AND i.GVQLCM IS NOT NULL
    )
    BEGIN
        RAISERROR(N'Giáo viên là trưởng bộ môn không thể làm người quản lý chuyên môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R9: Giáo viên và người quản lý chuyên môn phải thuộc về một bộ môn.
CREATE TRIGGER trg_SameDeptForManager ON GIAOVIEN
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.GVQLCM IS NOT NULL AND NOT EXISTS (
            SELECT 1
            FROM GIAOVIEN g
            WHERE g.MAGV = i.GVQLCM AND g.MABM = i.MABM
        )
    )
    BEGIN
        RAISERROR(N'Giáo viên và người quản lý chuyên môn phải thuộc về cùng một bộ môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R10: Mỗi giáo viên chỉ có tối đa 1 vợ/chồng.
CREATE TRIGGER trg_MaxSpouse ON NGUOITHAN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE (SELECT COUNT(*) FROM NGUOITHAN WHERE MAGV = i.MAGV AND (QUANHE = N'Vợ' OR QUANHE = N'Chồng')) > 1
    )
    BEGIN
        RAISERROR(N'Mỗi giáo viên chỉ được có tối đa 1 vợ/chồng.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R11: Giáo viên nam chỉ có vợ là nữ và ngược lại.
CREATE TRIGGER trg_GenderSpouse ON NGUOITHAN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN GIAOVIEN g ON i.MAGV = g.MAGV
        WHERE i.PHAI IN (N'Vợ', N'Chồng')
          AND ((g.PHAI = N'Nam' AND i.PHAI != N'Nữ') OR (g.PHAI = N'Nữ' AND i.PHAI != N'Nam'))
    )
    BEGIN
        RAISERROR(N'Giới tính giáo viên và vợ/chồng không hợp lệ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R12: Con gái/con trai phải có năm sinh lớn hơn năm sinh của giáo viên.
CREATE TRIGGER trg_ChildBirthYear ON NGUOITHAN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN GIAOVIEN g ON i.MAGV = g.MAGV
        WHERE i.QUANHE IN (N'Con gái', N'Con trai') AND i.NGSINH <= g.NGSINH
    )
    BEGIN
        RAISERROR(N'Năm sinh của con phải lớn hơn năm sinh của giáo viên.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R13: Một giáo viên chỉ làm chủ nhiệm tối đa 3 đề tài.
CREATE TRIGGER trg_MaxProjectsLeader ON DETAI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE (SELECT COUNT(*) FROM DETAI WHERE GVCNDT = i.GVCNDT) > 3
    )
    BEGIN
        RAISERROR(N'Giáo viên chỉ được làm chủ nhiệm tối đa 3 đề tài.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R14: Một đề tài phải có ít nhất một công việc. (Cần xem xét logic)
CREATE TRIGGER trg_MinTasksPerProject ON CONGVIEC
AFTER DELETE -- Chỉ cần AFTER DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        WHERE NOT EXISTS (SELECT 1 FROM CONGVIEC WHERE MADT = d.MADT)
    )
    BEGIN
        RAISERROR(N'Một đề tài phải có ít nhất một công việc.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R15: Lương của giáo viên phải nhỏ hơn lương của người quản lý.
CREATE TRIGGER trg_SalaryManagerValidation ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.GVQLCM IS NOT NULL AND EXISTS (
            SELECT 1
            FROM GIAOVIEN g
            WHERE g.MAGV = i.GVQLCM AND i.LUONG >= g.LUONG
        )
    )
    BEGIN
        RAISERROR(N'Lương của giáo viên phải nhỏ hơn lương của người quản lý.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R16: Lương của trưởng bộ môn phải lớn hơn lương của các giáo viên trong bộ môn.
CREATE TRIGGER trg_SalaryHeadValidation ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE EXISTS (
            SELECT 1
            FROM BOMON b
            WHERE b.TRUONGBM = i.MAGV
        )
        AND EXISTS (
            SELECT 1
            FROM GIAOVIEN g
            WHERE g.MABM = (SELECT MABM FROM BOMON WHERE TRUONGBM = i.MAGV) AND g.LUONG >= i.LUONG
        )
    )
    BEGIN
        RAISERROR(N'Lương của trưởng bộ môn phải lớn hơn lương của các giáo viên trong bộ môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R17: Bộ môn nào cũng phải có trưởng bộ môn và trưởng bộ môn phải là một giáo viên trong trường.
CREATE TRIGGER trg_DeptHasHead ON BOMON
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.TRUONGBM IS NULL OR NOT EXISTS (SELECT 1 FROM GIAOVIEN g WHERE g.MAGV = i.TRUONGBM)
    )
    BEGIN
        RAISERROR(N'Mỗi bộ môn phải có trưởng bộ môn là giáo viên trong trường.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R18: Một giáo viên chỉ quản lý tối đa 3 giáo viên khác.
CREATE TRIGGER trg_MaxManagedTeachers ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE (SELECT COUNT(*) FROM GIAOVIEN WHERE GVQLCM = i.MAGV) > 3
    )
    BEGIN
        RAISERROR(N'Một giáo viên chỉ được quản lý tối đa 3 giáo viên khác.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- R19: Giáo viên chỉ tham gia những đề tài mà giáo viên chủ nhiệm đề tài là người cùng bộ môn với giáo viên đó.
CREATE TRIGGER trg_SameDeptProjects ON THAMGIADT
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1
            FROM DETAI d
            JOIN GIAOVIEN g1 ON d.GVCNDT = g1.MAGV
            JOIN GIAOVIEN g2 ON i.MAGV = g2.MAGV
            WHERE d.MADT = i.MADT AND g1.MABM = g2.MABM
        )
    )
    BEGIN
        RAISERROR(N'Giáo viên chỉ được tham gia đề tài của giáo viên chủ nhiệm cùng bộ môn.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
