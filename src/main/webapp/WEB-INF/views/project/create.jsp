<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Ajouter un Nouveau Projet</h1>
<form action="${pageContext.request.contextPath}/projects" method="post">
    <label>Nom :</label><br>
    <input type="text" name="name" required><br>
    <label>Description :</label><br>
    <textarea name="description"></textarea><br>
    <label>Date de Début :</label><br>
    <input type="date" name="startDate" required><br>
    <label>Date de Fin :</label><br>
    <input type="date" name="endDate" required><br>
    <label>Budget :</label><br>
    <input type="number" name="budget" step="0.01" required><br>
    <input type="submit" value="Créer">
    <a href="${pageContext.request.contextPath}/projects">Retour</a>
</form>
</body>
</html>