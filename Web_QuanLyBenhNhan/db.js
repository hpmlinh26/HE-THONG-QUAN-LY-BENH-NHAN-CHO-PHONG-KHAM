const sql = require("mssql/msnodesqlv8");

/*
  Sửa server nếu Server name trong SSMS của bạn khác.
  Ví dụ: ".\\SQLEXPRESS" hoặc "localhost\\SQLEXPRESS"
*/
const config = {
  server: "localhost\MSSQLSERVER01",
  database: "QL_BenhNhan_PhongKham",
  driver: "msnodesqlv8",
  options: {
    trustedConnection: true,
    trustServerCertificate: true
  }
};

module.exports = { sql, config };
