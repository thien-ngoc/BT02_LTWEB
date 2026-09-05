package vn.iotstar.dao;

import vn.iotstar.model.User;

public interface UserDao {
    User get(String username);
    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    void updateOtp(String username, String otp, java.sql.Timestamp expire);
    void activateAccount(String username);
    User getByEmail(String email);
    void updatePassword(String username, String newPassword);
}