package org.example.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.Exception.IncorrectUsernameOrPasswordException;
import org.example.resbody.LoginReq;
import org.example.service.api.UserService;
import org.example.service.impl.UserServiceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

public class Login extends HttpServlet {
    private final UserService userServiceImpl = UserServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            ObjectMapper objectMapper = new ObjectMapper();

            HashMap<String, Object> result = new HashMap<>();
            if (session == null || session.getAttribute("userId") == null) {
                result.put("isLogin", false);
            } else {
                result.put("isLogin", true);
            }

            String json = objectMapper.writeValueAsString(result);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        } catch (IOException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            BufferedReader reader = req.getReader();
            ObjectMapper objectMapper = new ObjectMapper();
            LoginReq loginReq = objectMapper.readValue(reader, LoginReq.class);
            String username = loginReq.getUsername();
            String password = loginReq.getPassword();

            HashMap<String, Boolean> result = new HashMap<>();
            try {
                int userId = userServiceImpl.login(username, password);
                req.getSession().setAttribute("userId", userId);
                result.put("success", true);
            } catch (IncorrectUsernameOrPasswordException e) {
                result.put("success", false);
            }

            String json = objectMapper.writeValueAsString(result);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        } catch (SQLException | IOException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}