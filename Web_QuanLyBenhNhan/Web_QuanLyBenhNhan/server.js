const express = require("express");
const cors = require("cors");
const { sql, config } = require("./db");

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static("public"));

async function getPool() {
  return await sql.connect(config);
}

function sendError(res, err) {
  console.error(err);
  res.status(500).json({
    success: false,
    message: "Có lỗi xảy ra khi xử lý dữ liệu.",
    error: err.message
  });
}

// API danh mục
app.get("/api/chuyenkhoa", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query("SELECT * FROM ChuyenKhoa ORDER BY MaCK");
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.get("/api/phongkham", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query("SELECT * FROM PhongKham ORDER BY MaPhong");
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.get("/api/dichvu", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query("SELECT * FROM DichVuKyThuat ORDER BY MaDV");
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.get("/api/thuoc", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query("SELECT * FROM DanhMucThuoc ORDER BY MaThuoc");
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

// API bệnh nhân
app.get("/api/benhnhan", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT MaBN, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, NhomMau, TienSuBenh
      FROM BenhNhan
      ORDER BY MaBN
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.post("/api/benhnhan", async (req, res) => {
  try {
    const { MaBN, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, NhomMau, TienSuBenh } = req.body;

    if (!MaBN || !HoTen) {
      return res.status(400).json({ success: false, message: "Mã bệnh nhân và họ tên không được để trống." });
    }

    const pool = await getPool();
    await pool.request()
      .input("MaBN", sql.Char(5), MaBN)
      .input("HoTen", sql.NVarChar(100), HoTen)
      .input("NgaySinh", sql.Date, NgaySinh || null)
      .input("GioiTinh", sql.NVarChar(10), GioiTinh || null)
      .input("DiaChi", sql.NVarChar(200), DiaChi || null)
      .input("SoDienThoai", sql.VarChar(15), SoDienThoai || null)
      .input("NhomMau", sql.VarChar(5), NhomMau || null)
      .input("TienSuBenh", sql.NVarChar(500), TienSuBenh || null)
      .query(`
        INSERT INTO BenhNhan
        (MaBN, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, NhomMau, TienSuBenh)
        VALUES
        (@MaBN, @HoTen, @NgaySinh, @GioiTinh, @DiaChi, @SoDienThoai, @NhomMau, @TienSuBenh)
      `);

    res.json({ success: true, message: "Thêm bệnh nhân thành công." });
  } catch (err) { sendError(res, err); }
});

// API bác sĩ
app.get("/api/bacsi", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT BS.MaBS, BS.HoTen, BS.GioiTinh, BS.SoDienThoai,
             BS.MaCK, CK.TenCK, BS.MaPhong, PH.TenPhong
      FROM BacSi BS
      INNER JOIN ChuyenKhoa CK ON BS.MaCK = CK.MaCK
      INNER JOIN PhongKham PH ON BS.MaPhong = PH.MaPhong
      ORDER BY BS.MaBS
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

// API lịch hẹn
app.get("/api/lichhen", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT LH.MaLH, LH.MaBN, BN.HoTen AS HoTenBenhNhan,
             LH.MaBS, BS.HoTen AS HoTenBacSi,
             LH.NgayHen, LH.GioHen, LH.TrangThai
      FROM LichHen LH
      INNER JOIN BenhNhan BN ON LH.MaBN = BN.MaBN
      INNER JOIN BacSi BS ON LH.MaBS = BS.MaBS
      ORDER BY LH.NgayHen, LH.GioHen
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.post("/api/lichhen", async (req, res) => {
  try {
    const { MaLH, MaBN, MaBS, NgayHen, GioHen, TrangThai } = req.body;

    if (!MaLH || !MaBN || !MaBS || !NgayHen || !GioHen) {
      return res.status(400).json({ success: false, message: "Vui lòng nhập đủ thông tin lịch hẹn." });
    }

    const pool = await getPool();
    await pool.request()
      .input("MaLH", sql.Char(5), MaLH)
      .input("MaBN", sql.Char(5), MaBN)
      .input("MaBS", sql.Char(5), MaBS)
      .input("NgayHen", sql.Date, NgayHen)
      .input("GioHen", sql.VarChar(8), GioHen)
      .input("TrangThai", sql.NVarChar(50), TrangThai || "Đã đặt")
      .query(`
        INSERT INTO LichHen (MaLH, MaBN, MaBS, NgayHen, GioHen, TrangThai)
        VALUES (@MaLH, @MaBN, @MaBS, @NgayHen, CAST(@GioHen AS TIME), @TrangThai)
      `);

    res.json({ success: true, message: "Thêm lịch hẹn thành công." });
  } catch (err) { sendError(res, err); }
});

// API phiếu khám
app.get("/api/phieukham", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT PK.MaPK, PK.MaBN, BN.HoTen AS HoTenBenhNhan,
             PK.MaBS, BS.HoTen AS HoTenBacSi,
             PK.MaDV, DV.TenDV,
             PK.NgayKham, PK.TrieuChung, PK.ChanDoan, PK.TongTien
      FROM PhieuKham PK
      INNER JOIN BenhNhan BN ON PK.MaBN = BN.MaBN
      INNER JOIN BacSi BS ON PK.MaBS = BS.MaBS
      INNER JOIN DichVuKyThuat DV ON PK.MaDV = DV.MaDV
      ORDER BY PK.NgayKham DESC, PK.MaPK
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.post("/api/phieukham", async (req, res) => {
  try {
    const { MaPK, MaBN, MaBS, MaDV, NgayKham, TrieuChung, ChanDoan, TongTien } = req.body;

    if (!MaPK || !MaBN || !MaBS || !MaDV || !NgayKham) {
      return res.status(400).json({ success: false, message: "Vui lòng nhập đủ thông tin phiếu khám." });
    }

    const pool = await getPool();
    await pool.request()
      .input("MaPK", sql.Char(5), MaPK)
      .input("MaBN", sql.Char(5), MaBN)
      .input("MaBS", sql.Char(5), MaBS)
      .input("MaDV", sql.Char(5), MaDV)
      .input("NgayKham", sql.Date, NgayKham)
      .input("TrieuChung", sql.NVarChar(500), TrieuChung || null)
      .input("ChanDoan", sql.NVarChar(500), ChanDoan || null)
      .input("TongTien", sql.Decimal(18, 2), Number(TongTien || 0))
      .query(`
        INSERT INTO PhieuKham
        (MaPK, MaBN, MaBS, MaDV, NgayKham, TrieuChung, ChanDoan, TongTien)
        VALUES
        (@MaPK, @MaBN, @MaBS, @MaDV, @NgayKham, @TrieuChung, @ChanDoan, @TongTien)
      `);

    res.json({ success: true, message: "Thêm phiếu khám thành công." });
  } catch (err) { sendError(res, err); }
});

// API chi tiết đơn thuốc
app.get("/api/chitietdonthuoc", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT CT.MaPK, CT.MaThuoc, T.TenThuoc, CT.SoLuong, CT.LieuDung
      FROM ChiTietDonThuoc CT
      INNER JOIN DanhMucThuoc T ON CT.MaThuoc = T.MaThuoc
      ORDER BY CT.MaPK, CT.MaThuoc
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.post("/api/chitietdonthuoc", async (req, res) => {
  try {
    const { MaPK, MaThuoc, SoLuong, LieuDung } = req.body;

    if (!MaPK || !MaThuoc || !SoLuong) {
      return res.status(400).json({ success: false, message: "Vui lòng nhập mã phiếu khám, mã thuốc và số lượng." });
    }

    const pool = await getPool();
    await pool.request()
      .input("MaPK", sql.Char(5), MaPK)
      .input("MaThuoc", sql.Char(5), MaThuoc)
      .input("SoLuong", sql.Int, Number(SoLuong))
      .input("LieuDung", sql.NVarChar(200), LieuDung || null)
      .query(`
        INSERT INTO ChiTietDonThuoc (MaPK, MaThuoc, SoLuong, LieuDung)
        VALUES (@MaPK, @MaThuoc, @SoLuong, @LieuDung)
      `);

    res.json({ success: true, message: "Thêm thuốc vào đơn thành công." });
  } catch (err) { sendError(res, err); }
});

// API báo cáo
app.get("/api/baocao/doanhthu", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT DV.MaDV, DV.TenDV,
             COUNT(PK.MaPK) AS SoLuotSuDung,
             SUM(PK.TongTien) AS TongDoanhThu
      FROM DichVuKyThuat DV
      INNER JOIN PhieuKham PK ON DV.MaDV = PK.MaDV
      GROUP BY DV.MaDV, DV.TenDV
      ORDER BY TongDoanhThu DESC
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.get("/api/baocao/topbacsi", async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT TOP 3
        BS.MaBS,
        BS.HoTen AS HoTenBacSi,
        CK.TenCK AS ChuyenKhoa,
        COUNT(LH.MaLH) AS SoLuotDatLich,
        COUNT(DISTINCT LH.MaBN) AS SoBenhNhanKhacNhau
      FROM BacSi BS
      INNER JOIN ChuyenKhoa CK ON BS.MaCK = CK.MaCK
      INNER JOIN LichHen LH ON BS.MaBS = LH.MaBS
      GROUP BY BS.MaBS, BS.HoTen, CK.TenCK
      ORDER BY SoLuotDatLich DESC, SoBenhNhanKhacNhau DESC
    `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.get("/api/baocao/sokham/:maBN", async (req, res) => {
  try {
    const { maBN } = req.params;
    const pool = await getPool();
    const result = await pool.request()
      .input("MaBN", sql.Char(5), maBN)
      .query(`
        SELECT BN.MaBN, BN.HoTen AS HoTenBenhNhan,
               PK.MaPK, PK.NgayKham,
               BS.HoTen AS BacSiPhuTrach,
               CK.TenCK AS ChuyenKhoa,
               DV.TenDV AS DichVuKham,
               PK.ChanDoan,
               STUFF((
                 SELECT N', ' + T.TenThuoc
                        + N' - SL: ' + CAST(CT.SoLuong AS NVARCHAR(10))
                        + N' - Liều: ' + CT.LieuDung
                 FROM ChiTietDonThuoc CT
                 INNER JOIN DanhMucThuoc T ON CT.MaThuoc = T.MaThuoc
                 WHERE CT.MaPK = PK.MaPK
                 FOR XML PATH(''), TYPE
               ).value('.', 'NVARCHAR(MAX)'), 1, 2, N'') AS DanhSachThuoc,
               PK.TongTien AS TongTienCanThanhToan
        FROM BenhNhan BN
        INNER JOIN PhieuKham PK ON BN.MaBN = PK.MaBN
        INNER JOIN BacSi BS ON PK.MaBS = BS.MaBS
        INNER JOIN ChuyenKhoa CK ON BS.MaCK = CK.MaCK
        INNER JOIN DichVuKyThuat DV ON PK.MaDV = DV.MaDV
        WHERE BN.MaBN = @MaBN
        ORDER BY PK.NgayKham
      `);
    res.json(result.recordset);
  } catch (err) { sendError(res, err); }
});

app.listen(PORT, () => {
  console.log(`Server đang chạy tại http://localhost:${PORT}`);
});
