package org.example.constructionxpert.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.constructionxpert.DAO.ResourceDAO;
import org.example.constructionxpert.DAO.impl.ResourceDAOImpl;
import org.example.constructionxpert.Model.Resource;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/resources/*")
public class ResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        resourceDAO = new ResourceDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String action = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : null;

        try {
            if (action == null || action.isEmpty()) {
                // Afficher la liste des ressources (READ - Liste)
                req.setAttribute("resources", resourceDAO.findAll());
                req.getRequestDispatcher("/WEB-INF/views/resource/list.jsp").forward(req, resp);
            } else if ("create".equals(action)) {
                // Afficher le formulaire de création (CREATE - Formulaire)
                req.getRequestDispatcher("/WEB-INF/views/resource/create.jsp").forward(req, resp);
            } else if ("edit".equals(action)) {
                // Afficher le formulaire de modification (READ - Détail)
                int id = Integer.parseInt(req.getParameter("id"));
                Resource resource = resourceDAO.findById(id); // Ajoutez cette méthode dans ResourceDAO
                if (resource != null) {
                    req.setAttribute("resource", resource);
                    req.getRequestDispatcher("/WEB-INF/views/resource/edit.jsp").forward(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Ressource non trouvée");
                }
            } else if ("delete".equals(action)) {
                // Supprimer une ressource (DELETE)
                int id = Integer.parseInt(req.getParameter("id"));
                resourceDAO.delete(id);
                resp.sendRedirect(req.getContextPath() + "/resources");
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
            }
        } catch (SQLException e) {
            throw new ServletException("Erreur SQL dans ResourceServlet", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        String action = (pathInfo != null && pathInfo.length() > 1) ? pathInfo.substring(1) : null;

        try {
            if (action == null || action.isEmpty()) {
                // Créer une nouvelle ressource (CREATE)
                Resource resource = new Resource();
                resource.setName(req.getParameter("name"));
                resource.setType(req.getParameter("type"));
                resource.setQuantity(Integer.parseInt(req.getParameter("quantity")));
                resource.setSupplierInfo(req.getParameter("supplierInfo"));
                resourceDAO.create(resource);
                resp.sendRedirect(req.getContextPath() + "/resources");
            } else if ("update".equals(action)) {
                // Mettre à jour une ressource (UPDATE)
                Resource resource = new Resource();
                resource.setId(Integer.parseInt(req.getParameter("id")));
                resource.setName(req.getParameter("name"));
                resource.setType(req.getParameter("type"));
                resource.setQuantity(Integer.parseInt(req.getParameter("quantity")));
                resource.setSupplierInfo(req.getParameter("supplierInfo"));
                resourceDAO.update(resource);
                resp.sendRedirect(req.getContextPath() + "/resources");
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Action non reconnue");
            }
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la création/mise à jour de la ressource", e);
        }
    }
}