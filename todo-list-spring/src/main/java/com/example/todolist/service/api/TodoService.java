package com.example.todolist.service.api;


import com.example.todolist.entity.Todo;

import java.util.List;

public interface TodoService {
    List<Todo> listTodos(int userId);

    Todo insertTodo(int userId, String description);

    int updateTodoStatus(int todoId, int userId, boolean completed);

    int updateTodoDescription(int todoId, int userId, String description);

    int deleteTodo(int todoId, int userId);
}
