package com.example.service.api;

import com.example.exception.ConfirmPasswordException;
import com.example.exception.IncorrectInputFormatException;
import com.example.exception.IncorrectUsernameOrPasswordException;
import com.example.exception.RegisteredUsernameException;

import java.sql.SQLException;

public interface UserService {
    int login(String username, String password) throws IncorrectUsernameOrPasswordException, SQLException;

    void signup(String username, String password, String confirmPassword) throws ConfirmPasswordException,
            RegisteredUsernameException, IncorrectInputFormatException, SQLException;
}
