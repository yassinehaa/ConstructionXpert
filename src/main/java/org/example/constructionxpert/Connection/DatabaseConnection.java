package org.example.constructionxpert.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/constructionxpert?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/?useSSL=false", USER, PASSWORD);
                 Statement stmt = conn.createStatement()) {

                stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS constructionxpert");
            }

            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 Statement stmt = conn.createStatement()) {

                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS projects (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "name VARCHAR(255) NOT NULL, " +
                        "description TEXT, " +
                        "start_date DATE, " +
                        "end_date DATE, " +
                        "budget DOUBLE)");

                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS tasks (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "project_id INT, " +
                        "description TEXT, " +
                        "start_date DATE, " +
                        "end_date DATE, " +
                        "FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE)");

                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS resources (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "name VARCHAR(255) NOT NULL, " +
                        "type VARCHAR(100), " +
                        "quantity INT, " +
                        "supplier_info TEXT)");

                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS task_resources (" +
                        "task_id INT, " +
                        "resource_id INT, " +
                        "quantity_used INT NOT NULL DEFAULT 0, " +
                        "FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE, " +
                        "FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE, " +
                        "PRIMARY KEY (task_id, resource_id))");


            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Pilote MySQL non trouvé", e);
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la création des tables", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}