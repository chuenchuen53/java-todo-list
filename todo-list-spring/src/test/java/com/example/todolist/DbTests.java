package com.example.todolist;

import com.example.todolist.entity.Todo;
import com.example.todolist.entity.User;
import com.example.todolist.mapper.TodoMapper;
import com.example.todolist.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class DbTests {
    @Autowired
    UserMapper userMapper;

    @Autowired
    TodoMapper todoMapper;

    @Test
    public void selectUser() {
        User user = userMapper.selectUser("t1");
        System.out.println(user);
    }

    @Test
    public void insertUser() {
        userMapper.insertUser("mytestac", "mypassword");
    }

    @Test
    public void getTodos() {
        List<Todo> todos = todoMapper.listTodos(3);
        System.out.println("todos = " + todos);
    }

    @Test
    public void insertTodo() {
        Todo todo = new Todo();
        todo.setUserId(3);
        todo.setDescription("test insert todo");
        int row = todoMapper.insertTodo(todo);
        System.out.println("row = " + row);
        System.out.println("todo = " + todo);
    }

    @Test
    public void updateTodoStatus() {
        Todo todo = Todo.builder()
                .id(7)
                .userId(1)
                .completed(true)
                .build();
        int row = todoMapper.updateTodo(todo);
        System.out.println("row = " + row);
    }

    @Test
    public void updateTodoDescription() {
        Todo todo = Todo.builder()
                .id(7)
                .userId(1)
                .description("test update")
                .build();
        int row = todoMapper.updateTodo(todo);
        System.out.println("row = " + row);
    }

    @Test
    public void deleteTodo() {
        int row = todoMapper.deleteTodo(65, 3);
        System.out.println("row = " + row);
    }
}
