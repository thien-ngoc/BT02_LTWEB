<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>

<h3 class="mb-4 fw-bold">Tất cả sản phẩm</h3>

<div class="row g-4">
    <c:forEach items="${products}" var="p">
        <div class="col-6 col-md-4 col-lg-3">
            <div class="card h-100">
                <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="text-decoration-none text-dark">
                    <c:choose>
                        <c:when test="${p.image != null}">
                            <c:url value="/image?fname=${p.image}" var="imgUrl"/>
                            <img src="${imgUrl}" class="card-img-top">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/300x180?text=No+Image" class="card-img-top">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <p class="card-text mb-1 fw-semibold">${p.productName}</p>
                        <p class="price-tag mb-0">${p.price} đ</p>
                    </div>
                </a>
            </div>
        </div>
    </c:forEach>
</div>

<c:if test="${totalPages > 0}">
    <nav class="mt-4">
        <ul class="pagination justify-content-center">
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product?page=${i}">${i + 1}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</c:if>

<c:if test="${totalPages == 0}">
    <div class="text-center text-muted mt-4">
        <p>Chưa có sản phẩm nào trong hệ thống.</p>
    </div>
</c:if>

</body>
</html>