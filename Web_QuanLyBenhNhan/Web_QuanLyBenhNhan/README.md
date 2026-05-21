# Web quản lý bệnh nhân cho phòng khám

Đây là web demo kết nối cơ sở dữ liệu `QL_BenhNhan_PhongKham` trên SQL Server.

## 1. Yêu cầu trước khi chạy

- Đã cài Node.js.
- Đã cài SQL Server và SQL Server Management Studio.
- Đã chạy các file SQL tạo database, tạo bảng và insert dữ liệu.

## 2. Sửa kết nối SQL Server

Mở file `db.js`.

Nếu Server name trong SSMS của bạn là:

```text
MSI\SQLEXPRESS
```

thì giữ nguyên:

```js
server: "MSI\\SQLEXPRESS"
```

Nếu máy bạn dùng tên khác, sửa lại đúng theo Server name trong SSMS.

## 3. Cài thư viện

Mở Terminal/CMD trong thư mục này:

```bash
npm install
```

## 4. Chạy web

```bash
npm start
```

Mở trình duyệt:

```text
http://localhost:3000
```

## 5. Các trang chính

- `/index.html`: Trang chủ
- `/benhnhan.html`: Quản lý bệnh nhân
- `/bacsi.html`: Danh sách bác sĩ
- `/lichhen.html`: Quản lý lịch hẹn
- `/phieukham.html`: Quản lý phiếu khám và đơn thuốc
- `/baocao.html`: Báo cáo


## Chức năng bổ sung

- Quản lý hồ sơ bệnh án: xem danh sách và thêm hồ sơ bệnh án cho bệnh nhân.
