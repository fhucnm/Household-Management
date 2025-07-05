<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.Role"%>
<%@page import="dao.RoleDAO"%>
<%@page import="dao.AddressDAO"%>
<%@page import="model.Address"%>
<%@page import="model.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách công dân - PDK</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/official-work.css">

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
                    <h4>DANH SÁCH CÔNG DÂN</h4>
                    <p>Quản lý thông tin công dân trong hệ thống trong khu vực <%= user.getAddress()%></p>
                </div>

                <!-- Search Form -->
                <form action="official?action=search" method="POST" class="mb-3">
                    <input type="hidden" name="addressId" value="<%= user.getAddressId()%>">
                    <div class="input-group w-50">
                        <input type="text" name="keywords" class="form-control" placeholder="Tìm kiếm theo tên">
                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    </div>
                    
                </form>

                <!-- Add Button -->
                <div class="mb-3">
                    <button onclick="showForm()" class="btn btn-primary">Thêm công dân</button>
                </div>

                <!-- Insert/Update Form -->
                <div class="card-custom mb-3" id="form" style="display: none;">
                    <h5 class="text-center mb-3">Thêm công dân</h5>
                    <form action="official?action=insert" method="POST">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label>CCCD:</label>
                                <input type="text" name="cccd" class="form-control" readonly>
                            </div>
                            <div class="col-md-6">
                                <label>Họ và Tên:</label>
                                <input type="text" name="fullName" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Ngày sinh:</label>
                                <input type="date" name="birthday" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Email:</label>
                                <input type="email" name="email" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Số điện thoại:</label>
                                <input type="text" name="phoneNumber" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Giới tính:</label>
                                <select name="gender" class="form-select">
                                    <option value="M">Nam</option>
                                    <option value="F">Nữ</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Mật khẩu:</label>
                                <input type="text" name="password" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label>Vai trò:</label>
                                <input type="hidden" name="roleId" value="2" readonly>
                                <input type="text" name="roleName" value="Công dân" readonly class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label>Địa chỉ:</label>
                                 <%Address adr = AddressDAO.findByAddressId(user.getAddressId()); %>
                                
                                 <input type="hidden" name="addressId" value="<%=adr.getAddressId()%>">
                                 <input type="text" name="address" value="<%=adr.getStreet()%> - <%=adr.getWard()%> - <%=adr.getDistrict()%> - <%=adr.getCity()%>" readonly class="form-control">
                                                                       
                                
                            </div>
                            <div class="col-md-12 text-center">
                                <input type="submit" value="SUBMIT" class="btn btn-success">
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Table Section -->
                <div class="card-custom table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>CCCD</th>
                                <th>Họ và Tên</th>
                                <th>Ngày sinh</th>
                                <th class="truncate">Email</th>
                                <th>Số điện thoại</th>
                                <th>Giới tính</th>
                                <th>Vai trò</th>
                                <th class="truncate">Địa chỉ</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${listUsers}">
                                <tr>
                                    <td name="cccd">${user.cccd}</td>
                                    <td name="fullName">${user.fullName}</td>
                                    <td name="birthday">${user.birthday}</td>
                                    <td name="email" class="truncate">${user.email}</td>
                                    <td name="phoneNumber">${user.phoneNumber}</td>
                                    <td name="gender">
                                        <c:choose>
                                            <c:when test="${user.gender == 'M'}">Nam</c:when>
                                            <c:when test="${user.gender == 'F'}">Nữ</c:when>
                                            <c:otherwise>Khác</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td name="roleName">${user.roleName}</td>
                                    <td name="address" class="truncate">${user.address}</td>
                                    
                                    <td>
                                        <button onclick="editForm(this)" class="btn btn-warning btn-sm" style="display: inline;">Sửa</button>
                                        <form action="official?action=delete" method="POST" style="display:inline;">
                                            <input type="hidden" name="cccd" value="${user.cccd}"/>
                                            <input type="hidden" name="addressId" value="${user.addressId}">
                                            <a href="#" onclick="return this.closest('form').submit()"><button class="btn btn-danger btn-sm">Xóa</button></a>
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

        // Hàm hiển thị form thêm
        function showForm() {
            let form = document.querySelector("#form");
            let title = form.querySelector("h5");
            let cccdInput = form.querySelector('input[name="cccd"]');

            if (form.style.display === 'none' || form.style.display === '') {
                form.style.display = 'block';
                title.innerHTML = "Thêm công dân";
                cccdInput.readOnly = false;
                form.querySelector('form').action = "official?action=insert";
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
            let fullName = tr.querySelector('td[name="fullName"]').innerHTML.trim();
            let birthday = tr.querySelector('td[name="birthday"]').innerHTML.trim();
            let email = tr.querySelector('td[name="email"]').innerHTML.trim();
            let phoneNumber = tr.querySelector('td[name="phoneNumber"]').innerHTML.trim();
            let gender = tr.querySelector('td[name="gender"]').innerHTML.trim();
            let roleName = tr.querySelector('td[name="roleName"]').innerHTML.trim();
            let address = tr.querySelector('td[name="address"]').innerHTML.trim();

            form.querySelector('input[name="cccd"]').value = cccd;
            form.querySelector('input[name="fullName"]').value = fullName;
            form.querySelector('input[name="birthday"]').value = birthday;
            form.querySelector('input[name="email"]').value = email;
            form.querySelector('input[name="phoneNumber"]').value = phoneNumber;
            form.querySelector('select[name="gender"]').value = (gender === "Nam") ? "M" : "F";
            
            form.querySelector('input[name="password"]').value = "1";
            form.querySelector('input[name="cccd"]').readOnly = true;
            form.querySelector('form').action = "official?action=update";
        }
    </script>
</body>
</html>