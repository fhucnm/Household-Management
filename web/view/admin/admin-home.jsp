<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Trị Viên - PDK</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/admin-home.css"> <!-- Liên kết đến tệp CSS -->
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
                <a href="admin">🏠 Trang chủ</a>
                <a  href="citizen">👨‍ Quay lại trang công dân</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <!-- Welcome Text -->
                <div class="welcome-text">
                    <h4>WELCOME, Quản trị viên <%= user.getFullName() %>!</h4>
                    <p>Chào mừng bạn đến với Trang Quản Trị Viên - Trung tâm Dữ liệu Quốc gia về Dân cư</p>
                </div>

                <!-- Card Section -->
                <div class="row row-cols-1 row-cols-md-4 g-4">
                    <div class="col">
                        <div class="card-custom">
                            <div>
                                <h5>Quản lý công dân</h5>
                                <p>✔️ Xem và quản lý thông tin công dân.</p>
                            </div>
                            <a href="admin?action=listUsers">Xem ngay</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-custom">
                            <div>
                                <h5>Danh sách đơn cần duyệt</h5>
                                <p>✔️ Xem danh sách các đơn đăng ký nhập hộ khẩu.</p>
                            </div>
                            <a href="admin?action=listRegistrations">Xem ngay</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-custom">
                            <div>
                                <h5>Danh sách đơn đã duyệt</h5>
                                <p>✔️ Xem các đơn đã được phê duyệt.</p>
                            </div>
                            <a href="admin?action=listApproved">Xem ngay</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-custom">
                            <div>
                                <h5>Danh sách đơn bị từ chối</h5>
                                <p>✔️ Xem các đơn bị từ chối và lý do.</p>
                            </div>
                            <a href="admin?action=listRejected">Xem ngay</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-custom">
                            <div>
                                <h5>Danh sách hộ khẩu</h5>
                                <p>✔️ Xem và quản lý thông tin các hộ khẩu.</p>
                            </div>
                            <a href="admin?action=listHouseHold">Xem ngay</a>
                        </div>
                    </div>
                    
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