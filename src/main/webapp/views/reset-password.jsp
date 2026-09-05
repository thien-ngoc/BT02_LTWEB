<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Đặt lại mật khẩu</title></head>
<body>
<h2>Đặt lại mật khẩu</h2>
<c:if test="${alert != null}">
    <h3 style="color:red">${alert}</h3>
</c:if>
<form action="${pageContext.request.contextPath}/reset-password" method="post">
    <input type="hidden" name="email" value="${email}">
    Mã OTP: <input type="text" name="otp" required><br><br>
    Mật khẩu mới: <input type="password" name="newPassword" required><br><br>
    <input type="submit" value="Đặt lại mật khẩu">
</form>
</body>
</html>