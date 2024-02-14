package com.example.todolist.service.impl;

import com.example.todolist.entity.Todo;
import com.example.todolist.mapper.TodoMapper;
import com.example.todolist.service.api.TodoService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoServiceImpl implements TodoService {
    private final TodoMapper todoMapper;

    public TodoServiceImpl(TodoMapper todoMapper) {
        this.todoMapper = todoMapper;
    }

    @Override
    public List<Todo> listTodos(int userId) {
        return todoMapper.listTodos(userId);
    }

    @Override
    public Todo insertTodo(int userId, String description) {
        Todo todo = new Todo();
        todo.setDescription(description);
        todo.setUserId(userId);
        todoMapper.insertTodo(todo);
        return todo;
    }

    @Override
    public int updateTodoStatus(int todoId, int userId, boolean completed) {
        Todo todo = Todo.builder()
                .id(todoId)
                .userId(userId)
                .completed(completed)
                .build();
        return todoMapper.updateTodo(todo);
    }

    @Override
    public int updateTodoDescription(int todoId, int userId, String description) {
        Todo todo = Todo.builder()
                .id(todoId)
                .userId(userId)
                .description(description)
                .build();
        return todoMapper.updateTodo(todo);
    }

    @Override
    public int deleteTodo(int todoId, int userId) {
        return todoMapper.deleteTodo(todoId, userId);
    }
}
