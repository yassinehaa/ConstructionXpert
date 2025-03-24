<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Modifier un Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/project/edit.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
    <h1>Modifier le Projet</h1>
    <form action="${pageContext.request.contextPath}/projects/update" method="post" class="form">
        <input type="hidden" name="id" value="${project.id}">
        <div class="form-group">
            <label>Nom :</label>
            <input type="text" name="name" value="${project.name}" required>
        </div>
        <div class="form-group">
            <label>Description :</label>
            <textarea name="description">${project.description}</textarea>
        </div>
        <div class="form-group">
            <label>Date de Début :</label>
            <input type="date" name="startDate" value="${project.startDate}" required>
        </div>
        <div class="form-group">
            <label>Date de Fin :</label>
            <input type="date" name="endDate" value="${project.endDate}" required>
        </div>
        <div class="form-group">
            <label>Budget :</label>
            <input type="number" name="budget" step="0.01" value="${project.budget}" required>
        </div>
        <div class="form-actions">
            <input type="submit" value="Mettre à jour" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/projects" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>