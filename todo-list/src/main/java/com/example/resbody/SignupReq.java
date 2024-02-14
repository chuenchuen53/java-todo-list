package com.example.resbody;

public class SignupReq {
    private String username;
    private String password;
    private String confirmPassword;

    public SignupReq() {
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }

    public String getConfirmPassword() {
        return this.confirmPassword;
    }
}
