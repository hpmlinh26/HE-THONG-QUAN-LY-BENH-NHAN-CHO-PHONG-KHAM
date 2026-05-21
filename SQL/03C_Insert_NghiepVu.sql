USE QL_BenhNhan_PhongKham;
GO

INSERT INTO LichHen (MaLH, MaBN, MaBS, NgayHen, GioHen, TrangThai)
VALUES
('LH001', 'BN001', 'BS001', '2026-05-01', '08:00', N'Đã khám'),
('LH002', 'BN002', 'BS002', '2026-05-02', '09:30', N'Đã khám'),
('LH003', 'BN003', 'BS003', '2026-05-03', '14:00', N'Đã khám'),
('LH004', 'BN004', 'BS001', '2026-05-04', '08:30', N'Đã khám'),
('LH005', 'BN005', 'BS003', '2026-05-05', '10:00', N'Đã khám'),
('LH006', 'BN006', 'BS004', '2026-05-06', '15:00', N'Đã khám'),
('LH007', 'BN007', 'BS002', '2026-05-07', '09:00', N'Đã khám'),
('LH008', 'BN008', 'BS001', '2026-05-08', '13:30', N'Đã khám'),
('LH009', 'BN009', 'BS005', '2026-05-09', '10:30', N'Đã khám'),
('LH010', 'BN010', 'BS001', '2026-05-10', '16:00', N'Đã khám');
GO

INSERT INTO PhieuKham (MaPK, MaBN, MaBS, MaDV, NgayKham, TrieuChung, ChanDoan, TongTien)
VALUES
('PK001', 'BN001', 'BS001', 'DV001', '2026-05-01', N'Sốt, ho', N'Viêm họng', 177500),
('PK002', 'BN002', 'BS002', 'DV002', '2026-05-02', N'Ngứa, nổi mẩn', N'Viêm da dị ứng', 221000),
('PK003', 'BN003', 'BS003', 'DV003', '2026-05-03', N'Đau ngực nhẹ', N'Theo dõi rối loạn nhịp', 270000),
('PK004', 'BN004', 'BS001', 'DV001', '2026-05-04', N'Đau thượng vị', N'Viêm dạ dày', 280000),
('PK005', 'BN005', 'BS003', 'DV003', '2026-05-05', N'Đau đầu, chóng mặt', N'Tăng huyết áp', 295000),
('PK006', 'BN006', 'BS004', 'DV004', '2026-05-06', N'Khó thở nhẹ', N'Hen phế quản nhẹ', 267500),
('PK007', 'BN007', 'BS002', 'DV002', '2026-05-07', N'Nổi mẩn đỏ', N'Dị ứng da', 221000),
('PK008', 'BN008', 'BS001', 'DV001', '2026-05-08', N'Mệt mỏi, da xanh', N'Thiếu máu nhẹ', 265000),
('PK009', 'BN009', 'BS005', 'DV005', '2026-05-09', N'Mệt mỏi, chán ăn', N'Viêm gan B', 540000),
('PK010', 'BN010', 'BS001', 'DV001', '2026-05-10', N'Sốt nhẹ, đau đầu', N'Cảm cúm', 171000);
GO

INSERT INTO ChiTietDonThuoc (MaPK, MaThuoc, SoLuong, LieuDung)
VALUES
('PK001', 'TH001', 10, N'2 viên/ngày'),
('PK001', 'TH002', 5, N'1 viên/ngày'),
('PK002', 'TH003', 7, N'1 viên/ngày'),
('PK003', 'TH004', 5, N'1 viên/ngày'),
('PK004', 'TH005', 14, N'1 viên/ngày'),
('PK004', 'TH006', 10, N'2 gói/ngày'),
('PK005', 'TH007', 10, N'1 viên/ngày'),
('PK006', 'TH008', 1, N'Xịt khi khó thở'),
('PK006', 'TH009', 5, N'1 viên/ngày'),
('PK007', 'TH010', 7, N'1 viên/ngày'),
('PK008', 'TH011', 30, N'1 viên/ngày'),
('PK008', 'TH012', 10, N'1 viên/ngày'),
('PK009', 'TH013', 30, N'1 viên/ngày'),
('PK010', 'TH001', 8, N'2 viên/ngày'),
('PK010', 'TH014', 5, N'1 gói/ngày');
GO

INSERT INTO HoSoBenhAn (MaHS, MaBN, NgayLap, ChanDoan, KetQua)
VALUES
('HS001', 'BN001', '2026-05-01', N'Viêm họng', N'Điều trị bằng thuốc, theo dõi nếu sốt kéo dài'),
('HS002', 'BN002', '2026-05-02', N'Viêm da dị ứng', N'Hạn chế tiếp xúc dị nguyên'),
('HS003', 'BN003', '2026-05-03', N'Theo dõi rối loạn nhịp', N'Hẹn kiểm tra lại sau 7 ngày'),
('HS004', 'BN004', '2026-05-04', N'Viêm dạ dày', N'Dùng thuốc theo đơn, hạn chế đồ cay nóng'),
('HS005', 'BN005', '2026-05-05', N'Tăng huyết áp', N'Theo dõi huyết áp hằng ngày'),
('HS006', 'BN006', '2026-05-06', N'Hen phế quản nhẹ', N'Mang thuốc xịt khi cần'),
('HS007', 'BN007', '2026-05-07', N'Dị ứng da', N'Uống thuốc theo đơn, tái khám nếu nặng hơn'),
('HS008', 'BN008', '2026-05-08', N'Thiếu máu nhẹ', N'Bổ sung sắt và vitamin'),
('HS009', 'BN009', '2026-05-09', N'Viêm gan B', N'Theo dõi định kỳ chức năng gan'),
('HS010', 'BN010', '2026-05-10', N'Cảm cúm', N'Nghỉ ngơi, uống nhiều nước');
GO