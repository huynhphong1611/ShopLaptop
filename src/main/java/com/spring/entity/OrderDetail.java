/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.entity;

/**
 *
 * @author FR
 */
public class OrderDetail {

    private int DetailID;
    private int Quantity;
    private int OrderID;
    private int ProductID;
    
    public int getDetailID() {
        return DetailID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public int getOrderID() {
        return OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setDetailID(int DetailID) {
        this.DetailID = DetailID;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }
    
    
    
}
