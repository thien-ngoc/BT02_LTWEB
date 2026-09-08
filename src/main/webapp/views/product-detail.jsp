<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>

<div class="row g-4">
    <div class="col-md-5">
        <c:choose>
            <c:when test="${product.image != null}">
                <c:url value="/image?fname=${product.image}" var="imgUrl"/>
                <img src="${imgUrl}" class="img-fluid rounded-4 shadow-sm">
            </c:when>
            <c:otherwise>
                <img src="https://via.placeholder.com/500x400?text=No+Image" class="img-fluid rounded-4">
            </c:otherwise>
        </c:choose>
    </div>
    <div class="col-md-7">
        <h2 class="fw-bold">${product.productName}</h2>
        <h4 class="price-tag mb-3">${product.price} đ</h4>
        <p><span class="badge bg-secondary">Danh mục: ${product.category.categoryname}</span></p>
        <p><i class="fa-solid fa-boxes-stacked"></i> Còn lại: ${product.quantity} sản phẩm</p>
        <hr>
        <p>${product.description}</p>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-secondary mt-3">
            <i class="fa-solid fa-arrow-left"></i> Quay lại danh sách
        </a>
    </div>
</div>

</body>
</html>