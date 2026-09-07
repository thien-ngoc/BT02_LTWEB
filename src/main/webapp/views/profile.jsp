<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Thông tin cá nhân</title></head>
<body>
<h2>Thông tin cá nhân</h2>

<c:if test="${alert != null}">
    <h3 style="color:green">${alert}</h3>
</c:if>

<form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
    <div>
        <label>Tài khoản:</label> ${user.username} (không thể thay đổi)
    </div>
    <div>
        <label>Họ tên:</label><br>
        <input type="text" name="fullname" value="${user.fullname}" required>
    </div>
    <div>
        <label>Số điện thoại:</label><br>
        <input type="text" name="phone" value="${user.phone}">
    </div>
    <div>
        <c:if test="${user.avatar != null}">
            <c:url value="/image?fname=${user.avatar}" var="imgUrl"/>
            <img src="${imgUrl}" width="120"/><br>
        </c:if>
        <label>Ảnh đại diện:</label><br>
        <input type="file" name="avatar">
    </div>
    <br>
    <button type="submit">Cập nhật</button>
</form>

<a href="${pageContext.request.contextPath}/home">Về trang chủ</a>
</body>
</html>