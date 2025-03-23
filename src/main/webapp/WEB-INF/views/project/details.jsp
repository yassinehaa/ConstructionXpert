<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/project/details.css">
    <title>Détails du Projet</title>
</head>
<body>
<div class="container">
    <h1>${project.name}</h1>
    <div class="project-info">
        <p><strong>Description :</strong> ${project.description}</p>
        <p><strong>Date de Début :</strong> ${project.startDate}</p>
        <p><strong>Date de Fin :</strong> ${project.endDate}</p>
        <p><strong>Budget :</strong> ${project.budget}</p>
    </div>

    <div class="header">
        <h2>Tâches</h2>
        <a href="${pageContext.request.contextPath}/tasks/create?projectId=${project.id}" class="btn btn-add">
            Ajouter une tâche
        </a>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Date de Début</th>
                <th>Date de Fin</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr class="task-row">
                    <td>${task.id}</td>
                    <td>${task.description}</td>
                    <td>${task.startDate}</td>
                    <td>${task.endDate}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/tasks/edit?id=${task.id}" class="btn btn-edit">Modifier</a>
                        <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${project.id}"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');"
                           class="btn btn-delete">Supprimer</a>
                        <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${project.id}"
                           class="btn btn-resource">Ajouter une ressource</a>
                    </td>
                </tr>
                <tr class="resource-row">
                    <td colspan="5">
                        <div class="nested-table-wrapper">
                            <h3>Ressources associées</h3>
                            <table class="nested-table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Type</th>
                                    <th>Quantité utilisée</th>
                                    <th>Info Fournisseur</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="resource" items="${task.resources}">
                                    <tr>
                                        <td>${resource.id}</td>
                                        <td>${resource.name}</td>
                                        <td>${resource.type}</td>
                                        <td>${resource.quantityUsed}</td>
                                        <td>${resource.supplierInfo}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/projects" class="btn btn-back">
        Retour à la liste des projets
    </a>
</div>
</body>
</html>