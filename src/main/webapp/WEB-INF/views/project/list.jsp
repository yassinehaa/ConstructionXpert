<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Liste des Projets</h1>
<a href="${pageContext.request.contextPath}/projects/create">Ajouter un projet</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Date de Début</th>
        <th>Date de Fin</th>
        <th>Budget</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="project" items="${projects}">
        <tr>
            <td>${project.id}</td>
            <td>${project.name}</td>
            <td>${project.description}</td>
            <td>${project.startDate}</td>
            <td>${project.endDate}</td>
            <td>${project.budget}</td>
            <td>
                <a href="${pageContext.request.contextPath}/projects/details?id=${project.id}">Détails</a>
                <a href="${pageContext.request.contextPath}/projects/edit?id=${project.id}">Modifier</a>
                <a href="${pageContext.request.contextPath}/projects/delete?id=${project.id}"
                   onclick="return confirm('Voulez-vous vraiment supprimer ce projet ?');">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>