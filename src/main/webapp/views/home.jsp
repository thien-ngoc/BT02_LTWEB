<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>

<div class="p-5 mb-4 rounded-4 text-white" style="background: linear-gradient(135deg,#ff6a00,#ee0979);">
    <h1 class="display-6 fw-bold">Xin chào, ${sessionScope.account.fullName}! 👋</h1>
    <p class="lead mb-0">Khám phá những sản phẩm mới nhất của chúng tôi</p>
</div>

<h4 class="mb-3 fw-bold">🔥 Sản phẩm mới nhất</h4>
<div class="row g-4">
    <c:forEach items="${latestProducts}" var="p">
        <div class="col-6 col-md-3">
            <div class="card h-100">
                <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}" class="text-decoration-none text-dark">
                    <c:choose>
                        <c:when test="${p.image != null}">
                            <c:url value="/image?fname=${p.image}" var="imgUrl"/>
                            <img src="${imgUrl}" class="card-img-top" alt="${p.productName}">
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

</body>
</html>