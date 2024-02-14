package com.example.todolist.mapper;

import com.example.todolist.entity.Todo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface TodoMapper {
    @Select("SELECT id, description, completed FROM todos WHERE user_id = #{userId}")
    List<Todo> listTodos(@Param("userId") int userId);

    @Insert("INSERT INTO todos(user_id, description) VALUES (#{userId}, #{description})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertTodo(Todo todo);

    int updateTodo(Todo todo);

    @Delete("DELETE FROM todos WHERE id = #{todoId} AND user_id = #{userId}")
    int deleteTodo(@Param("todoId") int todoId, @Param("userId") int userId);
}
