<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.User" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký hộ khẩu - PDK</title>
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
                        <h2 class="text-center">Đăng ký hộ khẩu</h2>


                        <form action="household?action=insert" method="POST">
                            <div class="mb-3">
                                <label for="cccd" class="form-label">Số CCCD</label>
                                <input type="text" class="form-control" id="cccd" name="cccd" value="<%= user.getCccd()%>" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="registrationType" class="form-label">Loại đăng ký</label>
                                <%String registrationType = (String) request.getAttribute("registrationType");%>
                                <input type="text" class="form-control" id="registrationType" name="registrationType" required readonly value="<%= registrationType%>">
                            </div>

                            <div class="mb-3">
                                <label for="headOfHouseHoldCccd" class="form-label">Số CCCD Chủ hộ</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="headOfHouseHoldCccd" name="headOfHouseHoldCccd" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="relationship" class="form-label">Quan hệ với chủ hộ</label>
                                <select class="form-control" id="relationship" name="relationship" required>
                                    <option value="">-- Chọn quan hệ --</option>

                                    <option value="Vợ/Chồng">Vợ/Chồng</option>
                                    <option value="Con">Con</option>
                                    <option value="Cha/Mẹ">Cha/Mẹ</option>
                                    <option value="Anh/Chị/Em">Anh/Chị/Em</option>
                                    <option value="Ông/Bà">Ông/Bà</option>
                                    <option value="Tạm trú">Tạm trú</option>
                                    <option value="Lưu trú tạm thời">Lưu trú tạm thời</option>
                                </select>
                            </div>


                            <div class="mb-3">
                                <label for="startDate" class="form-label">Ngày tạo</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                            </div>


                            <button type="submit" class="btn-custom">Gửi đăng ký</button>
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
            document.addEventListener("DOMContentLoaded", function () {
                let today = new Date().toISOString().split("T")[0]; // Lấy ngày hiện tại (YYYY-MM-DD)
                document.getElementById("startDate").value = today; // Gán vào input
            });


        </script>

