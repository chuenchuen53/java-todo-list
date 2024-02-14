package com.example.todolist.mapper;

import com.example.todolist.bean.TodoBean;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface TodoMapper {
    @Select("SELECT id, description, is_completed FROM todos WHERE user_id = #{userId}")
    List<TodoBean> getTodos(@Param("userId") int userId);

    @Insert("INSERT INTO todos(user_id, description) VALUES (#{userId}, #{description})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertTodo(TodoBean todo);

    @Update("UPDATE todos SET is_completed = #{isCompleted} WHERE id = #{todoId} AND user_id = #{userId}")
    int updateTodoStatus(@Param("todoId") int todoId, @Param("userId") int userId,
                         @Param("isCompleted") boolean isCompleted);

    @Update("UPDATE todos SET description = #{description} WHERE id = #{todoId} AND user_id = #{userId}")
    int updateTodoDescription(@Param("todoId") int todoId, @Param("userId") int userId,
                              @Param("description") String description);

    @Delete("DELETE FROM todos WHERE id = #{todoId} AND user_id = #{userId}")
    int deleteTodo(@Param("todoId") int todoId, @Param("userId") int userId);
}
