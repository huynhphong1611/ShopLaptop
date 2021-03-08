package com.spring.dao;

import com.spring.common.CommonFunction;
import com.spring.dbcontext.DbContext;
import com.spring.entity.Brand;
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
public class BrandDAO {

    public List<Brand> GetData() {
        Connection conn = DbContext.getConnection();
        try {
            List<Brand> list = new ArrayList<>();
            Statement st = conn.createStatement();
            String query = "SELECT * FROM BRAND";
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("BrandID");
                String name = rs.getString("BrandName");
                String url = rs.getString("BrandUrl");
                Date date = rs.getDate("CreatedDate");

                list.add(new Brand(id, name, url, date));
            }
            return list;

        } catch (SQLException e) {
            return null;
        }
    }

    public int InsertData(String name) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "INSERT INTO dbo.Brand (BrandName, BrandUrl, CreatedDate) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, CommonFunction.toSlug(name));
            statement.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));

            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            return 0;
        }
    }

    public boolean DeleteData(int id) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = " DELETE dbo.Brand Where BrandID=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();
            return true;

        } catch (SQLException e) {
            return false;
        }
    }

    public int EditData(int id, String BrandName) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "UPDATE dbo.BRAND\n"
                    + "SET\n"
                    + "    dbo.BRAND.BrandName = ?,\n"
                    + "    dbo.BRAND.BrandURL = ?\n"
                    + "	WHERE dbo.BRAND.BrandID=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, BrandName);
            statement.setString(2, CommonFunction.toSlug(BrandName));
            statement.setInt(3, id);

            int rs = statement.executeUpdate();

            return rs;

        } catch (SQLException e) {
            return -1;
        }
    }

    public Brand getBrand(int id) {
        Connection conn = DbContext.getConnection();
        try {
            String sql = "SELECT * FROM dbo.BRAND b WHERE b.BrandID=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);

            Brand brand = new Brand();
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                brand.setBrandID(rs.getInt("BrandID"));
                brand.setBrandName(rs.getString("BrandName"));
            }
            return brand;

        } catch (SQLException e) {
            return null;
        }
    }
}
