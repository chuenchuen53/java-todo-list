package org.example.resbody;

public class InsertTodoReq {
    private String description;

    public InsertTodoReq() {
    }

    public InsertTodoReq(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
