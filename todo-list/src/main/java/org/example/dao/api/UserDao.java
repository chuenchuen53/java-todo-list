package org.example.dao.api;

import org.example.bean.UserBean;

import java.sql.SQLException;
import java.util.Optional;

public interface UserDao {
    Optional<UserBean> selectUser(String username) throws SQLException;

    void insertUser(String username, String encodedPassword) throws SQLException;
}