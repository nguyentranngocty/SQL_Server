-- Tạo bảng "sinh_vien"
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT
);

-- Chèn 20 dòng dữ liệu thực tế vào bảng
INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);

-- Xếp hạng sinh viên toàn trường dựa trên điểm tb giảm dần
SELECT
	ma_sinh_vien
	, ho_ten
	, diem_trung_binh
	, RANK() OVER(
		ORDER BY diem_trung_binh DESC
	) AS "xep_hang"
FROM sinh_vien;

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần
SELECT 
	ma_sinh_vien
	, ho_ten
	, ma_lop_hoc
	, diem_trung_binh
	, RANK() OVER(
		PARTITION BY ma_lop_hoc
		ORDER BY diem_trung_binh DESC
	) AS "xep_hang"
FROM sinh_vien;

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần, không nhảy hạng
SELECT 
	ma_sinh_vien
	, ho_ten
	, ma_lop_hoc
	, diem_trung_binh
	, ROW_NUMBER() OVER(
		PARTITION BY ma_lop_hoc
		ORDER BY diem_trung_binh DESC
	) AS "xep_hang"
FROM sinh_vien;
