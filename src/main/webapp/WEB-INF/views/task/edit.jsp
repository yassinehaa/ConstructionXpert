<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Modifier une Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Modifier la Tâche</h1>
<form action="${pageContext.request.contextPath}/tasks/update" method="post">
    <input type="hidden" name="id" value="${task.id}">
    <input type="hidden" name="projectId" value="${task.projectId}">
    <label>Description :</label><br>
    <textarea name="description" required>${task.description}</textarea><br>
    <label>Date de Début :</label><br>
    <input type="date" name="startDate" value="${task.startDate}" required><br>
    <label>Date de Fin :</label><br>
    <input type="date" name="endDate" value="${task.endDate}" required><br>
    <input type="submit" value="Mettre à jour">
    <a href="${pageContext.request.contextPath}/tasks?projectId=${task.projectId}">Retour</a>
</form>
</body>
</html>