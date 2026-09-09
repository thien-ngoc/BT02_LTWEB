package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.dao.IUserProfileDao;
import vn.iotstar.dao.impl.UserProfileDao;
import vn.iotstar.model.User;
import vn.iotstar.model.UserEntity;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.ValidationUtil;

@WebServlet(urlPatterns = "/change-password")
public class ChangePasswordController extends HttpServlet {
    IUserProfileDao profileDao = new UserProfileDao();
    UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        User account = (User) session.getAttribute("account");

        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        String alert;

        if (ValidationUtil.isBlank(oldPassword)) {
            alert = "Vui lòng nhập mật khẩu hiện tại.";
        } else if (!ValidationUtil.isMinLength(newPassword, 6)) {
            alert = "Mật khẩu mới phải có tối thiểu 6 ký tự.";
        } else if (!newPassword.equals(confirmPassword)) {
            alert = "Xác nhận mật khẩu mới không khớp.";
        } else if (newPassword.equals(oldPassword)) {
            alert = "Mật khẩu mới phải khác mật khẩu hiện tại.";
        } else {
            int result = userService.changePassword(account.getUserName(), oldPassword, newPassword);
            if (result == 0) {
                alert = "Đổi mật khẩu thành công!";
            } else if (result == 1) {
                alert = "Mật khẩu hiện tại không đúng.";
            } else {
                alert = "Không tìm thấy tài khoản.";
            }
        }

        UserEntity userEntity = profileDao.findByUsername(account.getUserName());
        req.setAttribute("user", userEntity);
        req.setAttribute("pwAlert", alert);
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }
}