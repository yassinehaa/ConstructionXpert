<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Modifier un Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Modifier le Projet</h1>
<form action="${pageContext.request.contextPath}/projects/update" method="post">
    <input type="hidden" name="id" value="${project.id}">
    <label>Nom :</label><br>
    <input type="text" name="name" value="${project.name}" required><br>
    <label>Description :</label><br>
    <textarea name="description">${project.description}</textarea><br>
    <label>Date de Début :</label><br>
    <input type="date" name="startDate" value="${project.startDate}" required><br>
    <label>Date de Fin :</label><br>
    <input type="date" name="endDate" value="${project.endDate}" required><br>
    <label>Budget :</label><br>
    <input type="number" name="budget" step="0.01" value="${project.budget}" required><br>
    <input type="submit" value="Mettre à jour">
    <a href="${pageContext.request.contextPath}/projects">Retour</a>
</form>
</body>
</html>