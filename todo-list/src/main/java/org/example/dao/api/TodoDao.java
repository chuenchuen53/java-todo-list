package org.example.dao.api;

import org.example.bean.TodoBean;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public interface TodoDao {
    List<TodoBean> getTodos(int userId) throws SQLException;

    TodoBean getTodosById(int todoId, int userId) throws SQLException;

    BigInteger insertTodo(int userId, String description) throws SQLException;

    int updateTodoStatus(int todoId, int userId, boolean isCompleted) throws SQLException;

    int updateTodoDescription(int todoId, int userId, String description) throws SQLException;

    int deleteTodo(int todoId, int userId) throws SQLException;
}
