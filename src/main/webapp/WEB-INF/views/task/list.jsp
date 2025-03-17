<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Liste des Tâches du Projet ${projectId}</h1>
<a href="${pageContext.request.contextPath}/tasks/create?projectId=${projectId}">Ajouter une tâche</a>
<table border="1">
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
                <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${projectId}"
                   onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');">Supprimer</a>
                <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${projectId}">Ajouter une ressource</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/projects">Retour aux projets</a>
</body>
</html>