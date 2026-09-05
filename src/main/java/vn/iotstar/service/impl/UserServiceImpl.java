package vn.iotstar.service.impl;

import java.sql.Date;
import java.sql.Timestamp;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.util.SendMailUtil;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassWord()) && user.isActive()) {
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (userDao.checkExistUsername(username)) {
            return false;
        }
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        User user = new User(email, username, fullname, password, null, 3, phone, date);
        userDao.insert(user);

        // Sinh và gửi OTP
        String otp = SendMailUtil.generateOTP();
        Timestamp expire = new Timestamp(System.currentTimeMillis() + 5 * 60 * 1000); // hết hạn sau 5 phút
        userDao.updateOtp(username, otp, expire);

        String content = "<h3>Xác thực tài khoản</h3>"
                + "<p>Mã OTP của bạn là: <b>" + otp + "</b></p>"
                + "<p>Mã có hiệu lực trong 5 phút.</p>";
        SendMailUtil.sendMail(email, "Xác thực tài khoản đăng ký", content);

        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean verifyOtp(String username, String otp) {
        User user = userDao.get(username);
        if (user == null || user.getOtp() == null) return false;
        if (!user.getOtp().equals(otp)) return false;
        if (user.getOtpExpire() != null && user.getOtpExpire().before(new Timestamp(System.currentTimeMillis()))) {
            return false; // hết hạn
        }
        userDao.activateAccount(username);
        return true;
    }

    @Override
    public boolean sendForgotPasswordOtp(String email) {
        User user = userDao.getByEmail(email);
        if (user == null) return false;

        String otp = SendMailUtil.generateOTP();
        Timestamp expire = new Timestamp(System.currentTimeMillis() + 5 * 60 * 1000);
        userDao.updateOtp(user.getUserName(), otp, expire);

        String content = "<h3>Đặt lại mật khẩu</h3>"
                + "<p>Mã OTP của bạn là: <b>" + otp + "</b></p>"
                + "<p>Mã có hiệu lực trong 5 phút.</p>";
        SendMailUtil.sendMail(email, "Yêu cầu đặt lại mật khẩu", content);
        return true;
    }

    @Override
    public boolean resetPassword(String email, String otp, String newPassword) {
        User user = userDao.getByEmail(email);
        if (user == null || user.getOtp() == null) return false;
        if (!user.getOtp().equals(otp)) return false;
        if (user.getOtpExpire() != null && user.getOtpExpire().before(new Timestamp(System.currentTimeMillis()))) {
            return false;
        }
        userDao.updatePassword(user.getUserName(), newPassword);
        return true;
    }
}