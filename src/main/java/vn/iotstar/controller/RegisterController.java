package vn.iotstar.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;
import vn.iotstar.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");

        UserService service = new UserServiceImpl();
        String alertMsg = "";

        Map<String, String> errors = new HashMap<>();
        if (!ValidationUtil.isValidUsername(username))
            errors.put("username", "Tài khoản 4-20 ký tự, chỉ gồm chữ/số/gạch dưới.");
        if (ValidationUtil.isBlank(fullname))
            errors.put("fullname", "Vui lòng nhập họ tên.");
        if (!ValidationUtil.isValidEmail(email))
            errors.put("email", "Email không hợp lệ.");
        if (!ValidationUtil.isValidPhone(phone))
            errors.put("phone", "Số điện thoại phải gồm đúng 10 chữ số.");
        if (!ValidationUtil.isMinLength(password, 6))
            errors.put("password", "Mật khẩu tối thiểu 6 ký tự.");

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("alert", "Vui lòng kiểm tra lại thông tin đã nhập.");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        if (service.checkExistEmail(email)) {
            errors.put("email", "Email đã tồn tại!");
            req.setAttribute("errors", errors);
            req.setAttribute("alert", "Email đã tồn tại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }
        if (service.checkExistUsername(username)) {
            errors.put("username", "Tài khoản đã tồn tại!");
            req.setAttribute("errors", errors);
            req.setAttribute("alert", "Tài khoản đã tồn tại!");
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        boolean isSuccess = service.register(username, password, email, fullname, phone);

        if (isSuccess) {
            req.setAttribute("username", username);
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
        } else {
            alertMsg = "Lỗi hệ thống, vui lòng thử lại!";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}