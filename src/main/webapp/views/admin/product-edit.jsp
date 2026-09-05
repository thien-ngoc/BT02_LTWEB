<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Sửa sản phẩm</title></head>
<body>
<h2>Sửa sản phẩm</h2>
<form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${product.productId}">
    Tên sản phẩm: <input type="text" name="productName" value="${product.productName}"><br><br>
    Giá: <input type="number" step="0.01" name="price" value="${product.price}"><br><br>
    Số lượng: <input type="number" name="quantity" value="${product.quantity}"><br><br>
    Mô tả: <textarea name="description">${product.description}</textarea><br><br>
    Danh mục:
    <select name="categoryId">
        <c:forEach items="${listcate}" var="cate">
            <option value="${cate.categoryid}" ${cate.categoryid == product.category.categoryid ? 'selected' : ''}>
                    ${cate.categoryname}
            </option>
        </c:forEach>
    </select><br><br>
    <c:if test="${product.image != null}">
        <c:url value="/image?fname=${product.image}" var="imgUrl"/>
        <img src="${imgUrl}" width="150"/><br><br>
    </c:if>
    Ảnh mới: <input type="file" name="image"><br><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>