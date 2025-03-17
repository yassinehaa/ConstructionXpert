<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Ajouter une Nouvelle Tâche</h1>
<form action="${pageContext.request.contextPath}/tasks" method="post">
    <input type="hidden" name="projectId" value="${projectId}">
    <label>Description :</label><br>
    <textarea name="description" required></textarea><br>
    <label>Date de Début :</label><br>
    <input type="date" name="startDate" required><br>
    <label>Date de Fin :</label><br>
    <input type="date" name="endDate" required><br>
    <input type="submit" value="Créer">
    <a href="${pageContext.request.contextPath}/tasks?projectId=${projectId}">Retour</a>
</form>
</body>
</html>