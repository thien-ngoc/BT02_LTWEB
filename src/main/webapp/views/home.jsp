<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Trang chủ</title></head>
<body>
<h2>Xin chào, ${sessionScope.account.fullName}!</h2>
<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
<a href="${pageContext.request.contextPath}/product">Xem tất cả sản phẩm</a>

<h3>Sản phẩm mới nhất</h3>
<div style="display:flex; flex-wrap:wrap; gap:16px;">
    <c:forEach items="${latestProducts}" var="p">
        <div style="border:1px solid #ccc; padding:10px; width:180px;">
            <a href="${pageContext.request.contextPath}/product-detail?id=${p.productId}">
                <c:if test="${p.image != null}">
                    <c:url value="/image?fname=${p.image}" var="imgUrl"/>
                    <img src="${imgUrl}" width="150" height="150"/>
                </c:if>
                <p>${p.productName}</p>
                <p>${p.price} VNĐ</p>
            </a>
        </div>
    </c:forEach>
</div>
</body>
</html>