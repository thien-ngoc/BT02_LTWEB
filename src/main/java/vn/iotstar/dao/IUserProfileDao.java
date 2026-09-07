package vn.iotstar.dao;

import vn.iotstar.model.UserEntity;

public interface IUserProfileDao {
    UserEntity findByUsername(String username);
    void update(UserEntity user);
}