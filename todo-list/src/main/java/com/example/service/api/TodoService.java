package com.example.service.api;

import com.example.entity.Todo;

import java.sql.SQLException;
import java.util.List;

public interface TodoService {
    List<Todo> getTodos(int userId) throws SQLException;
    
    Todo insertTodo(int userId, String description) throws SQLException;

    int updateTodoStatus(int todoId, int userId, boolean completed) throws SQLException;

    int updateTodoDescription(int todoId, int userId, String description) throws SQLException;

    int deleteTodo(int todoId, int userId) throws SQLException;
}
