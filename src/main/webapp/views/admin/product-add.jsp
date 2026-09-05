<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Thêm sản phẩm</title></head>
<body>
<h2>Thêm sản phẩm</h2>
<form action="<c:url value='/admin/product/insert'/>" method="post" enctype="multipart/form-data">
    Tên sản phẩm: <input type="text" name="productName" required><br><br>
    Giá: <input type="number" step="0.01" name="price" required><br><br>
    Số lượng: <input type="number" name="quantity" required><br><br>
    Mô tả: <textarea name="description"></textarea><br><br>
    Danh mục:
    <select name="categoryId">
        <c:forEach items="${listcate}" var="cate">
            <option value="${cate.categoryid}">${cate.categoryname}</option>
        </c:forEach>
    </select><br><br>
    Ảnh: <input type="file" name="image"><br><br>
    <input type="submit" value="Thêm">
</form>
</body>
</html>