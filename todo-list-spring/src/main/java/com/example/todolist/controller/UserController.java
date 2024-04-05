package com.example.todolist.controller;

import com.example.todolist.exception.IncorrectUsernameOrPasswordException;
import com.example.todolist.exception.RegisteredUsernameException;
import com.example.todolist.resbody.LoginReq;
import com.example.todolist.resbody.SignupReq;
import com.example.todolist.service.api.UserService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("api")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("login")
    public Map<String, Boolean> isLogin(HttpSession session) {
        Object userId = session.getAttribute("userId");
        return Map.of("isLogin", userId != null);
    }

    @PostMapping("login")
    public Map<String, Boolean> login(@Validated @RequestBody LoginReq loginReq, HttpSession session) {
        String username = loginReq.getUsername();
        String password = loginReq.getPassword();

        HashMap<String, Boolean> result = new HashMap<>();
        try {
            int userId = userService.login(username, password);
            session.setAttribute("userId", userId);
            result.put("success", true);
        } catch (IncorrectUsernameOrPasswordException e) {
            result.put("success", false);
        }

        return result;
    }

    @PostMapping("logout")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void logout(HttpSession session) {
        session.invalidate();
    }

    @PostMapping("signup")
    public Map<String, String> signup(@Validated @RequestBody SignupReq signupReq) {
        String username = signupReq.getUsername();
        String password = signupReq.getPassword();

        Map<String, String> result = new HashMap<>();
        try {
            userService.signup(username, password);
            result.put("message", "success");
        } catch (RegisteredUsernameException e) {
            result.put("message", "Username is already registered");
        }

        return result;
    }
}
