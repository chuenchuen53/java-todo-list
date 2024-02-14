package com.example.todolist.resbody;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class InsertTodoReq {
    @NotNull
    private String description;

    public InsertTodoReq() {
    }
}
