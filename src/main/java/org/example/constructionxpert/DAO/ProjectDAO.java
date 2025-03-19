package org.example.constructionxpert.DAO;


import org.example.constructionxpert.Model.Project;

import java.sql.SQLException;
import java.util.List;

public interface ProjectDAO {
    void create(Project project) throws SQLException;
    List<Project> findAll() throws SQLException;
    Project findById(int id) throws SQLException;
    void update(Project project) throws SQLException;
    void delete(int id) throws SQLException;
}