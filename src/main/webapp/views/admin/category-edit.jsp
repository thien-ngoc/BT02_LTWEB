<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>
<h2>Sửa Category</h2>
<c:if test="${alert != null}">
    <div class="alert alert-danger py-2">${alert}</div>
</c:if>
<form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <input type="hidden" name="categoryid" value="${cate.categoryid}">

    <label>Category name:</label><br>
    <input type="text" name="categoryname" class="form-control ${errors.categoryname != null ? 'is-invalid' : ''}"
           value="${cate.categoryname}" required>
    <div class="invalid-feedback"><c:out value="${errors.categoryname}" default="Vui lòng nhập tên danh mục."/></div><br>

    <label>Link images:</label><br>
    <input type="text" name="images" value="${cate.images}"><br><br>

    <c:choose>
        <c:when test="${fn:length(cate.images) >= 5 && fn:substring(cate.images,0,5) == 'https'}">
            <c:url value="${cate.images}" var="imgUrl"/>
        </c:when>
        <c:otherwise>
            <c:url value="/image?fname=${cate.images}" var="imgUrl"/>
        </c:otherwise>
    </c:choose>
    <img height="100" width="120" src="${imgUrl}"/><br><br>

    <label>Upload images:</label><br>
    <input type="file" name="images1"><br><br>

    <label>Status:</label><br>
    <input type="radio" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}> Hoạt động
    <input type="radio" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}> Khóa
    <br><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>