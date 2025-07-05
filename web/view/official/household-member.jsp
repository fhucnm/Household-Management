<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="dao.HouseholdMemberDAO"%>
<%@page import="model.HouseholdMember"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách thành viên trong hộ khẩu - PDK</title>
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
                        <h4>DANH SÁCH THÀNH VIÊN TRONG HỘ KHẨU</h4>
                        <p>Thông tin các thành viên thuộc hộ khẩu hiện tại</p>
                    </div>
                    <div class="mb-3">
                        <button onclick="showForm()" class="btn btn-primary">Thêm thành viên</button>
                    </div>
                    <div class="mb-3">
                        <form action="official?action=insertHouseholdMember" method="POST" id="form" style="display: none">
                            <h5 style="text-align: center" >Thêm thành viên</h5>
                            <div class="col-md-12">
                                <label>CCCD:</label>
                                <input type="text" name="cccd" class="form-control" required readonly>
                            </div>

                            <div class="col-md-12">
                                <label for="relationship" class="form-label">Quan hệ với chủ hộ</label>
                                <select class="form-control" id="relationship" name="relationship" required>

                                    <option value="">--Chọn quan hệ--</option>

                                    <option value="Chủ hộ">Chủ hộ</option>
                                    <option value="Vợ/Chồng">Vợ/Chồng</option>
                                    <option value="Con">Con</option>
                                    <option value="Cha/Mẹ">Cha/Mẹ</option>
                                    <option value="Anh/Chị/Em">Anh/Chị/Em</option>
                                    <option value="Ông/Bà">Ông/Bà</option>
                                    <option value="Tạm trú">Tạm trú</option>
                                    <option value="Lưu trú tạm thời">Lưu trú tạm thời</option>
                                </select>

                            </div>
                            <%
                                 Integer householdId = (Integer) session.getAttribute("householdId");
                            %>
                            <input type="hidden" name="householdId" value="<%= householdId %>">


                            <div class="col-md-12 text-center">
                                <input type="submit" value="SUBMIT" class="btn btn-success">
                            </div>
                        </form>
                    </div>
                    <!-- Table or Message Section -->
                    <div class="card-custom">
                        <c:choose>
                            <c:when test="${empty listHouseholdMember}">
                                <p class="text-muted">Không có thành viên nào trong hộ khẩu.</p>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>CCCD</th>
                                                <th>Mối quan hệ</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="m" items="${listHouseholdMember}">
                                                <tr>
                                                    <td name="cccd">${m.cccd}</td>
                                                    <td name="relationship">${m.relationship}</td>
                                                    <td>
                                                        <button onclick="editForm(this)" class="btn btn-warning btn-sm" style="display: inline;">Sửa</button>
                                                        <form action="official?action=deleteHouseholdMember" method="POST" style="display:inline;">
                                                            <input type="hidden" name="cccd" value="${m.cccd}"/>
                                                            <input type="hidden" name="relationship" value="${m.relationship}">
                                                            <input type="hidden" name="householdId" value="${m.householdId}">
                                                            <a href="#" onclick="return this.closest('form').submit()"><button class="btn btn-danger btn-sm">Xóa</button></a>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Back Link -->
                    <div class="mt-3">
                        <form action="official?action=changeHeadOfHouseholdCccd" method="POST">
                            <input type="hidden" name="householdId" value="<%= householdId %>">
                            <input type="hidden" name="addressId" value="<%= user.getAddressId()%>">

                            <a href="#"><button type="submit" class="btn btn-danger btn-sm">Hoàn tất đổi chủ hộ</button></a>
                        </form>
                    </div>
                    <div class="mt-3">
                        <a href="official?action=listHouseHold&addressId=<%=user.getAddressId()%>" class="btn btn-secondary">Quay lại danh sách hộ khẩu</a>
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

                                                                function showForm() {
                                                                    let form = document.querySelector("#form");
                                                                    let title = form.querySelector("h5");
                                                                    let cccdInput = form.querySelector('input[name="cccd"]');
                                                                    cccdInput.value = "";
                                                                    if (form.style.display === 'none' || form.style.display === '') {
                                                                        form.style.display = 'block';
                                                                        title.innerHTML = "Thêm thành viên";
                                                                        cccdInput.readOnly = false;
                                                                        form.querySelector('form').action = "official?action=insertHouseholdMember";

                                                                        form.querySelector('form').reset();

                                                                    } else {
                                                                        form.style.display = 'none';
                                                                    }
                                                                }

                                                                // Hàm chỉnh sửa thông tin
                                                                function editForm(e) {
                                                                    let form = document.querySelector("#form");
                                                                    form.style.display = 'block';
                                                                    let title = form.querySelector("h5");
                                                                    title.innerHTML = "Cập nhật thông tin công dân";
                                                                    let tr = e.closest('tr');
                                                                    let cccd = tr.querySelector('td[name="cccd"]').innerHTML.trim();
                                                                    let relationship = tr.querySelector('td[name="relationship"]').innerHTML.trim();


                                                                    form.querySelector('input[name="cccd"]').value = cccd;
                                                                    form.querySelector('select[name="relationship"]').value = relationship;


                                                                    form.querySelector('input[name="cccd"]').readOnly = true;
                                                                    form.action = "official?action=updateHouseholdMember";
                                                                }
        </script>
    </body>
</html>