package com.spring.dao;

import com.spring.common.CommonFunction;
import com.spring.dbcontext.DbContext;
import com.spring.entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO {

    public Customer GetByUsername(String username) {
        Connection conn = DbContext.getConnection();
        try {
            String query = " SELECT * FROM dbo.CUSTOMER c WHERE c.CustomerUsername=?";
            PreparedStatement st = conn.prepareStatement(query);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            Customer customer = new Customer();
            while (rs.next()) {
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setCustomerUsername(username);
                customer.setCustomerName(rs.getString("CustomerName"));
                customer.setCustomerAddress(rs.getString("CustomerAddress"));
                customer.setCustomerPhone(rs.getString("CustomerPhone"));
                customer.setCustomerEmail(rs.getString("CustomerEmail"));
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
            String query = "SELECT count(c.CustomerUsername) AS 'count' FROM dbo.CUSTOMER c\n"
                    + "	WHERE c.CustomerUsername=? AND c.CustomerPassword=?";
            PreparedStatement st = conn.prepareStatement(query);

            st.setString(1, username);
            st.setString(2, CommonFunction.StringToMD5(password));

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

    public int CheckUser(String username) {
        Connection conn = DbContext.getConnection();
        try {
            String query = "SELECT count(c.CustomerUsername) AS 'check' FROM dbo.CUSTOMER WHERE c.CustomerUsername=?";
            PreparedStatement st = conn.prepareStatement(query);

            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt("check");
            }
            return count;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int Signup(Customer model) {
        Connection conn = DbContext.getConnection();
        if(CheckUser(model.getCustomerUsername()) == 1){
            return -2;
        }
        try {
            String sql = "INSERT INTO CUSTOMER\n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, model.getCustomerUsername());
            statement.setString(2, CommonFunction.StringToMD5(model.getCustomerPassword()));
            statement.setString(3, model.getCustomerEmail());
            statement.setString(4, model.getCustomerName());
            statement.setString(5, model.getCustomerPhone());
            statement.setString(6, model.getCustomerAddress());
            statement.setDate(7, java.sql.Date.valueOf(java.time.LocalDate.now()));

            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
}
