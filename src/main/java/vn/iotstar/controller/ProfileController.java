package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.util.HashMap;
import java.util.Map;
import vn.iotstar.util.ValidationUtil;
import vn.iotstar.dao.IUserProfileDao;
import vn.iotstar.dao.impl.UserProfileDao;
import vn.iotstar.model.User;
import vn.iotstar.model.UserEntity;
import vn.iotstar.util.Constant;

@MultipartConfig
@WebServlet(urlPatterns = "/profile")
public class ProfileController extends HttpServlet {
    IUserProfileDao profileDao = new UserProfileDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        User account = (User) session.getAttribute("account");
        UserEntity userEntity = profileDao.findByUsername(account.getUserName());
        req.setAttribute("user", userEntity);
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

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
        UserEntity userEntity = profileDao.findByUsername(account.getUserName());

        if (userEntity == null) {
            req.setAttribute("alert", "Không tìm thấy thông tin người dùng!");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        Map<String, String> errors = new HashMap<>();
        if (ValidationUtil.isBlank(fullname)) errors.put("fullname", "Vui lòng nhập họ tên.");
        if (!ValidationUtil.isValidPhone(phone)) errors.put("phone", "Số điện thoại phải gồm đúng 10 chữ số.");
        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("user", userEntity);
            req.setAttribute("alert", "Vui lòng kiểm tra lại thông tin.");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }
        userEntity.setFullname(fullname);
        userEntity.setPhone(phone);

        String uploadPath = Constant.DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        Part part = req.getPart("avatar");
        if (part != null && part.getSize() > 0) {
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            int index = filename.lastIndexOf(".");
            String ext = filename.substring(index + 1);
            String fname = System.currentTimeMillis() + "." + ext;
            part.write(uploadPath + "/" + fname);
            userEntity.setAvatar(fname);
        }

        profileDao.update(userEntity);

        // Cập nhật lại session để hiển thị đúng ngay không cần đăng nhập lại
        account.setFullName(fullname);
        account.setPhone(phone);
        if (userEntity.getAvatar() != null) {
            account.setAvatar(userEntity.getAvatar());
        }
        session.setAttribute("account", account);

        req.setAttribute("user", userEntity);
        req.setAttribute("alert", "Cập nhật thông tin thành công!");
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }
}