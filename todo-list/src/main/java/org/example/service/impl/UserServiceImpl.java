package org.example.service.impl;

import org.example.Exception.ConfirmPasswordException;
import org.example.Exception.IncorrectInputFormatException;
import org.example.Exception.IncorrectUsernameOrPasswordException;
import org.example.Exception.RegisteredUsernameException;
import org.example.bean.UserBean;
import org.example.dao.api.UserDao;
import org.example.dao.impl.UserDaoImpl;
import org.example.service.api.UserService;
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
        Optional<UserBean> optionalUserBean = userDao.selectUser(username);
        if (optionalUserBean.isEmpty()) {
            throw new IncorrectUsernameOrPasswordException();
        }
        UserBean userBean = optionalUserBean.get();
        String encodedPassword = userBean.getPassword();
        if (!BCrypt.checkpw(password, encodedPassword)) {
            throw new IncorrectUsernameOrPasswordException();
        }
        return userBean.getId();
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
