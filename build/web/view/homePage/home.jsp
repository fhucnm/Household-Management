<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ - PDK</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/home.css"> <!-- Link to the new CSS file -->

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let errorMessage = "<%= request.getAttribute("error") %>";
                if (errorMessage && errorMessage !== "null") {
                    document.getElementById("errorMessage").innerText = errorMessage;
                    let errorModal = new bootstrap.Modal(document.getElementById("errorModal"));
                    errorModal.show();
                }
            });
        </script>
    </head>
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="errorModalLabel">Lỗi</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="errorMessage"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
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
                    <!-- Banner -->
                    <div class="banner">
                        <img src="./images/chucmungnammoi.png" alt="Chúc mừng năm mới 2025"/>
                    </div>

                    <!-- Welcome Text -->
                    <div class="welcome-text">
                        <h4>WELCOME, <%= user.getFullName()%>!</h4>
                        <p>Chào mừng bạn đến với Trang thông tin Quản lý Đăng ký Hộ khẩu Thường trú, Tạm trú và Lưu trú</p>
                    </div>

                    <!-- Card Section -->
                    <div class="row row-cols-1 row-cols-md-4 g-4">
                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Đăng ký hộ khẩu thường trú</h5>
                                    <p>✔️ Dành cho người muốn nhập hộ khẩu vào gia đình có sẵn.</p>
                                </div>
                                <a href="registration?action=permanent">Xem ngay</a>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Đăng ký tạm trú</h5>
                                    <p>✔️ Khai báo tạm trú nhanh chóng, đảm bảo quyền lợi và quản lý dân cư hiệu quả.</p>
                                </div>
                                <a href="registration?action=temporary">Xem ngay</a>
                            </div>
                        </div>

                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Khai báo lưu trú</h5>
                                    <p>✔️ Hỗ trợ khai báo lưu trú tạm thời cho khách du lịch, người đi công tác, sinh viên,...</p>
                                </div>
                                <a href="registration?action=temporaryStay">Xem ngay</a>
                            </div>
                        </div>

                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Đăng ký hộ khẩu mới</h5>
                                    <p>✔️ Dành cho những người chưa có hộ khẩu hoặc muốn lập hộ khẩu mới.</p>
                                </div>
                                <a href="registration?action=createHousehold">Xem ngay</a>
                            </div>
                        </div>

                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Tách hộ khẩu</h5>
                                    <p>✔️ Dành cho những người tách hộ khẩu ra hộ khẩu mới</p>
                                </div>
                                <a href="registration?action=splitHousehold">Xem ngay</a>
                            </div>
                        </div>

                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Chuyển hộ khẩu</h5>
                                    <p>✔️ Chỉ chủ hộ mới có thể chuyển hộ khẩu sang địa điểm khác</p>
                                </div>
                                <a href="registration?action=transferHousehold">Xem ngay</a>
                            </div>
                        </div>

                        <div class="col">
                            <div class="card-custom">
                                <div>
                                    <h5>Xem đơn của bạn</h5>
                                    <p>✔️ Theo dõi trạng thái đơn đăng ký, kiểm tra tiến độ xử lý dễ dàng.</p>
                                </div>
                                <a href="citizen?action=viewSubmitcation">Xem ngay</a>
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