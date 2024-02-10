package org.example.Exception;

public class IncorrectUsernameOrPasswordException extends Exception {
    public IncorrectUsernameOrPasswordException() {
        super("Incorrect username or password");
    }
}
