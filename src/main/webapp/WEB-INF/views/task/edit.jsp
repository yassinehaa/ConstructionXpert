<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Modifier une Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/task/edit.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
    <h1>Modifier la Tâche</h1>
    <form action="${pageContext.request.contextPath}/tasks/update" method="post" class="form">
        <input type="hidden" name="id" value="${task.id}">
        <input type="hidden" name="projectId" value="${task.projectId}">
        <div class="form-group">
            <label>Description :</label>
            <textarea name="description" required>${task.description}</textarea>
        </div>
        <div class="form-group">
            <label>Date de Début :</label>
            <input type="date" name="startDate" value="${task.startDate}" required>
        </div>
        <div class="form-group">
            <label>Date de Fin :</label>
            <input type="date" name="endDate" value="${task.endDate}" required>
        </div>
        <div class="form-actions">
            <input type="submit" value="Mettre à jour" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/tasks?projectId=${task.projectId}" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>