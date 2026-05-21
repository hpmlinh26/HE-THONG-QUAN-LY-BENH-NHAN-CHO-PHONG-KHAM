USE QL_BenhNhan_PhongKham;
GO

CREATE TABLE BenhNhan (
    MaBN CHAR(5) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh NVARCHAR(10) CHECK (GioiTinh IN (N'Nam', N'Nữ', N'Khác')),
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(15) UNIQUE,
    NhomMau VARCHAR(5) CHECK (NhomMau IN ('A', 'B', 'AB', 'O')),
    TienSuBenh NVARCHAR(500)
);
GO

CREATE TABLE ChuyenKhoa (
    MaCK CHAR(5) PRIMARY KEY,
    TenCK NVARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE PhongKham (
    MaPhong CHAR(5) PRIMARY KEY,
    TenPhong NVARCHAR(100) NOT NULL,
    ViTri NVARCHAR(100)
);
GO

CREATE TABLE DichVuKyThuat (
    MaDV CHAR(5) PRIMARY KEY,
    TenDV NVARCHAR(100) NOT NULL,
    DonGia DECIMAL(18,2) CHECK (DonGia >= 0)
);
GO

CREATE TABLE DanhMucThuoc (
    MaThuoc CHAR(5) PRIMARY KEY,
    TenThuoc NVARCHAR(100) NOT NULL,
    DonViTinh NVARCHAR(50) NOT NULL,
    DonGia DECIMAL(18,2) CHECK (DonGia >= 0)
);
GO

CREATE TABLE BacSi (
    MaBS CHAR(5) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    GioiTinh NVARCHAR(10) CHECK (GioiTinh IN (N'Nam', N'Nữ', N'Khác')),
    SoDienThoai VARCHAR(15) UNIQUE,
    MaCK CHAR(5) NOT NULL,
    MaPhong CHAR(5) NOT NULL,

    CONSTRAINT FK_BacSi_ChuyenKhoa
        FOREIGN KEY (MaCK) REFERENCES ChuyenKhoa(MaCK),

    CONSTRAINT FK_BacSi_PhongKham
        FOREIGN KEY (MaPhong) REFERENCES PhongKham(MaPhong)
);
GO

CREATE TABLE LichHen (
    MaLH CHAR(5) PRIMARY KEY,
    MaBN CHAR(5) NOT NULL,
    MaBS CHAR(5) NOT NULL,
    NgayHen DATE NOT NULL,
    GioHen TIME NOT NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Đã đặt'
        CHECK (TrangThai IN (N'Đã đặt', N'Đã khám', N'Đã hủy')),

    CONSTRAINT FK_LichHen_BenhNhan
        FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN),

    CONSTRAINT FK_LichHen_BacSi
        FOREIGN KEY (MaBS) REFERENCES BacSi(MaBS)
);
GO

CREATE TABLE HoSoBenhAn (
    MaHS CHAR(5) PRIMARY KEY,
    MaBN CHAR(5) NOT NULL,
    NgayLap DATE NOT NULL,
    ChanDoan NVARCHAR(500),
    KetQua NVARCHAR(500),

    CONSTRAINT FK_HoSoBenhAn_BenhNhan
        FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN)
);
GO

CREATE TABLE PhieuKham (
    MaPK CHAR(5) PRIMARY KEY,
    MaBN CHAR(5) NOT NULL,
    MaBS CHAR(5) NOT NULL,
    MaDV CHAR(5) NOT NULL,
    NgayKham DATE NOT NULL,
    TrieuChung NVARCHAR(500),
    ChanDoan NVARCHAR(500),
    TongTien DECIMAL(18,2) CHECK (TongTien >= 0),

    CONSTRAINT FK_PhieuKham_BenhNhan
        FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN),

    CONSTRAINT FK_PhieuKham_BacSi
        FOREIGN KEY (MaBS) REFERENCES BacSi(MaBS),

    CONSTRAINT FK_PhieuKham_DichVuKyThuat
        FOREIGN KEY (MaDV) REFERENCES DichVuKyThuat(MaDV)
);
GO

CREATE TABLE ChiTietDonThuoc (
    MaPK CHAR(5) NOT NULL,
    MaThuoc CHAR(5) NOT NULL,
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    LieuDung NVARCHAR(200),

    CONSTRAINT PK_ChiTietDonThuoc
        PRIMARY KEY (MaPK, MaThuoc),

    CONSTRAINT FK_ChiTietDonThuoc_PhieuKham
        FOREIGN KEY (MaPK) REFERENCES PhieuKham(MaPK),

    CONSTRAINT FK_ChiTietDonThuoc_DanhMucThuoc
        FOREIGN KEY (MaThuoc) REFERENCES DanhMucThuoc(MaThuoc)
);
GO