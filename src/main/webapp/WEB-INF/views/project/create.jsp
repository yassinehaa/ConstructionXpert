<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/project/Create.css">
</head>
<body>
<div class="container">
    <h1>Ajouter un Nouveau Projet</h1>
    <form action="${pageContext.request.contextPath}/projects" method="post" class="form">
        <div class="form-group">
            <label>Nom :</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label>Description :</label>
            <textarea name="description"></textarea>
        </div>
        <div class="form-group">
            <label>Date de Début :</label>
            <input type="date" name="startDate" required>
        </div>
        <div class="form-group">
            <label>Date de Fin :</label>
            <input type="date" name="endDate" required>
        </div>
        <div class="form-group">
            <label>Budget :</label>
            <input type="number" name="budget" step="0.01" required>
        </div>
        <div class="form-actions">
            <input type="submit" value="Créer" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/projects" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>