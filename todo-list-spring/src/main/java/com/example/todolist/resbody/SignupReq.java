package com.example.todolist.resbody;

import com.example.todolist.util.FieldMatch;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
@FieldMatch(first = "password", second = "confirmPassword", message = "The password fields must match")
public class SignupReq {
    @Pattern(regexp = "^[a-zA-Z0-9]+$")
    private String username;

    @Pattern(regexp = "^[a-zA-Z0-9]+$")
    private String password;

    @Pattern(regexp = "^[a-zA-Z0-9]+$")
    private String confirmPassword;

    public SignupReq() {
    }
}
