package com.example.dao.impl;

import com.example.entity.Todo;
import com.example.dao.BaseDao;
import com.example.dao.api.TodoDao;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public class TodoDaoImpl extends BaseDao implements TodoDao {
    @Override
    public List<Todo> getTodos(int userId) throws SQLException {
        String sql = "SELECT id, description, completed FROM todos WHERE user_id = ?";
        return executeQueryList(Todo.class, sql, userId);
    }

    @Override
    public Todo getTodosById(int todoId, int userId) throws SQLException {
        String sql = "SELECT id, description, completed FROM todos WHERE id = ? and user_id = ?";
        return executeQueryOne(Todo.class, sql, todoId, userId);
    }

    @Override
    public BigInteger insertTodo(int userId, String description) throws SQLException {
        String insertSql = "INSERT INTO todos(user_id, description) VALUES (?, ?)";
        return executeInsert(insertSql, userId, description);
    }

    @Override
    public int updateTodoStatus(int todoId, int userId, boolean completed) throws SQLException {
        String sql = "UPDATE todos SET completed = ? WHERE id = ? AND user_id = ?";
        return executeUpdate(sql, completed, todoId, userId);
    }

    @Override
    public int updateTodoDescription(int todoId, int userId, String description) throws SQLException {
        String sql = "UPDATE todos SET description = ? WHERE id = ? AND user_id = ?";
        return executeUpdate(sql, description, todoId, userId);
    }

    @Override
    public int deleteTodo(int todoId, int userId) throws SQLException {
        String sql = "DELETE FROM todos WHERE id = ? AND user_id = ?";
        return executeUpdate(sql, todoId, userId);
    }
}
