<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>Hệ thống quản lý</title>
    <link rel="stylesheet" href="./css/login.css">
</head>

<!DOCTYPE html>
<html>

    <body>
        <img src=https://www.vlajky.eu/vlajky/264/vn.jpg?w=200&h=300 alt="Flag" class="flag">
        <div class="container"> <!-- Khung chứa nội dung đăng nhập -->
            <h2>Đăng nhập</h2>  
            <form action="auth?action=login" method="POST">
                <input type="text" name="cccd" placeholder="Nhập số cccd" required> 
                <input type="password" name="password" placeholder="Your Password" required> 
                <input type="submit" value="Đăng nhập">
                <% if (request.getAttribute("error") != null) { %>
                <p style="color: red; font-weight: bold;"><%= request.getAttribute("error") %></p>
                <% } %>
            </form>
            <div class="links"> 
                <p>Chưa được kích hoạt? <a href="auth?action=register">Kích hoạt ngay</a></p>
            </div>
        </div>
    </body>
</html>
