package com.spring.entity;

import java.sql.Date;

public class Customer {

    private int CustomerID;
    private String CustomerUsername;
    private String CustomerPassword;
    private String CustomerEmail;
    private String CustomerName;
    private String CustomerPhone;
    private String CustomerAddress;
    private Date CreatedDate;

    public int getCustomerID() {
        return CustomerID;
    }

    public String getCustomerUsername() {
        return CustomerUsername;
    }

    public String getCustomerPassword() {
        return CustomerPassword;
    }

    public String getCustomerEmail() {
        return CustomerEmail;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public String getCustomerPhone() {
        return CustomerPhone;
    }

    public String getCustomerAddress() {
        return CustomerAddress;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public void setCustomerUsername(String CustomerUsername) {
        this.CustomerUsername = CustomerUsername;
    }

    public void setCustomerPassword(String CustomerPassword) {
        this.CustomerPassword = CustomerPassword;
    }

    public void setCustomerEmail(String CustomeEmail) {
        this.CustomerEmail = CustomeEmail;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public void setCustomerPhone(String CustomerPhone) {
        this.CustomerPhone = CustomerPhone;
    }

    public void setCustomerAddress(String CustomerAddress) {
        this.CustomerAddress = CustomerAddress;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

}
