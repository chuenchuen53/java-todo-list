package org.example.resbody;

public class LoginReq {
    private String username;
    private String password;

    public LoginReq() {
    }

    public LoginReq(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }
}
