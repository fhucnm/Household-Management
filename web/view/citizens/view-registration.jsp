<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Registration" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết đơn đăng ký - PDK</title>
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
                    <% User user = (User) session.getAttribute("user"); %>
                    <span><%= user.getFullName() %></span>
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
                    <br>
                    <h2 class="text-center">Chi tiết đơn đăng ký</h2>
                    <% 
                        Registration reg = (Registration) request.getAttribute("registration");
                        if (reg != null) { 
                    %>
                    <div class="card p-3 shadow-sm">
                        <h4>🆔 Mã đơn: <%= reg.getRegistrationId() %></h4>
                        <p><strong>🔢 CCCD:</strong> <%= reg.getCccd() %></p>
                        <p><strong>📄 Loại đăng ký:</strong> <%= reg.getRegistrationType() %></p>
                        <p><strong>📅 Ngày bắt đầu:</strong> <%= reg.getStartDate() %></p>
                        <p><strong>📌 Trạng thái:</strong> <%= reg.getStatus() %></p>
                        <p><strong>👨‍⚖️ Người duyệt:</strong> <%= reg.getApprovedBy() != null ? reg.getApprovedBy() : "Chưa duyệt" %></p>
                        <p><strong>📝 Ghi chú:</strong> <%= reg.getComments() != null ? reg.getComments() : "Không có" %></p>

                        <% if (reg.getHeadOfHouseholdCccd() != null) { %>
                        <p><strong>🏠 Chủ hộ:</strong> <%= reg.getHeadOfHouseholdCccd() %></p>
                        <p><strong>🏡 Hộ khẩu:</strong> Mã hộ khẩu <%= reg.getHouseholdId() %>, Địa chỉ <%= reg.getAddressId() %></p>
                        <p><strong>👥 Quan hệ với chủ hộ:</strong> <%= reg.getRelationship() %></p>
                        <% } else { %>
                        <p class="text-danger">⚠️ Người này chưa thuộc hộ khẩu nào.</p>
                        <% } %>

                        <a href="citizen?action=viewSubmitcation" class="btn btn-secondary mt-3">🔙 Quay lại</a>
                    </div>
                    <% } else { %>
                    <div class="alert alert-danger text-center">
                        ❌ Không tìm thấy thông tin đơn đăng ký!
                    </div>
                    <% } %>
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