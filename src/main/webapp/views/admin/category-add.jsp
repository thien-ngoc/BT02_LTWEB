<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>
<h2>Thêm Category</h2>
<c:if test="${alert != null}">
    <div class="alert alert-danger py-2">${alert}</div>
</c:if>
<form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <label>Category name:</label><br>
    <input type="text" name="categoryname" class="form-control ${errors.categoryname != null ? 'is-invalid' : ''}"
           value="${param.categoryname}" required>
    <div class="invalid-feedback"><c:out value="${errors.categoryname}" default="Vui lòng nhập tên danh mục."/></div><br>

    <label>Link images:</label><br>
    <input type="text" name="images"><br><br>

    <label>Upload images:</label><br>
    <input type="file" name="images1"><br><br>

    <label>Status:</label><br>
    <input type="radio" name="status" value="1" checked> Hoạt động
    <input type="radio" name="status" value="0"> Khóa
    <br><br>
    <input type="submit" value="Thêm">
</form>
</body>
</html>