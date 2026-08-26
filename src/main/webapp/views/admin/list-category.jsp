<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Danh sách danh mục</title></head>
<body>
<h2>Quản lý danh mục</h2>
<a href="${pageContext.request.contextPath}/admin/category/add">Thêm danh mục mới</a>
<table border="1" cellpadding="8">
    <tr>
        <th>STT</th>
        <th>Hình ảnh</th>
        <th>Tên danh mục</th>
        <th>Hành động</th>
    </tr>
    <c:forEach items="${cateList}" var="cate" varStatus="STT">
        <tr>
            <td>${STT.index + 1}</td>
            <td>
                <c:if test="${cate.icon != null}">
                    <c:url value="/image?fname=${cate.icon}" var="imgUrl"/>
                    <img height="80" width="80" src="${imgUrl}" />
                </c:if>
            </td>
            <td>${cate.name}</td>
            <td>
                <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Sửa</a>
                |
                <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>"
                   onclick="return confirm('Xác nhận xóa?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>