package org.example.constructionxpert.DAO.impl;

import org.example.constructionxpert.Connection.DatabaseConnection;
import org.example.constructionxpert.DAO.ResourceDAO;
import org.example.constructionxpert.Model.Resource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAOImpl implements ResourceDAO {
    @Override
    public void create(Resource resource) throws SQLException {
        String sql = "INSERT INTO resources (name, type, quantity, supplier_info) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.executeUpdate();
        }
    }

    @Override
    public List<Resource> findAll() throws SQLException {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resources.add(resource);
            }
        }
        return resources;
    }

    @Override
    public List<Resource> findAllWithStock() throws SQLException {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources WHERE quantity > 0";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resources.add(resource);
            }
        }
        return resources;
    }

    @Override
    public Resource findById(int id) throws SQLException {
        String sql = "SELECT * FROM resources WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                return resource;
            }
        }
        return null;
    }

    @Override
    public void update(Resource resource) throws SQLException {
        String sql = "UPDATE resources SET name = ?, type = ?, quantity = ?, supplier_info = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.setInt(5, resource.getId());
            stmt.executeUpdate();
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM resources WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}