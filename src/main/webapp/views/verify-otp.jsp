<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Xác thực OTP</title></head>
<body>
<h2>Xác thực tài khoản</h2>
<p>Mã OTP đã được gửi tới email của bạn. Vui lòng nhập để kích hoạt tài khoản.</p>

<c:if test="${alert != null}">
    <h3 style="color:red">${alert}</h3>
</c:if>

<form action="${pageContext.request.contextPath}/verify-otp" method="post">
    <input type="hidden" name="username" value="${username}">
    Mã OTP: <input type="text" name="otp" required><br><br>
    <input type="submit" value="Xác thực">
</form>
</body>
</html>