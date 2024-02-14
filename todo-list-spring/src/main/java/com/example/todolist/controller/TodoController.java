package com.example.todolist.controller;

import com.example.todolist.entity.Todo;
import com.example.todolist.resbody.InsertTodoReq;
import com.example.todolist.resbody.UpdateTodoReq;
import com.example.todolist.service.api.TodoService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/todo")
public class TodoController {
    private final TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @GetMapping
    public List<Todo> getTodos(HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        return todoService.listTodos(userId);
    }

    @PostMapping
    public Todo insertTodo(@Validated @RequestBody InsertTodoReq insertTodoReq, HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        String description = insertTodoReq.getDescription();
        return todoService.insertTodo(userId, description);
    }

    @PutMapping
    public void updateTodo(@RequestBody UpdateTodoReq updateTodoReq, HttpServletResponse resp, HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        Integer todoId = updateTodoReq.getId();
        String description = updateTodoReq.getDescription();
        Boolean isCompleted = updateTodoReq.getCompleted();
        if (description == null && isCompleted == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        int result = description == null ?
                todoService.updateTodoStatus(todoId, userId, isCompleted) :
                todoService.updateTodoDescription(todoId, userId, description);
        if (result != 1) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @DeleteMapping
    public void deleteTodo(@RequestParam("todoId") int todoId, HttpServletResponse resp, HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        int count = todoService.deleteTodo(todoId, userId);
        if (count != 1) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } else {
            resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
    }
}
