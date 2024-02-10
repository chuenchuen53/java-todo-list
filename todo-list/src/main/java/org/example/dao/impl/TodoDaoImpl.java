package org.example.dao.impl;

import org.example.bean.TodoBean;
import org.example.dao.BaseDao;
import org.example.dao.api.TodoDao;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public class TodoDaoImpl extends BaseDao implements TodoDao {
    @Override
    public List<TodoBean> getTodos(int userId) throws SQLException {
        String sql = "SELECT id, description, is_completed FROM todos WHERE user_id = ?";
        return executeQueryList(TodoBean.class, sql, userId);
    }

    @Override
    public TodoBean getTodosById(int todoId, int userId) throws SQLException {
        String sql = "SELECT id, description, is_completed FROM todos WHERE id = ? and user_id = ?";
        return executeQueryOne(TodoBean.class, sql, todoId, userId);
    }

    @Override
    public BigInteger insertTodo(int userId, String description) throws SQLException {
        String insertSql = "INSERT INTO todos(user_id, description) VALUES (?, ?)";
        return executeInsert(insertSql, userId, description);
    }

    @Override
    public int updateTodoStatus(int todoId, int userId, boolean isCompleted) throws SQLException {
        String sql = "UPDATE todos SET is_completed = ? WHERE id = ? AND user_id = ?";
        return executeUpdate(sql, isCompleted ? 1 : 0, todoId, userId);
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
