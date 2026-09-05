<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Chi tiết sản phẩm</title></head>
<body>
<h2>${product.productName}</h2>
<c:if test="${product.image != null}">
    <c:url value="/image?fname=${product.image}" var="imgUrl"/>
    <img src="${imgUrl}" width="300"/>
</c:if>
<p>Giá: ${product.price} VNĐ</p>
<p>Số lượng còn: ${product.quantity}</p>
<p>Danh mục: ${product.category.categoryname}</p>
<p>Mô tả: ${product.description}</p>

<a href="${pageContext.request.contextPath}/product">Quay lại danh sách</a>
</body>
</html>