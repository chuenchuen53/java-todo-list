package com.example.todolist.service.impl;

import com.example.todolist.bean.UserBean;
import com.example.todolist.exception.IncorrectUsernameOrPasswordException;
import com.example.todolist.exception.RegisteredUsernameException;
import com.example.todolist.mapper.UserMapper;
import com.example.todolist.service.api.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public int login(String username, String password) throws IncorrectUsernameOrPasswordException {
        UserBean userBean = userMapper.selectUser(username);
        if (userBean == null) {
            throw new IncorrectUsernameOrPasswordException();
        }
        String encodedPassword = userBean.getPassword();
        if (!BCrypt.checkpw(password, encodedPassword)) {
            throw new IncorrectUsernameOrPasswordException();
        }
        return userBean.getId();
    }

    @Override
    public void signup(String username, String password, String confirmPassword) throws RegisteredUsernameException {
        if (userMapper.selectUser(username) != null) {
            throw new RegisteredUsernameException();
        }
        String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        userMapper.insertUser(username, encodedPassword);
    }
}
