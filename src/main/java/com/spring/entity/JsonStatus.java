package com.spring.entity;

public class JsonStatus {

    private boolean Status;
    private String Message;

    public JsonStatus() {
    }

    public JsonStatus(boolean Status, String Message) {
        this.Status = Status;
        this.Message = Message;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

}
