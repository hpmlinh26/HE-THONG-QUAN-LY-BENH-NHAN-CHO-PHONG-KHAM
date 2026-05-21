USE QL_BenhNhan_PhongKham;
GO

-- Truy vấn 1: Xuất sổ khám bệnh điện tử cho bệnh nhân BN001
SELECT 
    BN.MaBN,
    BN.HoTen AS HoTenBenhNhan,
    BN.NgaySinh,
    BN.GioiTinh,
    BN.NhomMau,
    BN.TienSuBenh,

    PK.MaPK,
    PK.NgayKham,
    BS.HoTen AS BacSiPhuTrach,
    CK.TenCK AS ChuyenKhoa,
    DV.TenDV AS DichVuKham,
    PK.TrieuChung,
    PK.ChanDoan,

    STUFF((
        SELECT 
            N', ' + T.TenThuoc
            + N' - SL: ' + CAST(CT.SoLuong AS NVARCHAR(10))
            + N' - Liều: ' + CT.LieuDung
        FROM ChiTietDonThuoc CT
        INNER JOIN DanhMucThuoc T
            ON CT.MaThuoc = T.MaThuoc
        WHERE CT.MaPK = PK.MaPK
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, N'') AS DanhSachThuoc,

    PK.TongTien AS TongTienCanThanhToan

FROM BenhNhan BN
INNER JOIN PhieuKham PK
    ON BN.MaBN = PK.MaBN
INNER JOIN BacSi BS
    ON PK.MaBS = BS.MaBS
INNER JOIN ChuyenKhoa CK
    ON BS.MaCK = CK.MaCK
INNER JOIN DichVuKyThuat DV
    ON PK.MaDV = DV.MaDV
WHERE BN.MaBN = 'BN001'
ORDER BY PK.NgayKham;
GO

-- Truy vấn 2: Thống kê doanh thu theo từng dịch vụ
SELECT 
    DV.MaDV,
    DV.TenDV,
    COUNT(PK.MaPK) AS SoLuotSuDung,
    SUM(PK.TongTien) AS TongDoanhThu
FROM DichVuKyThuat DV
INNER JOIN PhieuKham PK
    ON DV.MaDV = PK.MaDV
WHERE MONTH(PK.NgayKham) = MONTH(GETDATE())
  AND YEAR(PK.NgayKham) = YEAR(GETDATE())
GROUP BY DV.MaDV, DV.TenDV
ORDER BY TongDoanhThu DESC;
GO

-- Truy vấn 3: Top 3 bác sĩ có nhiều lịch hẹn nhất
SELECT TOP 3
    BS.MaBS,
    BS.HoTen AS HoTenBacSi,
    CK.TenCK AS ChuyenKhoa,
    COUNT(LH.MaLH) AS SoLuotDatLich,
    COUNT(DISTINCT LH.MaBN) AS SoBenhNhanKhacNhau
FROM BacSi BS
INNER JOIN ChuyenKhoa CK
    ON BS.MaCK = CK.MaCK
INNER JOIN LichHen LH
    ON BS.MaBS = LH.MaBS
GROUP BY BS.MaBS, BS.HoTen, CK.TenCK
ORDER BY SoLuotDatLich DESC, SoBenhNhanKhacNhau DESC;
GO