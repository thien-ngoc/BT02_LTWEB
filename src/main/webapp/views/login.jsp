<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
<h2>Đăng Nhập Vào Hệ Thống</h2>

<c:if test="${alert != null}">
    <h3 style="color:red">${alert}</h3>
</c:if>

<form action="login" method="post">
    Tài khoản: <input type="text" name="username"><br><br>
    Mật khẩu: <input type="password" name="password"><br><br>
    <input type="checkbox" name="remember"> Nhớ tôi<br><br>
    <input type="submit" value="Đăng nhập">

</form>
<p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký</a></p>
<p><a href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu?</a></p>
</body>
</html>