USE QL_BenhNhan_PhongKham;
GO

INSERT INTO ChuyenKhoa (MaCK, TenCK)
VALUES
('CK001', N'Nội tổng quát'),
('CK002', N'Da liễu'),
('CK003', N'Tim mạch'),
('CK004', N'Hô hấp'),
('CK005', N'Gan mật');
GO

INSERT INTO PhongKham (MaPhong, TenPhong, ViTri)
VALUES
('PH001', N'Phòng 101', N'Tầng 1'),
('PH002', N'Phòng 102', N'Tầng 1'),
('PH003', N'Phòng 103', N'Tầng 2'),
('PH004', N'Phòng 104', N'Tầng 2'),
('PH005', N'Phòng 105', N'Tầng 3');
GO

INSERT INTO DichVuKyThuat (MaDV, TenDV, DonGia)
VALUES
('DV001', N'Khám tổng quát', 150000),
('DV002', N'Soi da', 200000),
('DV003', N'Điện tim', 250000),
('DV004', N'Đo hô hấp', 180000),
('DV005', N'Xét nghiệm men gan', 300000);
GO

INSERT INTO DanhMucThuoc (MaThuoc, TenThuoc, DonViTinh, DonGia)
VALUES
('TH001', N'Paracetamol', N'Viên', 2000),
('TH002', N'Vitamin C', N'Viên', 1500),
('TH003', N'Cetirizine', N'Viên', 3000),
('TH004', N'Aspirin', N'Viên', 4000),
('TH005', N'Omeprazole', N'Viên', 5000),
('TH006', N'Maalox', N'Gói', 6000),
('TH007', N'Amlodipine', N'Viên', 4500),
('TH008', N'Salbutamol', N'Bình xịt', 70000),
('TH009', N'Prednisolone', N'Viên', 3500),
('TH010', N'Loratadine', N'Viên', 3000),
('TH011', N'Sắt', N'Viên', 2500),
('TH012', N'Vitamin B12', N'Viên', 4000),
('TH013', N'Tenofovir', N'Viên', 8000),
('TH014', N'Oresol', N'Gói', 1000);
GO