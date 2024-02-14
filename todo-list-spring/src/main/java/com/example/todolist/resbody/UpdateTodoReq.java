package com.example.todolist.resbody;

import lombok.Data;

@Data
public class UpdateTodoReq {
    private Integer id;
    private String description;
    private Boolean completed;
}
