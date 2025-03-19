package org.example.constructionxpert.DAO.impl;

import org.example.constructionxpert.Connection.DatabaseConnection;
import org.example.constructionxpert.DAO.TaskDAO;
import org.example.constructionxpert.Model.Resource;
import org.example.constructionxpert.Model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAOImpl implements TaskDAO {

    @Override
    public void create(Task task) throws SQLException {
        String sql = "INSERT INTO tasks (project_id, description, start_date, end_date) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, task.getProjectId());
            stmt.setString(2, task.getDescription());
            stmt.setDate(3, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(task.getEndDate().getTime()));
            stmt.executeUpdate();
        }
    }

    @Override
    public List<Task> findByProjectId(int projectId) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE project_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, projectId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Task task = new Task();
                task.setId(rs.getInt("id"));
                task.setProjectId(rs.getInt("project_id"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                tasks.add(task);
            }
        }
        return tasks;
    }

    @Override
    public Task findById(int id) throws SQLException {
        String sql = "SELECT * FROM tasks WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Task task = new Task();
                task.setId(rs.getInt("id"));
                task.setProjectId(rs.getInt("project_id"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                return task;
            }
        }
        return null;
    }

    @Override
    public void update(Task task) throws SQLException {
        String sql = "UPDATE tasks SET description = ?, start_date = ?, end_date = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, task.getDescription());
            stmt.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(3, new java.sql.Date(task.getEndDate().getTime()));
            stmt.setInt(4, task.getId());
            stmt.executeUpdate();
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM tasks WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    @Override
    public void addResourceToTask(int taskId, int resourceId, int quantityUsed) throws SQLException {
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false);

            // Check resource availability
            String checkSql = "SELECT quantity FROM resources WHERE id = ? FOR UPDATE";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setInt(1, resourceId);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next()) {
                    int currentQuantity = rs.getInt("quantity");
                    if (currentQuantity < quantityUsed) {
                        throw new SQLException("Quantité insuffisante en stock pour la ressource ID " + resourceId + ". Disponible : " + currentQuantity);
                    }
                } else {
                    throw new SQLException("Ressource ID " + resourceId + " non trouvée");
                }
            }

            // Update resource stock
            String updateSql = "UPDATE resources SET quantity = quantity - ? WHERE id = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, quantityUsed);
                updateStmt.setInt(2, resourceId);
                updateStmt.executeUpdate();
            }

            // Insert or update task_resources with quantity_used
            String insertSql = "INSERT INTO task_resources (task_id, resource_id, quantity_used) " +
                    "VALUES (?, ?, ?) " +
                    "ON DUPLICATE KEY UPDATE quantity_used = quantity_used + ?";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setInt(1, taskId);
                insertStmt.setInt(2, resourceId);
                insertStmt.setInt(3, quantityUsed);
                insertStmt.setInt(4, quantityUsed); // Increment if already exists
                insertStmt.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }
    }

    @Override
    public List<Resource> findResourcesByTaskId(int taskId) throws SQLException {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT r.*, tr.quantity_used " +
                "FROM resources r " +
                "JOIN task_resources tr ON r.id = tr.resource_id " +
                "WHERE tr.task_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, taskId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity")); // Remaining stock
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resource.setQuantityUsed(rs.getInt("quantity_used")); // Quantity used for this task
                resources.add(resource);
            }
        }
        return resources;
    }
}