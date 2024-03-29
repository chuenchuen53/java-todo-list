package com.example.servlet;

import com.example.exception.ConfirmPasswordException;
import com.example.exception.IncorrectInputFormatException;
import com.example.exception.RegisteredUsernameException;
import com.example.resbody.SignupReq;
import com.example.service.api.UserService;
import com.example.service.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

public class Signup extends HttpServlet {
    private static final UserService userServiceImpl = UserServiceImpl.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            BufferedReader reader = req.getReader();
            ObjectMapper objectMapper = new ObjectMapper();
            SignupReq signupReq = objectMapper.readValue(reader, SignupReq.class);

            String username = signupReq.getUsername();
            String password = signupReq.getPassword();
            String confirmPassword = signupReq.getConfirmPassword();

            HashMap<String, String> result = new HashMap<>();
            try {
                userServiceImpl.signup(username, password, confirmPassword);
                result.put("message", "success");
            } catch (RegisteredUsernameException e) {
                result.put("message", "Username is already registered");
            }
            String json = objectMapper.writeValueAsString(result);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        } catch (IncorrectInputFormatException | ConfirmPasswordException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } catch (SQLException | IOException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
