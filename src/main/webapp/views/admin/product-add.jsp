<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h2>Thêm sản phẩm</h2>
<c:if test="${alert != null}">
    <div class="alert alert-danger py-2">${alert}</div>
</c:if>
<form action="<c:url value='/admin/product/insert'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    Tên sản phẩm:
    <input type="text" name="productName" class="form-control ${errors.productName != null ? 'is-invalid' : ''}"
           value="${param.productName}" required>
    <div class="invalid-feedback"><c:out value="${errors.productName}" default="Vui lòng nhập tên sản phẩm."/></div><br>

    Giá:
    <input type="number" step="0.01" name="price" class="form-control ${errors.price != null ? 'is-invalid' : ''}"
           value="${param.price}" required>
    <div class="invalid-feedback"><c:out value="${errors.price}" default="Giá phải là số lớn hơn 0."/></div><br>

    Số lượng:
    <input type="number" name="quantity" class="form-control ${errors.quantity != null ? 'is-invalid' : ''}"
           value="${param.quantity}" required>
    <div class="invalid-feedback"><c:out value="${errors.quantity}" default="Số lượng phải là số nguyên >= 0."/></div><br>

    Mô tả: <textarea name="description">${param.description}</textarea><br><br>

    Danh mục:
    <select name="categoryId" class="form-control ${errors.categoryId != null ? 'is-invalid' : ''}">
        <option value="">-- Chọn danh mục --</option>
        <c:forEach items="${listcate}" var="cate">
            <option value="${cate.categoryid}" ${param.categoryId == cate.categoryid ? 'selected' : ''}>${cate.categoryname}</option>
        </c:forEach>
    </select>
    <div class="invalid-feedback"><c:out value="${errors.categoryId}" default="Vui lòng chọn danh mục."/></div><br>

    Ảnh: <input type="file" name="image"><br><br>
    <input type="submit" value="Thêm">
</form>
</body>
</html>