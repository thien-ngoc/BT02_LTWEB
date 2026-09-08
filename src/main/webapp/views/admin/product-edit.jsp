<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Sửa sản phẩm</title></head>
<body>
<h2>Sửa sản phẩm</h2>
<c:if test="${alert != null}">
    <div class="alert alert-danger py-2">${alert}</div>
</c:if>
<form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
    <input type="hidden" name="productId" value="${product.productId}">

    Tên sản phẩm:
    <input type="text" name="productName" class="form-control ${errors.productName != null ? 'is-invalid' : ''}"
           value="${product.productName}" required>
    <div class="invalid-feedback"><c:out value="${errors.productName}" default="Vui lòng nhập tên sản phẩm."/></div><br>

    Giá:
    <input type="number" step="0.01" name="price" class="form-control ${errors.price != null ? 'is-invalid' : ''}"
           value="${product.price}" required>
    <div class="invalid-feedback"><c:out value="${errors.price}" default="Giá phải là số lớn hơn 0."/></div><br>

    Số lượng:
    <input type="number" name="quantity" class="form-control ${errors.quantity != null ? 'is-invalid' : ''}"
           value="${product.quantity}" required>
    <div class="invalid-feedback"><c:out value="${errors.quantity}" default="Số lượng phải là số nguyên >= 0."/></div><br>

    Mô tả: <textarea name="description">${product.description}</textarea><br><br>

    Danh mục:
    <select name="categoryId" class="form-control ${errors.categoryId != null ? 'is-invalid' : ''}">
        <c:forEach items="${listcate}" var="cate">
            <option value="${cate.categoryid}" ${cate.categoryid == product.category.categoryid ? 'selected' : ''}>
                    ${cate.categoryname}
            </option>
        </c:forEach>
    </select>
    <div class="invalid-feedback"><c:out value="${errors.categoryId}" default="Vui lòng chọn danh mục."/></div><br>

    <c:if test="${product.image != null}">
        <c:url value="/image?fname=${product.image}" var="imgUrl"/>
        <img src="${imgUrl}" width="150"/><br><br>
    </c:if>
    Ảnh mới: <input type="file" name="image"><br><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>