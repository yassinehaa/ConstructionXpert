<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/task/create.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
    <h1>Ajouter une Nouvelle Tâche</h1>
    <form action="${pageContext.request.contextPath}/tasks" method="post" class="form">
        <input type="hidden" name="projectId" value="${projectId}">
        <div class="form-group">
            <label>Description :</label>
            <textarea name="description" required></textarea>
        </div>
        <div class="form-group">
            <label>Date de Début :</label>
            <input type="date" name="startDate" required>
        </div>
        <div class="form-group">
            <label>Date de Fin :</label>
            <input type="date" name="endDate" required>
        </div>
        <div class="form-actions">
            <input type="submit" value="Créer" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/tasks?projectId=${projectId}" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>