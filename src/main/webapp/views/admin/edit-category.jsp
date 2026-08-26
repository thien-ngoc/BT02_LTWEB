<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Chỉnh sửa danh mục</title></head>
<body>
<h2>Chỉnh sửa danh mục</h2>
<c:url value="/admin/category/edit" var="edit"/>
<form action="${edit}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${category.id}">
    <div>
        <label>Tên danh mục:</label>
        <input type="text" name="name" value="${category.name}">
    </div>
    <div>
        <c:if test="${category.icon != null}">
            <c:url value="/image?fname=${category.icon}" var="imgUrl"/>
            <img width="100" src="${imgUrl}"><br>
        </c:if>
        <label>Ảnh đại diện:</label>
        <input type="file" name="icon">
    </div>
    <button type="submit">Cập nhật</button>
    <button type="reset">Reset</button>
</form>
<a href="${pageContext.request.contextPath}/admin/category/list">Quay lại danh sách</a>
</body>
</html>