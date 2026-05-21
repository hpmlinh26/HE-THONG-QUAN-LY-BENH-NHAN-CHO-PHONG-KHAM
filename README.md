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
