package org.example.constructionxpert.DAO.impl;

import org.example.constructionxpert.Connection.DatabaseConnection;
import org.example.constructionxpert.DAO.ProjectDAO;
import org.example.constructionxpert.Model.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAOImpl implements ProjectDAO {
    @Override
    public void create(Project project) throws SQLException {
        String sql = "INSERT INTO projects (name, description, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?)";
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, project.getName());
        stmt.setString(2, project.getDescription());
        stmt.setDate(3, project.getStartDate());
        stmt.setDate(4, project.getEndDate());
        stmt.setDouble(5, project.getBudget());
        stmt.executeUpdate();
    }

    @Override
    public List<Project> findAll() throws SQLException {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects";
        Connection conn = DatabaseConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            Project project = new Project();
            project.setId(rs.getInt("id"));
            project.setName(rs.getString("name"));
            project.setDescription(rs.getString("description"));
            project.setStartDate(rs.getDate("start_date"));
            project.setEndDate(rs.getDate("end_date"));
            project.setBudget(rs.getDouble("budget"));
            projects.add(project);
        }
        return projects;
    }

    @Override
    public Project findById(int id) throws SQLException {
        String sql = "SELECT * FROM projects WHERE id = ?";
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Project project = new Project();
            project.setId(rs.getInt("id"));
            project.setName(rs.getString("name"));
            project.setDescription(rs.getString("description"));
            project.setStartDate(rs.getDate("start_date"));
            project.setEndDate(rs.getDate("end_date"));
            project.setBudget(rs.getDouble("budget"));
            return project;
        }
        return null;
    }

    @Override
    public void update(Project project) throws SQLException {
        String sql = "UPDATE projects SET name = ?, description = ?, start_date = ?, end_date = ?, budget = ? WHERE id = ?";
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, project.getName());
        stmt.setString(2, project.getDescription());
        stmt.setDate(3, new java.sql.Date(project.getStartDate().getTime()));
        stmt.setDate(4, new java.sql.Date(project.getEndDate().getTime()));
        stmt.setDouble(5, project.getBudget());
        stmt.setInt(6, project.getId());
        stmt.executeUpdate();
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM projects WHERE id = ?";
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
    }
}
