package com.example.todolist.mapper;

import com.example.todolist.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    @Select("SELECT id, username, password FROM users WHERE username = #{username}")
    User selectUser(@Param("username") String username);

    @Insert("INSERT INTO users(username, password) VALUES(#{username}, #{encodedPassword})")
    void insertUser(@Param("username") String username, @Param("encodedPassword") String encodedPassword);
}
