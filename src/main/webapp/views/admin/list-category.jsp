<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h4 class="fw-bold">Quản lý Danh mục</h4>
    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary">
        <i class="fa-solid fa-plus"></i> Thêm danh mục
    </a>
</div>

<div class="card p-3">
    <table class="table table-hover align-middle mb-0">
        <thead class="table-light">
        <tr><th>#</th><th>Ảnh</th><th>Tên</th><th>Trạng thái</th><th class="text-end">Hành động</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${listcate}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index + 1}</td>
                <td>
                    <c:if test="${cate.images != null}">
                        <c:url value="/image?fname=${cate.images}" var="imgUrl"/>
                        <img src="${imgUrl}" width="60" height="60" style="object-fit:cover;" class="rounded">
                    </c:if>
                </td>
                <td>${cate.categoryname}</td>
                <td>
                    <c:choose>
                        <c:when test="${cate.status == 1}"><span class="badge bg-success">Hoạt động</span></c:when>
                        <c:otherwise><span class="badge bg-secondary">Khóa</span></c:otherwise>
                    </c:choose>
                </td>
                <td class="text-end">
                    <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>" class="btn btn-sm btn-outline-primary">Sửa</a>
                    <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Xác nhận xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>