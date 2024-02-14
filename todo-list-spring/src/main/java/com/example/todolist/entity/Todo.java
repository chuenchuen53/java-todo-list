package com.example.todolist.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Todo {
    private Integer id;
    private Integer userId;
    private String description;
    private Boolean completed;
}
