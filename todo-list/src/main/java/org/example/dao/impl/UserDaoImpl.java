package org.example.dao.impl;

import org.example.bean.UserBean;
import org.example.dao.BaseDao;
import org.example.dao.api.UserDao;

import java.sql.SQLException;
import java.util.Optional;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public Optional<UserBean> selectUser(String username) throws SQLException {
        String sql = "SELECT id, username, password FROM users WHERE username = ?";
        UserBean userBean = executeQueryOne(UserBean.class, sql, username);
        return Optional.ofNullable(userBean);
    }

    @Override
    public void insertUser(String username, String encodedPassword) throws SQLException {
        String sql = "INSERT INTO users(username, password) VALUES(?, ?)";
        executeUpdate(sql, username, encodedPassword);
    }
}
