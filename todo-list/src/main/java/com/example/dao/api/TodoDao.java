package com.example.dao.api;

import com.example.entity.Todo;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public interface TodoDao {
    List<Todo> getTodos(int userId) throws SQLException;

    Todo getTodosById(int todoId, int userId) throws SQLException;

    BigInteger insertTodo(int userId, String description) throws SQLException;

    int updateTodoStatus(int todoId, int userId, boolean completed) throws SQLException;

    int updateTodoDescription(int todoId, int userId, String description) throws SQLException;

    int deleteTodo(int todoId, int userId) throws SQLException;
}
