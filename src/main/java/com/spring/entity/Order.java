package com.spring.entity;

import java.math.BigDecimal;
import java.sql.Date;

public class Order {

    private int OrderID;
    private Date OrderDate;
    private BigDecimal Total;
    private String CustomerName;
    private String CustomerPhone;
    private String CustomerAddress;
    private int OrderStatusID;
    private int CustomerID;
    private String StatusName;

    public Order() {
    }

    public Order(int OrderID, Date OrderDate, BigDecimal Total, String CustomerName, String CustomerPhone, String CustomerAddress, int OrderStatusID, int CustomerID) {
        this.OrderID = OrderID;
        this.OrderDate = OrderDate;
        this.Total = Total;
        this.CustomerName = CustomerName;
        this.CustomerPhone = CustomerPhone;
        this.CustomerAddress = CustomerAddress;
        this.OrderStatusID = OrderStatusID;
        this.CustomerID = CustomerID;
    }

    public Order(int OrderID, Date OrderDate, BigDecimal Total, String CustomerName, String CustomerPhone, String CustomerAddress, int OrderStatusID, int CustomerID, String StatusName) {
        this.OrderID = OrderID;
        this.OrderDate = OrderDate;
        this.Total = Total;
        this.CustomerName = CustomerName;
        this.CustomerPhone = CustomerPhone;
        this.CustomerAddress = CustomerAddress;
        this.OrderStatusID = OrderStatusID;
        this.CustomerID = CustomerID;
        this.StatusName = StatusName;
    }

    public int getOrderID() {
        return OrderID;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public BigDecimal getTotal() {
        return Total;
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

    public int getOrderStatusID() {
        return OrderStatusID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public void setTotal(BigDecimal Total) {
        this.Total = Total;
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

    public void setOrderStatusID(int OrderStatusID) {
        this.OrderStatusID = OrderStatusID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getStatusName() {
        return StatusName;
    }

    public void setStatusName(String StatusName) {
        this.StatusName = StatusName;
    }

}
