function formatDate(value) {
  if (!value) return "";
  return String(value).substring(0, 10);
}
function formatMoney(value) {
  if (value === null || value === undefined) return "";
  return Number(value).toLocaleString("vi-VN") + " VNĐ";
}
function showMessage(elementId, text, isSuccess = true) {
  const el = document.getElementById(elementId);
  if (!el) return;
  el.textContent = text;
  el.className = "message " + (isSuccess ? "success" : "error");
}
function getFormData(form) {
  return Object.fromEntries(new FormData(form).entries());
}
async function fetchJSON(url, options = {}) {
  const res = await fetch(url, options);
  const data = await res.json();
  if (!res.ok) throw new Error(data.message || data.error || "Có lỗi xảy ra.");
  return data;
}
function fillSelect(selectId, data, valueField, textBuilder) {
  const select = document.getElementById(selectId);
  if (!select) return;
  select.innerHTML = `<option value="">-- Chọn --</option>`;
  data.forEach(item => {
    const option = document.createElement("option");
    option.value = item[valueField];
    option.textContent = textBuilder(item);
    select.appendChild(option);
  });
}
