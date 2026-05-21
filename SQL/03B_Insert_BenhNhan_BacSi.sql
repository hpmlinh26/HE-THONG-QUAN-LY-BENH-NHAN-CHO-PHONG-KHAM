USE QL_BenhNhan_PhongKham;
GO

INSERT INTO BenhNhan (MaBN, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, NhomMau, TienSuBenh)
VALUES
('BN001', N'Nguyễn Văn An', '2000-02-15', N'Nam', N'Hà Nội', '0901000001', 'O', N'Viêm xoang'),
('BN002', N'Lê Thị Mai', '1998-07-20', N'Nữ', N'Bắc Ninh', '0901000002', 'A', N'Dị ứng hải sản'),
('BN003', N'Phạm Quốc Bảo', '1995-11-08', N'Nam', N'Hải Phòng', '0901000003', 'B', N'Không có'),
('BN004', N'Trần Thu Hương', '2001-03-12', N'Nữ', N'Hà Nam', '0901000004', 'AB', N'Viêm dạ dày'),
('BN005', N'Hoàng Minh Khôi', '1992-09-25', N'Nam', N'Nam Định', '0901000005', 'O', N'Tăng huyết áp'),
('BN006', N'Đặng Ngọc Linh', '2003-01-18', N'Nữ', N'Thái Bình', '0901000006', 'A', N'Hen suyễn'),
('BN007', N'Bùi Đức Anh', '1999-06-30', N'Nam', N'Ninh Bình', '0901000007', 'B', N'Dị ứng thuốc kháng sinh'),
('BN008', N'Vũ Phương Thảo', '1997-12-05', N'Nữ', N'Hà Nội', '0901000008', 'O', N'Thiếu máu nhẹ'),
('BN009', N'Đỗ Tuấn Kiệt', '1994-04-22', N'Nam', N'Hưng Yên', '0901000009', 'AB', N'Viêm gan B'),
('BN010', N'Nguyễn Hà Vy', '2002-10-14', N'Nữ', N'Hải Dương', '0901000010', 'A', N'Không có');
GO

INSERT INTO BacSi (MaBS, HoTen, GioiTinh, SoDienThoai, MaCK, MaPhong)
VALUES
('BS001', N'Trần Minh Đức', N'Nam', '0912000001', 'CK001', 'PH001'),
('BS002', N'Nguyễn Thu Hà', N'Nữ', '0912000002', 'CK002', 'PH002'),
('BS003', N'Hoàng Minh Tuấn', N'Nam', '0912000003', 'CK003', 'PH003'),
('BS004', N'Vũ Hải Nam', N'Nam', '0912000004', 'CK004', 'PH004'),
('BS005', N'Phạm Gia Huy', N'Nam', '0912000005', 'CK005', 'PH005');
GO