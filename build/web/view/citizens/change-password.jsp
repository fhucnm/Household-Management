<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu - PDK</title>
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
                <% if (user.getRoleId() == 1) { %>
                    <a href="admin">⌨ Chuyển sang trang công việc</a>    
                <% } %>
                <% if (user.getRoleId() == 3 || user.getRoleId() == 4) { %>
                    <a href="official">⌨ Chuyển sang trang công việc</a>    
                <% } %>
                <a href="citizen?action=changePassword" class="active">⚙️ Đổi mật khẩu</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <div class="profile-container">
                    <h2 class="text-center">Đổi Mật Khẩu</h2>
                    <form action="citizen?action=changePassword" method="POST">
                        <div class="mb-3">
                            <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
                            <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                        </div>

                        <div class="mb-3">
                            <label for="newPassword" class="form-label">Mật khẩu mới</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>

                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        <input type="hidden" name="cccd" value="<%= user.getCccd()%>">

                        <% String message = (String) request.getAttribute("message"); %>
                        <% String error = (String) request.getAttribute("error"); %>

                        <% if (message != null) { %>
                            <div class="alert alert-success"><%= message %></div>
                        <% } %>
                        <% if (error != null) { %>
                            <div class="alert alert-danger"><%= error %></div>
                        <% } %>

                        <button type="submit" class="btn-custom">Đổi mật khẩu</button>
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
        menuToggle.addEventListener('click', function () {
            sidebar.classList.toggle('active');
        });

        // Đóng sidebar khi nhấp ra ngoài trên mobile
        document.addEventListener('click', function (event) {
            if (!sidebar.contains(event.target) && !menuToggle.contains(event.target) && sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        });
    </script>
</body>
</html>
