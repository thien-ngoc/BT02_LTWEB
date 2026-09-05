<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Quên mật khẩu</title></head>
<body>
<h2>Quên mật khẩu</h2>
<c:if test="${alert != null}">
    <h3 style="color:red">${alert}</h3>
</c:if>
<form action="${pageContext.request.contextPath}/forgot-password" method="post">
    Nhập email đã đăng ký: <input type="email" name="email" required><br><br>
    <input type="submit" value="Gửi mã OTP">
</form>
</body>
</html>