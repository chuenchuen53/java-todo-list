package org.example.resbody;

public class SignupReq {
    private String username;
    private String password;
    private String confirmPassword;

    public SignupReq() {
    }

    public SignupReq(String username, String password, String confirmPassword) {
        this.username = username;
        this.password = password;
        this.confirmPassword = confirmPassword;
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
