package org.example.constructionxpert.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.constructionxpert.DAO.ResourceDAO;
import org.example.constructionxpert.DAO.TaskDAO;
import org.example.constructionxpert.DAO.impl.ResourceDAOImpl;
import org.example.constructionxpert.DAO.impl.TaskDAOImpl;
import org.example.constructionxpert.Model.Task;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet("/tasks/*")
public class TaskServlet extends HttpServlet {
    private TaskDAO taskDAO;
    private ResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        taskDAO = new TaskDAOImpl();
        resourceDAO = new ResourceDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String action = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : null;

        try {
            if (action == null || action.isEmpty()) {
                int projectId = Integer.parseInt(req.getParameter("projectId"));
                req.setAttribute("tasks", taskDAO.findByProjectId(projectId));
                req.setAttribute("projectId", projectId);
                req.getRequestDispatcher("/WEB-INF/views/task/list.jsp").forward(req, resp);
            } else if ("create".equals(action)) {
                int projectId = Integer.parseInt(req.getParameter("projectId"));
                req.setAttribute("projectId", projectId);
                req.getRequestDispatcher("/WEB-INF/views/task/create.jsp").forward(req, resp);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Task task = taskDAO.findById(id);
                if (task != null) {
                    req.setAttribute("task", task);
                    req.getRequestDispatcher("/WEB-INF/views/task/edit.jsp").forward(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Tâche non trouvée");
                }
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                int projectId = Integer.parseInt(req.getParameter("projectId"));
                taskDAO.delete(id);
                resp.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId);
            } else if ("addResource".equals(action)) {
                int taskId = Integer.parseInt(req.getParameter("taskId"));
                int projectId = Integer.parseInt(req.getParameter("projectId"));
                req.setAttribute("taskId", taskId);
                req.setAttribute("projectId", projectId);
                // Ne montrer que les ressources avec quantity > 0
                req.setAttribute("resources", resourceDAO.findAllWithStock());
                req.getRequestDispatcher("/WEB-INF/views/task/addResource.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
            }
        } catch (SQLException e) {
            throw new ServletException("Erreur SQL dans TaskServlet", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String action = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : null;

        try {
            if (action == null || action.isEmpty()) {
                Task task = new Task();
                task.setProjectId(Integer.parseInt(req.getParameter("projectId")));
                task.setDescription(req.getParameter("description"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                task.setStartDate(sdf.parse(req.getParameter("startDate")));
                task.setEndDate(sdf.parse(req.getParameter("endDate")));
                taskDAO.create(task);
                resp.sendRedirect(req.getContextPath() + "/tasks?projectId=" + task.getProjectId());
            } else if ("update".equals(action)) {
                Task task = new Task();
                task.setId(Integer.parseInt(req.getParameter("id")));
                task.setProjectId(Integer.parseInt(req.getParameter("projectId")));
                task.setDescription(req.getParameter("description"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                task.setStartDate(sdf.parse(req.getParameter("startDate")));
                task.setEndDate(sdf.parse(req.getParameter("endDate")));
                taskDAO.update(task);
                resp.sendRedirect(req.getContextPath() + "/tasks?projectId=" + task.getProjectId());
            } else if ("addResource".equals(action)) {
                int taskId = Integer.parseInt(req.getParameter("taskId"));
                int resourceId = Integer.parseInt(req.getParameter("resourceId"));
                int quantityUsed = Integer.parseInt(req.getParameter("quantityUsed")); // Nouvelle donnée
                int projectId = Integer.parseInt(req.getParameter("projectId"));

                // Ajouter la ressource et réduire le stock
                taskDAO.addResourceToTask(taskId, resourceId, quantityUsed);
                resp.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
            }
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la création/mise à jour/association", e);
        }
    }
}