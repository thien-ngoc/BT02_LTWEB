<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #1a1a2e, #16213e); min-height: 100vh; display:flex; align-items:center; }
        .auth-box { max-width: 420px; margin: auto; background:#fff; padding:40px; border-radius:16px; box-shadow:0 10px 40px rgba(0,0,0,0.3); }
        .btn-primary { background-color:#ff6a00; border-color:#ff6a00; }
        .btn-primary:hover { background-color:#e35d00; border-color:#e35d00; }
    </style>
</head>
<body>
<div class="auth-box">
    <h3 class="text-center mb-4"><i class="fa-solid fa-cart-shopping text-warning"></i> Đăng Nhập</h3>

    <c:if test="${alert != null}">
        <div class="alert alert-danger py-2">${alert}</div>
    </c:if>

    <form action="login" method="post">
        <div class="mb-3">
            <label class="form-label">Tài khoản</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                <input type="text" name="username" class="form-control" required>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                <input type="password" name="password" class="form-control" required>
            </div>
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" name="remember" id="remember">
            <label class="form-check-label" for="remember">Nhớ tôi</label>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>

    <div class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/forgot-password" class="d-block mb-2 text-decoration-none">Quên mật khẩu?</a>
        <span>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" class="text-decoration-none fw-bold">Đăng ký</a></span>
    </div>
</div>
</body>
</html>