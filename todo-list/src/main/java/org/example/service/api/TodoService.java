package org.example.service.api;

import org.example.bean.TodoBean;

import java.sql.SQLException;
import java.util.List;

public interface TodoService {
    List<TodoBean> getTodos(int userId) throws SQLException;
    
    TodoBean insertTodo(int userId, String description) throws SQLException;

    int updateTodoStatus(int todoId, int userId, boolean isCompleted) throws SQLException;

    int updateTodoDescription(int todoId, int userId, String description) throws SQLException;

    int deleteTodo(int todoId, int userId) throws SQLException;
}
