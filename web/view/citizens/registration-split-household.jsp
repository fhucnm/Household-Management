<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.User" %>
<%@page import="dao.AddressDAO" %>
<%@page import="model.Address" %>
<%@page import="java.util.*" %>



<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tạo mới hộ khẩu</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/profile.css">
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="ms-3 d-flex align-items-center">
                <span class="menu-toggle">☰</span>
                <h5 class="ms-2">PDK - TRUNG TÂM DỮ LIỆU QUỐC GIA VỀ DÂN CƯ</h5>
            </div>
            <div class="me-3 dropdown">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <% User user = (User) session.getAttribute("user");%>
                    <span><%= user.getFullName()%></span>
                    <img src="./images/logo.png" alt="Avatar" width="40" height="40" class="rounded-circle ms-2">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="citizen?action=profile">Thông tin cá nhân</a></li>
                    <form action="auth?action=logout" method="POST">
                        <button type="submit" class="dropdown-item">Đăng xuất</button>
                    </form>
                </ul>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="sidebar">
                    <a href="citizen">🏠 Trang chủ</a>
                    <a href="citizen?action=notification">📬 Thông báo</a>
                    <a href="citizen?action=showHousehold&cccd=<%= user.getCccd()%>">📕 Xem hộ khẩu</a>
                    <a href="citizen?action=viewSubmitcation">✉ Xem đơn của bạn</a>
                    <%if (user.getRoleId() == 1){%>
                    <a href="admin">⌨ Chuyển sang trang công việc</a>    
                    <%}%>

                    <%if (user.getRoleId() == 3 || user.getRoleId() == 4){%>
                    <a href="official">⌨ Chuyển sang trang công việc</a>    
                    <%}%>
                    <a href="citizen?action=changePassword">⚙️ Đổi mật khẩu</a>
                </div>

                <!-- Main Content -->
                <div class="col-md-10 main-content">
                    <div class="profile-container">
                        <h2 class="text-center">Tạo mới hộ khẩu</h2>

                        <form action="household?action=split" method="POST">

                            <div class="mb-3">
                                <label for="cccd" class="form-label">Số CCCD</label>
                                <input type="text" class="form-control" id="cccd" name="cccd" value="<%= user.getCccd()%>"required readonly>
                            </div>
                            <div class="mb-3">
                                <label for="registrationType" class="form-label">Loại đăng ký</label>
                                <%String registrationType = (String) request.getAttribute("registrationType");%>
                                <input type="text" class="form-control" id="registrationType" name="registrationType" required readonly value="<%= registrationType%>">
                            </div>

                            <!-- Ngày tạo -->
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Ngày tạo</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                            </div>
                            <!-- loại hộ khẩu muốn tách khỏi -->
                            <div class="mb-3">
                                <label for="householdType" class="form-label">Loại hộ khẩu muốn tách:</label>
                                <select class="form-control" name="householdType">
                                    <option value="Dài hạn">Dài hạn</option>
                                    <option value="Tạm trú">Tạm thời</option>
                                    <option value="Lưu trú tạm thời">Lưu trú tạm thời</option>
                                </select>

                            </div>


                            <button type="submit" class="btn-custom">Gửi đơn</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap Script -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Script để toggle sidebar trên mobile
            const menuToggle = document.querySelector('.menu-toggle');
            const sidebar = document.querySelector('.sidebar');

            // Thêm event listener để toggle sidebar
            menuToggle.addEventListener('click', function () {
                sidebar.classList.toggle('active');
            });

            // Đóng sidebar khi click bên ngoài (tùy chọn)
            document.addEventListener('click', function (event) {
                if (!sidebar.contains(event.target) && !menuToggle.contains(event.target)) {
                    sidebar.classList.remove('active');
                }
            });
            // Set ngày mặc định là hôm nay
            document.addEventListener("DOMContentLoaded", function () {
                let today = new Date().toISOString().split("T")[0];
                document.getElementById("startDate").value = today;
            });
        </script>
    </body>
</html>
