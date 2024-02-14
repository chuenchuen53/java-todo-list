package com.example.todolist.mapper;

import com.example.todolist.bean.UserBean;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    @Select("SELECT id, username, password FROM users WHERE username = #{username}")
    UserBean selectUser(@Param("username") String username);

    @Select("INSERT INTO users(username, password) VALUES(#{username}, #{encodedPassword})")
    void insertUser(@Param("username") String username, @Param("encodedPassword") String encodedPassword);
}
