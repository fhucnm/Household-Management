<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page  import="model.User"%>
<%@page  import="java.util.*" %>
<%@page import="model.Registration" %>
<%@page import="dao.RegistrationDAO" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đơn đăng ký của bạn - PDK</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/notification.css">
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
                    <div class="registration-container">
                        <div class="text-center">
                            <h2>Đơn đăng ký của bạn</h2>
                        </div>
                        
                        <% ArrayList<Registration> list = RegistrationDAO.findByCccd(user.getCccd()); 
                           int i = 1;
                           if(list.isEmpty()){%>
                                    <h5 style="text-align: center" color="red">Chưa có đơn đăng ký nào</p>
                            <%}%>
                           <%
                           for(Registration reg: list){
                            %>

                        <div class="card-custom">
                            <div>
                                <h5>Đơn đăng ký <%= i%></h5>
                                <p>Loại đăng ký: <%= reg.getRegistrationType()%></p>
                                <p>Ngày bắt đầu: <%= reg.getStartDate()%></p>
                                <p>Trạng thái: <strong><%= reg.getStatus()%></strong></p>
                            </div>
                            <a href="citizen?action=viewRegistration&registrationId=<%= reg.getRegistrationId()%>" class="btn btn-primary">Xem chi tiết</a>
                        </div>
                        <%  i++;
                            } %>
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
