USE QL_BenhNhan_PhongKham;
GO

SELECT 'ChuyenKhoa' AS TenBang, COUNT(*) AS SoDong FROM ChuyenKhoa
UNION ALL
SELECT 'PhongKham', COUNT(*) FROM PhongKham
UNION ALL
SELECT 'DichVuKyThuat', COUNT(*) FROM DichVuKyThuat
UNION ALL
SELECT 'DanhMucThuoc', COUNT(*) FROM DanhMucThuoc
UNION ALL
SELECT 'BenhNhan', COUNT(*) FROM BenhNhan
UNION ALL
SELECT 'BacSi', COUNT(*) FROM BacSi
UNION ALL
SELECT 'LichHen', COUNT(*) FROM LichHen
UNION ALL
SELECT 'PhieuKham', COUNT(*) FROM PhieuKham
UNION ALL
SELECT 'ChiTietDonThuoc', COUNT(*) FROM ChiTietDonThuoc
UNION ALL
SELECT 'HoSoBenhAn', COUNT(*) FROM HoSoBenhAn;
GO