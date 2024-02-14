package com.example.dao.impl;

import com.example.entity.User;
import com.example.dao.BaseDao;
import com.example.dao.api.UserDao;

import java.sql.SQLException;
import java.util.Optional;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public Optional<User> selectUser(String username) throws SQLException {
        String sql = "SELECT id, username, password FROM users WHERE username = ?";
        User user = executeQueryOne(User.class, sql, username);
        return Optional.ofNullable(user);
    }

    @Override
    public void insertUser(String username, String encodedPassword) throws SQLException {
        String sql = "INSERT INTO users(username, password) VALUES(?, ?)";
        executeUpdate(sql, username, encodedPassword);
    }
}
