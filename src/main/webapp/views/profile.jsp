<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head><title>Tiêu đề trang</title></head>
<body>

<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card p-4">
            <h4 class="fw-bold mb-4 text-center">Thông tin cá nhân</h4>

            <c:if test="${alert != null}">
                <div class="alert alert-success py-2">${alert}</div>
            </c:if>

            <div class="text-center mb-3">
                <c:choose>
                    <c:when test="${user.avatar != null}">
                        <c:url value="/image?fname=${user.avatar}" var="imgUrl"/>
                        <img src="${imgUrl}" class="rounded-circle" width="120" height="120" style="object-fit:cover;">
                    </c:when>
                    <c:otherwise>
                        <i class="fa-solid fa-circle-user" style="font-size:120px; color:#ccc;"></i>
                    </c:otherwise>
                </c:choose>
            </div>

            <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Tài khoản</label>
                    <input type="text" class="form-control" value="${user.username}" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label">Họ tên</label>
                    <input type="text" name="fullname" class="form-control" value="${user.fullname}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số điện thoại</label>
                    <input type="text" name="phone" class="form-control" value="${user.phone}" pattern="[0-9]{10}">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ảnh đại diện</label>
                    <input type="file" name="avatar" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>