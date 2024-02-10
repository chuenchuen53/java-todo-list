package org.example.Exception;

public class ConfirmPasswordException extends Exception {
    public ConfirmPasswordException() {
        super("Confirm password is not the same as new password.");
    }
}
