package com.example.todolist.resbody;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class LoginReq {
    @NotNull
    private String username;
    @NotNull
    private String password;
}
