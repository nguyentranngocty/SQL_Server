﻿CREATE DATABASE QuanLyDeTaiDB
USE QuanLyDeTaiDB

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
