package com.example.service.impl;

import com.example.entity.User;
import com.example.dao.impl.UserDaoImpl;
import com.example.exception.ConfirmPasswordException;
import com.example.exception.IncorrectInputFormatException;
import com.example.exception.IncorrectUsernameOrPasswordException;
import com.example.exception.RegisteredUsernameException;
import com.example.dao.api.UserDao;
import com.example.service.api.UserService;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.SQLException;
import java.util.Optional;

public class UserServiceImpl implements UserService {
    private final static UserDao userDao = new UserDaoImpl();
    private final static UserServiceImpl userServiceImpl = new UserServiceImpl();

    public static UserService getInstance() {
        return userServiceImpl;
    }

    @Override
    public int login(String username, String password) throws IncorrectUsernameOrPasswordException, SQLException {
        Optional<User> optionalUserBean = userDao.selectUser(username);
        if (optionalUserBean.isEmpty()) {
            throw new IncorrectUsernameOrPasswordException();
        }
        User user = optionalUserBean.get();
        String encodedPassword = user.getPassword();
        if (!BCrypt.checkpw(password, encodedPassword)) {
            throw new IncorrectUsernameOrPasswordException();
        }
        return user.getId();
    }

    @Override
    public void signup(String username, String password, String confirmPassword) throws ConfirmPasswordException,
            RegisteredUsernameException, IncorrectInputFormatException, SQLException {
        String alphanumericRegex = "^[a-zA-Z0-9]+$";
        if (username == null || username.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty() ||
                !username.matches(alphanumericRegex) ||
                !password.matches(alphanumericRegex) ||
                !confirmPassword.matches(alphanumericRegex)) {
            throw new IncorrectInputFormatException();
        }
        if (!password.equals(confirmPassword)) {
            throw new ConfirmPasswordException();
        }
        if (userDao.selectUser(username).isPresent()) {
            throw new RegisteredUsernameException();
        }
        String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        userDao.insertUser(username, encodedPassword);
    }
}
