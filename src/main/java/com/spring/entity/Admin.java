/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.entity;

import java.sql.Date;

/**
 *
 * @author FR
 */
public class Admin {

    private int UserID;
    private String UserUsername;
    private String UserPassword;
    private String Username;
    private Date CreatedDate;

    public int getUserID() {
        return UserID;
    }

    public String getUserUsername() {
        return UserUsername;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public String getUsername() {
        return Username;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public void setUserUsername(String UserUsername) {
        this.UserUsername = UserUsername;
    }

    public void setUserPassword(String UserPassword) {
        this.UserPassword = UserPassword;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

}
