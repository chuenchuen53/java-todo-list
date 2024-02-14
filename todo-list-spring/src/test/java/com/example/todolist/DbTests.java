package com.example.todolist;

import com.example.todolist.bean.TodoBean;
import com.example.todolist.bean.UserBean;
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
        UserBean user = userMapper.selectUser("t1");
        System.out.println(user);
    }

    @Test
    public void insertUser() {
        userMapper.insertUser("mytestac", "mypassword");
    }

    @Test
    public void getTodos() {
        List<TodoBean> todos = todoMapper.getTodos(3);
        System.out.println("todos = " + todos);
    }

    @Test
    public void insertTodo() {
        TodoBean todo = new TodoBean();
        todo.setUserId(3);
        todo.setDescription("test insert todo");
        int row = todoMapper.insertTodo(todo);
        System.out.println("row = " + row);
        System.out.println("todo = " + todo);
    }

    @Test
    public void updateTodoStatus() {
        int row = todoMapper.updateTodoStatus(65, 3, true);
        System.out.println("row = " + row);
    }

    @Test
    public void updateTodoDescription() {
        int row = todoMapper.updateTodoDescription(65, 3, "test update");
        System.out.println("row = " + row);
    }

    @Test
    public void deleteTodo() {
        int row = todoMapper.deleteTodo(65, 3);
        System.out.println("row = " + row);
    }
}
