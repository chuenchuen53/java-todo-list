package com.example.todolist.service.api;


import com.example.todolist.bean.TodoBean;

import java.util.List;

public interface TodoService {
    List<TodoBean> getTodos(int userId);

    TodoBean insertTodo(int userId, String description);

    int updateTodoStatus(int todoId, int userId, boolean isCompleted);

    int updateTodoDescription(int todoId, int userId, String description);

    int deleteTodo(int todoId, int userId);
}
