# Hệ thống quản lý bệnh nhân cho phòng khám

Đây là bài tập lớn môn **Cơ sở dữ liệu**, đề tài **“Hệ thống quản lý bệnh nhân cho phòng khám”**.  
Project tập trung vào việc phân tích nghiệp vụ, thiết kế cơ sở dữ liệu quan hệ, chuẩn hóa dữ liệu đến chuẩn 3NF, cài đặt trên SQL Server và xây dựng một website demo hỗ trợ nhập liệu, tra cứu dữ liệu.

## Mục tiêu đề tài  

Đề tài được xây dựng nhằm hỗ trợ quản lý thông tin trong phòng khám, bao gồm:

- Quản lý bệnh nhân
- Quản lý bác sĩ
- Quản lý chuyên khoa và phòng khám
- Quản lý lịch hẹn
- Quản lý phiếu khám
- Quản lý hồ sơ bệnh án
- Quản lý dịch vụ kỹ thuật
- Quản lý danh mục thuốc và chi tiết đơn thuốc
- Thực hiện truy vấn báo cáo, thống kê dữ liệu

## Công nghệ sử dụng

- SQL Server
- SQL Server Management Studio
- HTML
- CSS
- JavaScript
- Node.js

## Cấu trúc thư mục

```text
HE-THONG-QUAN-LY-BENH-NHAN-CHO-PHONG-KHAM
│
├── SQL
│   ├── 01_Tao_Database.sql
│   ├── 02_Tao_Bang.sql
│   ├── 03A_Insert_DanhMuc.sql
│   ├── 03B_Insert_BenhNhan_BacSi.sql
│   ├── 03C_Insert_NghiepVu.sql
│   ├── 03D_Kiem_Tra_Du_Lieu.sql
│   └── 04_Truy_Van_Bao_Cao.sql
│
├── Web_QuanLyBenhNhan
│   ├── public
│   │   ├── index.html
│   │   ├── benhnhan.html
│   │   ├── bacsi.html
│   │   ├── lichhen.html
│   │   ├── phieukham.html
│   │   ├── hosobenhan
│   │   ├── baocao.html
│   │   ├── style.css
│   │   └── common.js
│   │
│   ├── db.js
│   ├── server.js
│   ├── package.json
│   └── README.md
│
├── BaoCao
│   └── SQL.docx
│
└── README.md
```

## Thiết kế cơ sở dữ liệu

Cơ sở dữ liệu được thiết kế theo mô hình quan hệ, gồm các bảng chính:

- `BenhNhan`
- `BacSi`
- `ChuyenKhoa`
- `PhongKham`
- `LichHen`
- `HoSoBenhAn`
- `PhieuKham`
- `DichVuKyThuat`
- `DanhMucThuoc`
- `ChiTietDonThuoc`

Trong đó, bảng `ChiTietDonThuoc` là bảng trung gian dùng để xử lý quan hệ nhiều - nhiều giữa `PhieuKham` và `DanhMucThuoc`.

## Các bước chạy file SQL

Mở SQL Server Management Studio và chạy lần lượt các file trong thư mục `SQL` theo đúng thứ tự:

1. `01_Tao_Database.sql`  
   Tạo cơ sở dữ liệu `QL_BenhNhan_PhongKham`.

2. `02_Tao_Bang.sql`  
   Tạo các bảng, khóa chính, khóa ngoại và các ràng buộc dữ liệu.

3. `03A_Insert_DanhMuc.sql`  
   Thêm dữ liệu danh mục như chuyên khoa, phòng khám, dịch vụ kỹ thuật và thuốc.

4. `03B_Insert_BenhNhan_BacSi.sql`  
   Thêm dữ liệu bệnh nhân và bác sĩ.

5. `03C_Insert_NghiepVu.sql`  
   Thêm dữ liệu nghiệp vụ như lịch hẹn, phiếu khám, chi tiết đơn thuốc và hồ sơ bệnh án.

6. `03D_Kiem_Tra_Du_Lieu.sql`  
   Kiểm tra số lượng dữ liệu trong các bảng.

7. `04_Truy_Van_Bao_Cao.sql`  
   Thực hiện các truy vấn báo cáo và thống kê.

## Một số truy vấn báo cáo

Project có xây dựng một số truy vấn phục vụ nghiệp vụ phòng khám, bao gồm:

- Tra cứu sổ khám bệnh điện tử của bệnh nhân
- Thống kê doanh thu theo dịch vụ kỹ thuật
- Tìm top bác sĩ có nhiều lịch hẹn nhất

Các truy vấn này giúp kiểm tra khả năng liên kết dữ liệu giữa các bảng và minh họa việc khai thác cơ sở dữ liệu sau khi cài đặt.

## Website demo

Ngoài phần cơ sở dữ liệu SQL Server, project có thêm website demo nhằm hỗ trợ người dùng thao tác với dữ liệu trực quan hơn.

Website demo cho phép:

- Xem danh sách bệnh nhân
- Xem danh sách bác sĩ
- Quản lý lịch hẹn
- Quản lý phiếu khám
- Xem một số báo cáo thống kê cơ bản

## Cách chạy website demo

Trước tiên, cần cài đặt Node.js trên máy.

Sau đó mở thư mục `Web_QuanLyBenhNhan` trong terminal và chạy:

```bash
npm install
npm start
```

Sau khi server chạy thành công, mở trình duyệt và truy cập:

```text
http://localhost:3000
```

## Cấu hình kết nối SQL Server

Trong file `db.js`, cần kiểm tra lại tên server SQL Server đang sử dụng.

Ví dụ:

```javascript
server: "localhost\\MSSQLSERVER01",
database: "QL_BenhNhan_PhongKham",
```

Nếu máy sử dụng instance khác, cần sửa lại `server` cho đúng với tên server trong SQL Server Management Studio.

## Ghi chú

- Không upload thư mục `node_modules` lên GitHub.
- Nếu cần chạy lại website, chỉ cần chạy `npm install` để cài lại thư viện.
- Database cần được tạo và insert dữ liệu trước khi chạy website demo.

## Thành viên thực hiện

- Hà Phạm Mai Linh
- Phạm Thùy Dương
- Trần Thúy Quỳnh
- Nguyễn Xuân Sáng

