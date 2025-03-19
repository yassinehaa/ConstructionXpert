package org.example.constructionxpert.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.constructionxpert.DAO.ProjectDAO;
import org.example.constructionxpert.DAO.TaskDAO;
import org.example.constructionxpert.DAO.impl.ProjectDAOImpl;
import org.example.constructionxpert.DAO.impl.TaskDAOImpl;
import org.example.constructionxpert.Model.Project;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet("/projects/*")
public class ProjectServlet extends HttpServlet {
    private ProjectDAO projectDAO;
    private TaskDAO taskDAO;

    @Override
    public void init() throws ServletException {
        projectDAO = new ProjectDAOImpl();
        taskDAO = new TaskDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String action = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : null;

        try {
            if (action == null) {
                req.setAttribute("projects", projectDAO.findAll());
                req.getRequestDispatcher("/WEB-INF/views/project/list.jsp").forward(req, resp);
            } else if ("create".equals(action)) {
                req.getRequestDispatcher("/WEB-INF/views/project/create.jsp").forward(req, resp);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Project project = projectDAO.findById(id);
                if (project != null) {
                    req.setAttribute("project", project);
                    req.getRequestDispatcher("/WEB-INF/views/project/edit.jsp").forward(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Projet non trouvé");
                }
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                projectDAO.delete(id);
                resp.sendRedirect(req.getContextPath() + "/projects");
            } else if ("details".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Project project = projectDAO.findById(id);
                if (project != null) {
                    req.setAttribute("project", project);
                    req.setAttribute("tasks", taskDAO.findByProjectId(id));
                    req.getRequestDispatcher("/WEB-INF/views/project/details.jsp").forward(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Projet non trouvé");
                }
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
            }
        } catch (SQLException e) {
            throw new ServletException("Erreur SQL dans ProjectServlet", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String action = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : null;

        try {
            if (action == null || action.isEmpty()) {
                Project project = new Project();
                project.setName(req.getParameter("name"));
                project.setDescription(req.getParameter("description"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                project.setStartDate(sdf.parse(req.getParameter("startDate")));
                project.setEndDate(sdf.parse(req.getParameter("endDate")));
                project.setBudget(Double.parseDouble(req.getParameter("budget")));
                projectDAO.create(project);
                resp.sendRedirect(req.getContextPath() + "/projects");
            } else if ("update".equals(action)) {
                Project project = new Project();
                project.setId(Integer.parseInt(req.getParameter("id")));
                project.setName(req.getParameter("name"));
                project.setDescription(req.getParameter("description"));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                project.setStartDate(sdf.parse(req.getParameter("startDate")));
                project.setEndDate(sdf.parse(req.getParameter("endDate")));
                project.setBudget(Double.parseDouble(req.getParameter("budget")));
                projectDAO.update(project);
                resp.sendRedirect(req.getContextPath() + "/projects");
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
            }
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la création/mise à jour du projet", e);
        }
    }
}