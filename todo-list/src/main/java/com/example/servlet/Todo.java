package com.example.servlet;

import com.example.resbody.InsertTodoReq;
import com.example.resbody.UpdateTodoReq;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.service.api.TodoService;
import com.example.service.impl.TodoServiceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Todo extends HttpServlet {
    private final static TodoService todoService = TodoServiceImpl.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int userId = (int) req.getSession().getAttribute("userId");
            List<com.example.entity.Todo> todos = todoService.getTodos(userId);
            ObjectMapper mapper = new ObjectMapper();
            mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
            String json = mapper.writeValueAsString(todos);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        } catch (SQLException | IOException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int userId = (int) req.getSession().getAttribute("userId");
            BufferedReader reader = req.getReader();
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
            InsertTodoReq insertTodoReq = objectMapper.readValue(reader, InsertTodoReq.class);
            String description = insertTodoReq.getDescription();
            if (description == null) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            com.example.entity.Todo todo = todoService.insertTodo(userId, description);
            String json = objectMapper.writeValueAsString(todo);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        } catch (SQLException | IOException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int userId = (int) req.getSession().getAttribute("userId");
            BufferedReader reader = req.getReader();
            ObjectMapper objectMapper = new ObjectMapper();
            UpdateTodoReq updateTodoReq = objectMapper.readValue(reader, UpdateTodoReq.class);
            int todoId = updateTodoReq.getId();
            String description = updateTodoReq.getDescription();
            Boolean completed = updateTodoReq.getCompleted();
            if (description == null && completed == null) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            int result = description == null ?
                    todoService.updateTodoStatus(todoId, userId, completed) :
                    todoService.updateTodoDescription(todoId, userId, description);
            if (result != 1) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } catch (SQLException | IOException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int userId = (int) req.getSession().getAttribute("userId");
            int todoId = Integer.parseInt(req.getParameter("todoId"));
            int count = todoService.deleteTodo(todoId, userId);
            if (count != 1) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } catch (SQLException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
