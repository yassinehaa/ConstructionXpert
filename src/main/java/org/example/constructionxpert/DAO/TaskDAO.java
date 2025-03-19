package org.example.constructionxpert.DAO;

import org.example.constructionxpert.Model.Resource;
import org.example.constructionxpert.Model.Task;

import java.sql.SQLException;
import java.util.List;

public interface TaskDAO {
    void create(Task task) throws SQLException;
    List<Task> findByProjectId(int projectId) throws SQLException;
    Task findById(int id) throws SQLException;
    void update(Task task) throws SQLException;
    void delete(int id) throws SQLException;
    void addResourceToTask(int taskId, int resourceId, int quantityUsed) throws SQLException;
    List<Resource> findResourcesByTaskId(int taskId) throws SQLException;
}