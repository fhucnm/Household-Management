<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>Hệ thống quản lý</title>
    <link rel="stylesheet" href="./css/register.css">
</head>

<!DOCTYPE html>
<html>

    <body>
        <img src="https://www.vlajky.eu/vlajky/264/vn.jpg?w=200&h=300" alt="Flag" class="flag">
        <div class="container">
            <h2>Kích hoạt tài khoản</h2>
            <form action="auth?action=register" method="POST">
                <input type="text" name="cccd" placeholder="Số CCCD" required>
                <input type="password" name="password" placeholder="Mật khẩu" required> 
                <input type="password" name="confirmPassword" placeholder="Xác nhận lại mật khẩu" required>
                <input type="submit" value="Kích hoạt ngay">
                <% if (request.getAttribute("error") != null) { %>
                <p style="color: red; font-weight: bold;"><%= request.getAttribute("error") %></p>
                <% } %>
            </form>
            <div class="links">
                Đã kích hoạt?<a href="auth">Đăng nhập ngay</a>
            </div>
        </div>
    </body>
</html>
