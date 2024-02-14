package com.example.todolist.bean;

import lombok.Data;

@Data
public class TodoBean {
    private Integer id;
    private Integer userId;
    private String description;
    private Boolean isCompleted;
}
