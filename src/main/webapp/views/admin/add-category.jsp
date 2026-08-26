<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><title>Thêm danh mục</title></head>
<body>
<h2>Thêm danh mục mới</h2>
<form action="add" method="post" enctype="multipart/form-data">
    <div>
        <label>Tên danh mục:</label>
        <input type="text" name="name" placeholder="Nhập tên danh mục" required>
    </div>
    <div>
        <label>Ảnh đại diện:</label>
        <input type="file" name="icon">
    </div>
    <button type="submit">Thêm</button>
    <button type="reset">Hủy</button>
</form>
<a href="${pageContext.request.contextPath}/admin/category/list">Quay lại danh sách</a>
</body>
</html>