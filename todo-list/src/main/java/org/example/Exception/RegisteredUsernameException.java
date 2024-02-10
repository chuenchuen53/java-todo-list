package org.example.Exception;

public class RegisteredUsernameException extends Exception {
    public RegisteredUsernameException() {
        super("Username have signup.");
    }
}
