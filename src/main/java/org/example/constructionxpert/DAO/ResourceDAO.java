package org.example.constructionxpert.DAO;

import org.example.constructionxpert.Model.Resource;

import java.sql.SQLException;
import java.util.List;

public interface ResourceDAO {
    void create(Resource resource) throws SQLException;
    List<Resource> findAll() throws SQLException;
    List<Resource> findAllWithStock() throws SQLException; // Nouvelle méthode
    Resource findById(int id) throws SQLException;
    void update(Resource resource) throws SQLException;
    void delete(int id) throws SQLException;
}