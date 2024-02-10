package org.example.service.api;

import org.example.Exception.ConfirmPasswordException;
import org.example.Exception.IncorrectInputFormatException;
import org.example.Exception.IncorrectUsernameOrPasswordException;
import org.example.Exception.RegisteredUsernameException;

import java.sql.SQLException;

public interface UserService {
    int login(String username, String password) throws IncorrectUsernameOrPasswordException, SQLException;

    void signup(String username, String password, String confirmPassword) throws ConfirmPasswordException,
            RegisteredUsernameException, IncorrectInputFormatException, SQLException;
}
