package com.spring.dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbContext {

    private static final String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String connString = "jdbc:sqlserver://localhost:1433;databaseName=SHOPLAPTOP;instance=SQLSERVER;encrypt=true;trustServerCertificate=true";
    private static final String username = "sa";
    private static final String password = "123";

    public static Connection getConnection() {
        try {
            Class.forName(driver);
            return DriverManager.getConnection(connString, username, password);
        } catch (Exception e) {
            throw new RuntimeException("Connecting database error", e);
            //return null;
        }
    }
}
