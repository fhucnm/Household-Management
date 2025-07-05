<%-- 
    Document   : listRegistration
    Created on : Mar 8, 2025, 5:55:21 PM
    Author     : he181
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách đơn cần duyệt - PDK</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/official.css">
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
                <a href="official">🏠 Trang chủ</a>
                <a href="citizen">👨‍ Quay lại trang công dân</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <!-- Welcome Text -->
                <div class="welcome-text">
                    <h4>DANH SÁCH ĐƠN CẦN DUYỆT</h4>
                    <p>Quản lý các đơn đăng ký nhập hộ khẩu đang chờ xử lý</p>
                </div>

                <!-- Table Section -->
                <div class="card-custom table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Số CCCD</th>
                                <th>Loại đăng ký</th>
                                <th>Ngày đăng ký</th>
                                <th>Trạng thái</th>
                                <th>CCCD chủ hộ</th>
                                <th>Quan hệ với chủ hộ</th>
                                <th>ID địa chỉ của hộ khẩu</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listRegistrations}" var="reg">
                                <tr>
                                    <td>${reg.cccd}</td>
                                    <td>${reg.registrationType}</td>
                                    <td>${reg.startDate}</td>
                                    <td>${reg.status}</td>
                                    <td>${reg.headOfHouseholdCccd}</td>
                                    <td>${reg.relationship}</td>
                                    <td>${reg.addressId}</td>
                                    <td>
                                        <form action="official?action=approveRegistration" style="display:inline" method="POST">
                                            <input type="hidden" name="registrationId" value="${reg.registrationId}">
                                            <input type="hidden" name="registrationType" value="${reg.registrationType}">
                                            <input type="hidden" name="headOfHouseholdCccd" value="${reg.headOfHouseholdCccd}">
                                            <input type="hidden" name="cccd" value="${reg.cccd}">
                                            <input type="hidden" name="relationship" value="${reg.relationship}">
                                            <input type="hidden" name="newAddressId" value="$reg.addressId">
                                            <input type="hidden" name="approvedBy" value="<%= user.getCccd()%>">
                                            <input type="hidden" name="addressId" value="<%= user.getAddressId()%>">
                                            <button type="submit" class="btn btn-success btn-sm">Duyệt</button>
                                        </form>
                                        <form action="official?action=rejectRegistration" style="display:inline" method="POST">
                                            <input type="hidden" name="registrationId" value="${reg.registrationId}">
                                            <input type="hidden" name="cccd" value="${reg.cccd}">
                                            <input type="hidden" name="addressId" value="<%= user.getAddressId()%>">
                                            <input type="text" name="comments" placeholder="Lý do từ chối" class="form-control d-inline-block w-auto">
                                            <button type="submit" class="btn btn-danger btn-sm">Từ chối</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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