<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký tài khoản</title>
</head>
<body>
<h2>Tạo Tài Khoản Mới</h2>

<c:if test="${alert != null}">
    <h3 style="color:red">${alert}</h3>
</c:if>

<form action="register" method="post">
    Tài khoản: <input type="text" name="username" required><br><br>
    Họ tên: <input type="text" name="fullname"><br><br>
    Email: <input type="email" name="email" required><br><br>
    Số điện thoại: <input type="text" name="phone"><br><br>
    Mật khẩu: <input type="password" name="password" required><br><br>
    <input type="submit" value="Tạo tài khoản">
</form>

<p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a></p>
</body>
</html>