package com.example.todolist.service.impl;

import com.example.todolist.bean.TodoBean;
import com.example.todolist.mapper.TodoMapper;
import com.example.todolist.service.api.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoServiceImpl implements TodoService {
    @Autowired
    private TodoMapper todoMapper;

    @Override
    public List<TodoBean> getTodos(int userId) {
        return todoMapper.getTodos(userId);
    }

    @Override
    public TodoBean insertTodo(int userId, String description) {
        TodoBean todo = new TodoBean();
        todo.setDescription(description);
        todo.setUserId(userId);
        int id = todoMapper.insertTodo(todo);
        return todo;
    }

    @Override
    public int updateTodoStatus(int todoId, int userId, boolean isCompleted) {
        return todoMapper.updateTodoStatus(todoId, userId, isCompleted);
    }

    @Override
    public int updateTodoDescription(int todoId, int userId, String description) {
        return todoMapper.updateTodoDescription(todoId, userId, description);
    }

    @Override
    public int deleteTodo(int todoId, int userId) {
        return todoMapper.deleteTodo(todoId, userId);
    }
}
