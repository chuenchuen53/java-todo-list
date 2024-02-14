package com.example.dao.api;

import com.example.entity.User;

import java.sql.SQLException;
import java.util.Optional;

public interface UserDao {
    Optional<User> selectUser(String username) throws SQLException;

    void insertUser(String username, String encodedPassword) throws SQLException;
}