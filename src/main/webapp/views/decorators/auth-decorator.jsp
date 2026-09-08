<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title' /></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #1a1a2e, #16213e); min-height: 100vh; display:flex; align-items:center; padding: 40px 0; }
        .auth-box { max-width: 460px; margin: auto; background:#fff; padding:40px; border-radius:16px; box-shadow:0 10px 40px rgba(0,0,0,0.3); }
        .btn-primary { background-color:#ff6a00; border-color:#ff6a00; }
        .btn-primary:hover { background-color:#e35d00; border-color:#e35d00; }
        .invalid-feedback { display: block; }
    </style>
    <sitemesh:write property='head' />
</head>
<body>
<div class="auth-box">
    <sitemesh:write property='body' />
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/form-validate.js"></script>
</body>
</html>