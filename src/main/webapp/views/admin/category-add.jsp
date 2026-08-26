<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Thêm Category</title></head>
<body>
<h2>Thêm Category</h2>
<form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
    <label>Category name:</label><br>
    <input type="text" name="categoryname" required><br><br>

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