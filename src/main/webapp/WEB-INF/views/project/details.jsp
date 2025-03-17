<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Détails du Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .nested-table { margin: 10px 0 0 20px; width: 90%; }
    </style>
</head>
<body>
<h1>Détails du Projet : ${project.name}</h1>
<p><strong>Description :</strong> ${project.description}</p>
<p><strong>Date de Début :</strong> ${project.startDate}</p>
<p><strong>Date de Fin :</strong> ${project.endDate}</p>
<p><strong>Budget :</strong> ${project.budget}</p>

<h2>Tâches</h2>
<a href="${pageContext.request.contextPath}/tasks/create?projectId=${project.id}">Ajouter une tâche</a>
<table>
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Date de Début</th>
        <th>Date de Fin</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="task" items="${tasks}">
        <tr>
            <td>${task.id}</td>
            <td>${task.description}</td>
            <td>${task.startDate}</td>
            <td>${task.endDate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/tasks/edit?id=${task.id}">Modifier</a>
                <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${project.id}"
                   onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');">Supprimer</a>
                <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${project.id}">Ajouter une ressource</a>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <h3>Ressources associées</h3>
                <table class="nested-table">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Type</th>
                        <th>Quantité restante</th>
                        <th>Info Fournisseur</th>
                    </tr>
                    <c:forEach var="resource" items="${taskDAO.findResourcesByTaskId(task.id)}">
                        <tr>
                            <td>${resource.id}</td>
                            <td>${resource.name}</td>
                            <td>${resource.type}</td>
                            <td>${resource.quantity}</td>
                            <td>${resource.supplierInfo}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/projects">Retour à la liste des projets</a>
</body>
</html>