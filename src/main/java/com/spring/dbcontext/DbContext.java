package com.spring.dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbContext {
//    private static String DB_URL = "jdbc:sqlserver://localhost;"
//            + "databaseName=SHOPLAPTOP;"
//            + "integratedSecurity=true";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String connString = "jdbc:sqlserver://localhost:1433;databaseName=SHOPLAPTOP;instance=SQLSERVER;encrypt=true;trustServerCertificate=true";
    private static final String username = "sa";
    private static final String password = "123";
    private static Connection sConnection;

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            if (sConnection ==  null) {
                sConnection = DriverManager.getConnection(connString, username, password);
            }
            return sConnection;
            //return DriverManager.getConnection(connString, username, password);
        } catch (Exception e) {
            throw new RuntimeException("Connecting database error", e);
            //return null;
        }
    }
}
