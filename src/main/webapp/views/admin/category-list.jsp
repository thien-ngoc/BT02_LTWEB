<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Danh sách Category</title></head>
<body>
<h2>Quản lý Category</h2>
<a href="<c:url value='/admin/category/add'/>">Thêm Category</a>
<hr>
<table border="1" width="100%">
    <tr>
        <th>STT</th><th>Ảnh</th><th>Tên</th><th>Trạng thái</th><th>Hành động</th>
    </tr>
    <c:forEach items="${listcate}" var="cate" varStatus="STT">
        <tr>
            <td>${STT.index + 1}</td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(cate.images) >= 5 && fn:substring(cate.images,0,5) == 'https'}">
                        <c:url value="${cate.images}" var="imgUrl"/>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/image?fname=${cate.images}" var="imgUrl"/>
                    </c:otherwise>
                </c:choose>
                <img height="100" width="120" src="${imgUrl}"/>
            </td>
            <td>${cate.categoryname}</td>
            <td>${cate.status == 1 ? 'Hoạt động' : 'Khóa'}</td>
            <td>
                <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>">Sửa</a>
                |
                <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>"
                   onclick="return confirm('Xác nhận xóa?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>