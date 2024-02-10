package org.example.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.bean.TodoBean;
import org.example.resbody.InsertTodoReq;
import org.example.resbody.UpdateTodoReq;
import org.example.service.api.TodoService;
import org.example.service.impl.TodoServiceImpl;

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
            List<TodoBean> todos = todoService.getTodos(userId);
            ObjectMapper mapper = new ObjectMapper();
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
            InsertTodoReq insertTodoReq = objectMapper.readValue(reader, InsertTodoReq.class);
            String description = insertTodoReq.getDescription();
            if (description == null) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            TodoBean todo = todoService.insertTodo(userId, description);
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
            Boolean isCompleted = updateTodoReq.getIsCompleted();
            if (description == null && isCompleted == null) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            int result = description == null ?
                    todoService.updateTodoStatus(todoId, userId, isCompleted) :
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
