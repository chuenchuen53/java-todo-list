package org.example.service.impl;

import org.example.bean.TodoBean;
import org.example.dao.api.TodoDao;
import org.example.dao.impl.TodoDaoImpl;
import org.example.service.api.TodoService;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public class TodoServiceImpl implements TodoService {
    private final static TodoDao todoDao = new TodoDaoImpl();
    private final static TodoService instance = new TodoServiceImpl();

    public static TodoService getInstance() {
        return instance;
    }

    @Override
    public List<TodoBean> getTodos(int userId) throws SQLException {
        return todoDao.getTodos(userId);
    }

    @Override
    public TodoBean insertTodo(int userId, String description) throws SQLException {
        BigInteger id = todoDao.insertTodo(userId, description);
        return todoDao.getTodosById(id.intValue(), userId);
    }

    @Override
    public int updateTodoStatus(int todoId, int userId, boolean isCompleted) throws SQLException {
        return todoDao.updateTodoStatus(todoId, userId, isCompleted);
    }

    @Override
    public int updateTodoDescription(int todoId, int userId, String description) throws SQLException {
        return todoDao.updateTodoDescription(todoId, userId, description);
    }

    @Override
    public int deleteTodo(int todoId, int userId) throws SQLException {
        return todoDao.deleteTodo(todoId, userId);
    }
}
