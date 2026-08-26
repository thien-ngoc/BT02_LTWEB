package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=ShoppingDB;encrypt=true;trustServerCertificate=true";
        String user = "sa";
        String pass = "1234"; // thay đúng mật khẩu SQL Server của bạn

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, user, pass);
    }
}