<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #1a1a2e, #16213e); min-height: 100vh; padding: 40px 0; }
        .auth-box { max-width: 480px; margin: auto; background:#fff; padding:40px; border-radius:16px; box-shadow:0 10px 40px rgba(0,0,0,0.3); }
        .btn-primary { background-color:#ff6a00; border-color:#ff6a00; }
        .btn-primary:hover { background-color:#e35d00; border-color:#e35d00; }
    </style>
</head>
<body>
<div class="auth-box">
    <h3 class="text-center mb-4"><i class="fa-solid fa-user-plus text-warning"></i> Tạo Tài Khoản</h3>

    <c:if test="${alert != null}">
        <div class="alert alert-danger py-2">${alert}</div>
    </c:if>

    <form action="register" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label class="form-label">Tài khoản</label>
            <input type="text" name="username" class="form-control ${errors.username != null ? 'is-invalid' : ''}"
                   value="${param.username}" required minlength="4">
            <div class="invalid-feedback"><c:out value="${errors.username}" default="Tài khoản 4-20 ký tự."/></div>
        </div>
        <div class="mb-3">
            <label class="form-label">Họ tên</label>
            <input type="text" name="fullname" class="form-control ${errors.fullname != null ? 'is-invalid' : ''}"
                   value="${param.fullname}" required>
            <div class="invalid-feedback"><c:out value="${errors.fullname}" default="Vui lòng nhập họ tên."/></div>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control ${errors.email != null ? 'is-invalid' : ''}"
                   value="${param.email}" required>
            <div class="invalid-feedback"><c:out value="${errors.email}" default="Email không hợp lệ."/></div>
        </div>
        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input type="text" name="phone" class="form-control ${errors.phone != null ? 'is-invalid' : ''}"
                   value="${param.phone}" pattern="[0-9]{10}">
            <div class="invalid-feedback"><c:out value="${errors.phone}" default="Số điện thoại phải gồm 10 chữ số."/></div>
        </div>
        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <input type="password" name="password" class="form-control ${errors.password != null ? 'is-invalid' : ''}"
                   required minlength="6">
            <div class="invalid-feedback"><c:out value="${errors.password}" default="Mật khẩu tối thiểu 6 ký tự."/></div>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
    </form>

    <div class="text-center mt-3">
        <span>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="text-decoration-none fw-bold">Đăng nhập</a></span>
    </div>
</div>

<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault(); event.stopPropagation();
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
</body>
</html>