package com.spring.dao;

import com.spring.common.CommonFunction;
import com.spring.dbcontext.DbContext;
import com.spring.entity.Order;
import com.spring.entity.OrderStatus;
import com.spring.entity.Product;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {

    public List<Order> GetData() {
        Connection conn = DbContext.getConnection();
        try {
            List<Order> list = new ArrayList<>();
            String query = "SELECT * FROM [ORDER] \n"
                    + "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID";
            PreparedStatement st = conn.prepareStatement(query);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("OrderID");
                Date orderDate = rs.getDate("OrderDate");
                BigDecimal total = rs.getBigDecimal("Total");
                String customername = rs.getString("CustomerName");
                String customerphone = rs.getString("CustomerPhone");
                String customeraddress = rs.getString("CustomerAddress");
                int orderstatus = rs.getInt("OrderStatusID");
                int customerid = rs.getInt("CustomerID");
                String statusname = rs.getString("StatusName");
                list.add(new Order(id, orderDate, total, customername, customerphone, customeraddress, orderstatus, customerid, statusname));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public List<Order> LoadOrder(int userid) {
        Connection conn = DbContext.getConnection();
        try {
            List<Order> list = new ArrayList<>();
            String query = "SELECT * FROM [ORDER] \n"
                    + "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID\n"
                    + "WHERE [ORDER].CustomerID = ?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, userid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("OrderID");
                Date orderDate = rs.getDate("OrderDate");
                BigDecimal total = rs.getBigDecimal("Total");
                String customername = rs.getString("CustomerName");
                String customerphone = rs.getString("CustomerPhone");
                String customeraddress = rs.getString("CustomerAddress");
                int orderstatus = rs.getInt("OrderStatusID");
                int customerid = rs.getInt("CustomerID");
                String statusname = rs.getString("StatusName");

                list.add(new Order(id, orderDate, total, customername, customerphone, customeraddress, orderstatus, customerid, statusname));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public Order LoadOrderDetail(int orderid) {
        Connection conn = DbContext.getConnection();
        try {
            Order order = new Order();
            String query = "SELECT [ORDER].OrderID, \n"
                    + "[ORDER].OrderDate, \n"
                    + "[ORDER].Total, \n"
                    + "[ORDER].CustomerName, \n"
                    + "[ORDER].CustomerAddress, \n"
                    + "[ORDER].CustomerPhone,\n"
                    + "[ORDER].OrderStatusID,\n"
                    + "ORDERSTATUS.StatusName FROM [ORDER]\n"
                    + "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID\n"
                    + "WHERE [ORDER].OrderID = ?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, orderid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                order.setOrderID(rs.getInt("OrderID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setTotal(rs.getBigDecimal("Total"));
                order.setCustomerName(rs.getString("CustomerName"));
                order.setCustomerPhone(rs.getString("CustomerPhone"));
                order.setCustomerAddress(rs.getString("CustomerAddress"));
                order.setOrderStatusID(rs.getInt("OrderStatusID"));
                order.setStatusName(rs.getString("StatusName"));

                break;
            }
            return order;

        } catch (SQLException e) {
            return null;
        }
    }

    public List<Product> LoadOrderProduct(int orderid) {
        Connection conn = DbContext.getConnection();
        try {
            List<Product> list = new ArrayList<>();
            String query = "SELECT PRODUCT.ProductID, PRODUCT.ProductImage, PRODUCT.ProductName, PRODUCT.ProductPrice, ORDERDETAIL.Quantity\n"
                    + "FROM [ORDER] \n"
                    + "JOIN ORDERDETAIL ON [ORDER].OrderID = ORDERDETAIL.OrderID\n"
                    + "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID\n"
                    + "JOIN PRODUCT ON ORDERDETAIL.ProductID = PRODUCT.ProductID\n"
                    + "WHERE ORDERDETAIL.OrderID = ?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, orderid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String image = rs.getString("ProductImage");
                String name = rs.getString("ProductName");
                BigDecimal price = rs.getBigDecimal("ProductPrice");
                int stock = rs.getInt("Quantity");

                list.add(new Product(id, name, price, image, stock));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public int AddOrder(int customerid, String customername, String customerphone, String customeraddress, BigDecimal total) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "INSERT dbo.[ORDER]\n"
                    + "VALUES\n"
                    + "(\n"
                    + "    -- OrderID - INT\n"
                    + "    ?, -- OrderDate - DATETIME\n"
                    + "    ?, -- Total - DECIMAL\n"
                    + "    ?, -- CustomerName - NVARCHAR\n"
                    + "    ?, -- CustomerPhone - NVARCHAR\n"
                    + "    ?, -- CustomerAddress - NVARCHAR\n"
                    + "    ?, -- OrderStatusID - INT\n"
                    + "    ? -- CustomerID - INT\n"
                    + ")";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now()));
            statement.setBigDecimal(2, total);
            statement.setString(3, customername);
            statement.setString(4, customerphone);
            statement.setString(5, customeraddress);
            statement.setInt(6, 1);
            if (customerid != 0) {
                statement.setInt(7, customerid);
            } else {
                statement.setNull(7, Types.INTEGER);
            }

            int rs = statement.executeUpdate();
            if (rs != 0) {
                return GetOrderID();
            }
            return rs;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public Integer GetOrderID() {
        Connection conn = DbContext.getConnection();
        try {
            String query = "SELECT TOP(1) OrderID FROM dbo.[ORDER] o ORDER BY o.OrderID DESC";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            int orderid = 0;
            while (rs.next()) {
                orderid = rs.getInt("OrderID");
            }

            return orderid;

        } catch (SQLException e) {
            return -2;
        }
    }

    public int AddOrderDetail(int orderid, int productid, int quantity) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "INSERT dbo.ORDERDETAIL\n"
                    + "VALUES\n"
                    + "(\n"
                    + "    -- DetailID - INT\n"
                    + "    ?, -- Quantity - INT\n"
                    + "    ?, -- OrderID - INT\n"
                    + "    ? -- ProductID - INT\n"
                    + ")";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setInt(2, orderid);
            statement.setInt(3, productid);

            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
   

    public List<OrderStatus> StatusList() {
        Connection conn = DbContext.getConnection();
        try {
            List<OrderStatus> list = new ArrayList<>();
            String query = "Select * From ORDERSTATUS";
            PreparedStatement st = conn.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("StatusID");
                String name = rs.getString("StatusName");

                list.add(new OrderStatus(id, name));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public int EditOrder(int orderid, int statusid) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "UPDATE dbo.[ORDER]\n"
                    + "SET\n"
                    + "    dbo.[ORDER].OrderStatusID = ?\n"
                    + "    WHERE dbo.[ORDER].OrderID=?";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, statusid);
            statement.setInt(2, orderid);

            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    
    public List<Integer> OrderSucces(int month, int year){
        Connection conn = DbContext.getConnection();
        List<Integer> a = new ArrayList<Integer>();
        try{
            String query = "SELECT sum(Total) as tong, count(Total) as soLuong FROM [ORDER] INNER\n" +
            "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID \n" +
            "WHERE ORDERSTATUS.StatusName = N'Đã giao hàng' AND MONTH(OrderDate) = "+ month+" \n" +
            "AND YEAR(OrderDate) = " + year;
            PreparedStatement st = conn.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                a.add(rs.getInt("soLuong"));
                a.add(rs.getInt("tong"));
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        return a;
    }
    
    public int OrderUnSucces(int month, int year){
        Connection conn = DbContext.getConnection();
        try{
            String query = "SELECT * FROM [ORDER] INNER\n" +
                "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID \n" +
                "WHERE MONTH(OrderDate) = "+month+" AND YEAR(OrderDate) = "+year+" \n" +
                "AND (ORDERSTATUS.StatusName = N'Hàng có lỗi' \n" +
                "OR ORDERSTATUS.StatusName = N'Đã hủy')";
            PreparedStatement st = conn.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                return rs.getInt("soluong");
            }
            
        }
        catch(Exception e){
            System.out.println(e);
            return -1;
        }
        return 0;
    }
    public int OrderInMonth(int month, int year){
        Connection conn = DbContext.getConnection();
        try{
            String query = "SELECT count(Total) as soLuong FROM [ORDER] INNER\n" +
                "JOIN ORDERSTATUS ON [ORDER].OrderStatusID = ORDERSTATUS.StatusID "
                    + "WHERE MONTH(OrderDate) = "+month+ " AND YEAR(OrderDate) = " + year;
            PreparedStatement st = conn.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                return rs.getInt("soluong");
            }
            
        }
        catch(Exception e){
            System.out.println(e);
            return -1;
        }
        return 0;
    }
    public static void main(String[] args) throws SQLException {
        List<Integer> a = new OrderDAO().OrderSucces(3,2021);
        for(Integer i: a){
            System.out.println(i);
        }
        System.out.println(new OrderDAO().OrderInMonth(2,2021));
        System.out.println(new OrderDAO().OrderUnSucces(2,2021));
    }
}
