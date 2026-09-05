<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Quản lý Sản phẩm</title></head>
<body>
<h2>Quản lý Sản phẩm</h2>
<a href="<c:url value='/admin/product/add'/>">Thêm sản phẩm</a>
<table border="1" width="100%">
    <tr><th>STT</th><th>Ảnh</th><th>Tên</th><th>Giá</th><th>Danh mục</th><th>Hành động</th></tr>
    <c:forEach items="${listproduct}" var="p" varStatus="STT">
        <tr>
            <td>${STT.index + 1}</td>
            <td>
                <c:if test="${p.image != null}">
                    <c:url value="/image?fname=${p.image}" var="imgUrl"/>
                    <img height="80" width="80" src="${imgUrl}"/>
                </c:if>
            </td>
            <td>${p.productName}</td>
            <td>${p.price}</td>
            <td>${p.category.categoryname}</td>
            <td>
                <a href="<c:url value='/admin/product/edit?id=${p.productId}'/>">Sửa</a>
                | <a href="<c:url value='/admin/product/delete?id=${p.productId}'/>"
                     onclick="return confirm('Xác nhận xóa?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>