package com.example.todolist.service.api;

import com.example.todolist.exception.IncorrectUsernameOrPasswordException;
import com.example.todolist.exception.RegisteredUsernameException;

public interface UserService {
    int login(String username, String password) throws IncorrectUsernameOrPasswordException;

    void signup(String username, String password) throws RegisteredUsernameException;
}
