package vn.iotstar.connection;

import java.sql.Connection;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Connection conn = new DBConnection().getConnection();
            if (conn != null) {
                System.out.println("Kết nối THÀNH CÔNG!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}