<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="dao.AddressDAO"%>
<%@page import="model.Address"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách hộ khẩu - PDK</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/official.css">
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
                        <h4>DANH SÁCH HỘ KHẨU</h4>
                        <p>Quản lý thông tin các hộ khẩu hiện có</p>
                    </div>

                    <!-- Button Section -->
                    <div class="mb-3">
                        <button onclick="showForm()" class="btn btn-primary">Thêm hộ khẩu</button>
                    </div>


                    <div class="mb-3">
                        <form action="official?action=insertHousehold" method="POST" id="form" style="display: none">
                            <div class="col-md-12">
                                <label>CCCD chủ hộ:</label>
                                <input type="text" name="cccd" class="form-control" required>
                            </div>

                            <div class="col-md-12">
                                <label for="startDate" class="form-label">Ngày tạo</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required>

                            </div>

                            <div class="col-md-12">
                                <label>Địa chỉ:</label>
                                <select name="addressId" class="form-select" required>


                                    <option value="<%=user.getAddressId()%>"><%= user.getAddress()%></option>

                                </select>

                            </div>
                            <br>
                            <div class="col-md-12 text-center">
                                <input type="submit" value="SUBMIT" class="btn btn-success">
                            </div>

                        </form>
                    </div>


                    <!-- Table Section -->
                    <div class="card-custom table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>CCCD của chủ hộ</th>
                                    <th>Ngày tạo</th>
                                    <th>ID địa chỉ</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="h" items="${listHouseHold}">
                                    <tr>
                                        <td>${h.headOfHouseHold}</td>
                                        <td>${h.createDate}</td>
                                        <td>${h.addressId}</td>
                                        <td>
                                            <form action="official?action=showHouseholdMember" method="POST" style="display:inline">
                                                <input type="hidden" name="householdId" value="${h.houseHoldId}">
                                                <button type="submit" class="btn btn-info btn-sm">Xem hộ khẩu</button>
                                            </form>

                                            <form action="official?action=deleteHousehold" method="POST" style="display:inline">
                                                <input type="hidden" name="householdId" value="${h.houseHoldId}">
                                                <input type="hidden" name="addressId" value="<%= user.getAddressId()%>">
                                                <button type="submit" class="btn btn-info btn-sm"   style="background-color: red">Xóa hộ khẩu</button>
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

                            // Hàm showForm() - cần được định nghĩa nếu có form thêm hộ khẩu
                            function showForm() {
                                let form = document.querySelector("#form");



                                if (form.style.display === 'none' || form.style.display === '') {
                                    form.style.display = 'block';
                                    form.querySelector('form').reset();
                                } else {
                                    form.style.display = 'none';
                                }
                            }

                            document.addEventListener("DOMContentLoaded", function () {
                                let today = new Date().toISOString().split("T")[0];
                                document.getElementById("startDate").value = today;
                            });
        </script>
    </body>
</html>