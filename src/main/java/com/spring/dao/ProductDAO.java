package com.spring.dao;

import com.spring.common.CommonFunction;
import com.spring.dbcontext.DbContext;
import com.spring.entity.Product;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

    public List<Product> GetData() {
        Connection conn = DbContext.getConnection();
        try {
            List<Product> list = new ArrayList<>();
            Statement st = conn.createStatement();
            String query = "SELECT * FROM PRODUCT";
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("ProductName");
                String desc = rs.getString("ProductDescription");
                BigDecimal price = rs.getBigDecimal("ProductPrice");
                BigDecimal promoprice = rs.getBigDecimal("PromotionPrice");
                String img = rs.getString("ProductImage");
                String url = rs.getString("ProductURL");
                int brandid = rs.getInt("BrandID");
                Date createddate = rs.getDate("CreatedDate");

                list.add(new Product(id, name, desc, price, promoprice, img, url, brandid, createddate));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public int InsertData(Product prod) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "INSERT dbo.PRODUCT\n"
                    + "\n"
                    + "VALUES\n"
                    + "(\n"
                    + "    -- ProductID - int\n"
                    + "    ?, -- ProductName - nvarchar\n"
                    + "    ?, -- ProductDescription - nvarchar\n"
                    + "    ?, -- ProductPrice - decimal\n"
                    + "    ?, -- PromotionPrice - decimal\n"
                    + "    ?, -- Rating - int\n"
                    + "    ?, -- ProductImage - nvarchar\n"
                    + "    ?, -- ProductStock - int\n"
                    + "    ?, -- ProductURL - nvarchar\n"
                    + "    ?, -- Viewcount - int\n"
                    + "    ?, -- ProductStatus - bit\n"
                    + "    ?, -- CreatedDate - datetime\n"
                    + "    ? -- BrandID - int\n"
                    + ")";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, prod.getProductName());
            statement.setString(2, prod.getProductDescription());
            statement.setBigDecimal(3, prod.getProductPrice());
            statement.setBigDecimal(4, prod.getPromotionPrice());
            statement.setInt(5, 5);
            statement.setString(6, prod.getProductImage());
            statement.setInt(7, prod.getProductStock());
            statement.setString(8, CommonFunction.toSlug(prod.getProductName()));
            statement.setInt(9, 0);
            statement.setBoolean(10, prod.getProductStatus());
            statement.setDate(11, java.sql.Date.valueOf(java.time.LocalDate.now()));
            statement.setInt(12, prod.getBrandID());

            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int EditData(Product prod) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "UPDATE dbo.PRODUCT\n"
                    + "SET\n"
                    + "    dbo.PRODUCT.ProductName = ?, -- nvarchar\n"
                    + "    dbo.PRODUCT.ProductDescription = ?, -- nvarchar\n"
                    + "    dbo.PRODUCT.ProductPrice = ?, -- decimal\n"
                    + "    dbo.PRODUCT.PromotionPrice = ?, -- decimal\n"
                    + "    dbo.PRODUCT.Rating = ?, -- int\n"
                    + "    dbo.PRODUCT.ProductImage = ?, -- nvarchar\n"
                    + "    dbo.PRODUCT.ProductStock = ?, -- int\n"
                    + "    dbo.PRODUCT.ProductURL = ?, -- nvarchar\n"
                    + "    dbo.PRODUCT.Viewcount = ?, -- int\n"
                    + "    dbo.PRODUCT.ProductStatus = ?, -- bit\n"
                    + "    dbo.PRODUCT.CreatedDate = ?"
                    + "    Where dbo.PRODUCT.ProductID = ?";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, prod.getProductName());
            statement.setString(2, prod.getProductDescription());
            statement.setBigDecimal(3, prod.getProductPrice());
            statement.setBigDecimal(4, prod.getPromotionPrice());
            statement.setInt(5, 5);
            statement.setString(6, prod.getProductImage());
            statement.setInt(7, prod.getProductStock());
            statement.setString(8, CommonFunction.toSlug(prod.getProductName()));
            statement.setInt(9, 0);
            statement.setBoolean(10, prod.getProductStatus());
            statement.setDate(11, java.sql.Date.valueOf(java.time.LocalDate.now()));
            statement.setInt(12, prod.getProductID());
            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public Product GetDataByID(int productid) {
        Connection conn = DbContext.getConnection();
        try {
            String query = "SELECT * FROM PRODUCT WHERE PRODUCT.ProductID = ?";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, productid);
            Product prod = new Product();

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                prod.setProductID(rs.getInt("ProductID"));
                prod.setProductName(rs.getString("ProductName"));
                prod.setProductDescription(rs.getString("ProductDescription"));
                prod.setProductPrice(rs.getBigDecimal("ProductPrice"));
                prod.setPromotionPrice(rs.getBigDecimal("PromotionPrice"));
                prod.setProductImage(rs.getString("ProductImage"));
                prod.setProductURL(rs.getString("ProductURL"));
                prod.setRating(rs.getInt("Rating"));
                prod.setViewcount(rs.getInt("Viewcount"));
                prod.setProductStock(rs.getInt("ProductStock"));
                prod.setCreatedDate(rs.getDate("CreatedDate"));
                prod.setBrandID(rs.getInt("BrandID"));

                break;
            }
            return prod;

        } catch (SQLException e) {
            return null;
        }
    }

    public List<Product> GetData(int offset, int max) {
        Connection conn = DbContext.getConnection();
        try {
            List<Product> list = new ArrayList<>();
            String query = "SELECT * FROM PRODUCT ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, offset);
            st.setInt(2, max);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("ProductName");
                String desc = rs.getString("ProductDescription");
                BigDecimal price = rs.getBigDecimal("ProductPrice");
                BigDecimal promoprice = rs.getBigDecimal("PromotionPrice");
                String img = rs.getString("ProductImage");
                String url = rs.getString("ProductURL");
                int brandid = rs.getInt("BrandID");
                Date createddate= rs.getDate("CreatedDate");

                list.add(new Product(id, name, desc, price, promoprice, img, url, brandid, createddate));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public List<Product> GetTopView() {
        Connection conn = DbContext.getConnection();
        try {
            List<Product> list = new ArrayList<>();
            Statement st = conn.createStatement();
            String query = "SELECT TOP(8) * FROM PRODUCT\n" +
                            "ORDER BY PRODUCT.Viewcount DESC";
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("ProductName");
                String desc = rs.getString("ProductDescription");
                BigDecimal price = rs.getBigDecimal("ProductPrice");
                BigDecimal promoprice = rs.getBigDecimal("PromotionPrice");
                String img = rs.getString("ProductImage");
                String url = rs.getString("ProductURL");
                int brandid = rs.getInt("BrandID");
                Date createddate = rs.getDate("CreatedDate");

                list.add(new Product(id, name, desc, price, promoprice, img, url, brandid, createddate));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }
    
    public List<Product> GetLastest() {
        Connection conn = DbContext.getConnection();
        try {
            List<Product> list = new ArrayList<>();
            Statement st = conn.createStatement();
            String query = "SELECT TOP(8) * FROM PRODUCT\n" +
                            "ORDER BY PRODUCT.CreatedDate DESC";
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("ProductName");
                String desc = rs.getString("ProductDescription");
                BigDecimal price = rs.getBigDecimal("ProductPrice");
                BigDecimal promoprice = rs.getBigDecimal("PromotionPrice");
                String img = rs.getString("ProductImage");
                String url = rs.getString("ProductURL");
                int brandid = rs.getInt("BrandID");
                Date createddate = rs.getDate("CreatedDate");

                list.add(new Product(id, name, desc, price, promoprice, img, url, brandid, createddate));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }
    
    public Integer Count() {
        Connection conn = DbContext.getConnection();
        try {
            String query = "SELECT COUNT(*) AS 'Count' FROM PRODUCT ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);

            return rs.getInt("Count");

        } catch (SQLException e) {
            return null;
        }
    }

    public boolean DeleteData(int id) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = " DELETE dbo.Product Where ProductID=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();
            return true;

        } catch (SQLException e) {
            return false;
        }
    }
}
