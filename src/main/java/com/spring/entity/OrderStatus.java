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
public class OrderStatus {

    private int StatusID;
    private String StatusName;
    private Date CreatedDate;

    public OrderStatus(int id, String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getStatusID() {
        return StatusID;
    }

    public String getStatusName() {
        return StatusName;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    public void setStatusName(String StatusName) {
        this.StatusName = StatusName;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

}
