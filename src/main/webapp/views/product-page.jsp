<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Sản phẩm</title></head>
<body>
<h2>Tất cả sản phẩm</h2>
<a href="${pageContext.request.contextPath}/home">Về trang chủ</a>

<div style="display:flex; flex-wrap:wrap; gap:16px;">
    <c:forEach items="${products}" var="p">
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

<div style="margin-top:20px;">
    <c:forEach begin="0" end="${totalPages - 1}" var="i">
        <c:choose>
            <c:when test="${i == currentPage}">
                <b>[${i + 1}]</b>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/product?page=${i}">${i + 1}</a>
            </c:otherwise>
        </c:choose>
        &nbsp;
    </c:forEach>
</div>
</body>
</html>