/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.dao;

import com.spring.dbcontext.DbContext;
import com.spring.entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author FR
 */
public class AdminDAO {
    public Customer GetByUsername(String username) {
        Connection conn = DbContext.getConnection();
        try {
            String query = " SELECT * FROM dbo.ADMIN a WHERE a.UserName=?";
            PreparedStatement st = conn.prepareStatement(query);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            Customer customer = new Customer();
            while (rs.next()) {
                customer.setCustomerID(rs.getInt("UserID"));
                customer.setCustomerUsername(username);
                customer.setCustomerName(rs.getString("Username"));
            }

            return customer;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public int Login(String username, String password) {

        Connection conn = DbContext.getConnection();
        try {
            String query = "SELECT count(c.UserUsername) AS 'count' FROM dbo.ADMIN c\n"
                    + "	WHERE c.UserUsername=? AND c.UserPassword=?";
            PreparedStatement st = conn.prepareStatement(query);

            st.setString(1, username);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt("count");
            }

            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    
}
