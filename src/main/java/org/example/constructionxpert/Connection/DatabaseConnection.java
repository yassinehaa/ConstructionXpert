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
            // Chargement explicite du pilote MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Création de la base de données et des tables au démarrage
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/?useSSL=false", USER, PASSWORD);
                 Statement stmt = conn.createStatement()) {

                // Création de la base de données si elle n'existe pas
                stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS constructionxpert");
            }

            // Connexion à la base de données constructionxpert et création des tables
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 Statement stmt = conn.createStatement()) {

                // Table projects
                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS projects (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "name VARCHAR(255) NOT NULL, " +
                        "description TEXT, " +
                        "start_date DATE, " +
                        "end_date DATE, " +
                        "budget DOUBLE)");

                // Table tasks
                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS tasks (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "project_id INT, " +
                        "description TEXT, " +
                        "start_date DATE, " +
                        "end_date DATE, " +
                        "FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE)");

                // Table resources
                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS resources (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "name VARCHAR(255) NOT NULL, " +
                        "type VARCHAR(100), " +
                        "quantity INT, " +
                        "supplier_info TEXT)");

                // Table task_resources
                stmt.executeUpdate("CREATE TABLE IF NOT EXISTS task_resources (" +
                        "task_id INT, " +
                        "resource_id INT, " +
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