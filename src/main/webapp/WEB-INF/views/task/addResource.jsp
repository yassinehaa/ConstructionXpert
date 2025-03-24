<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Ajouter une Ressource à la Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/task/addresource.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
    <h1>Ajouter une Ressource à la Tâche #${taskId}</h1>
    <form action="${pageContext.request.contextPath}/tasks/addResource" method="post" class="form">
        <input type="hidden" name="taskId" value="${taskId}">
        <input type="hidden" name="projectId" value="${projectId}">
        <div class="form-group">
            <label>Sélectionner une ressource :</label>
            <select name="resourceId" required>
                <c:forEach var="resource" items="${resources}">
                    <option value="${resource.id}">${resource.name} (${resource.type}) - Stock: ${resource.quantity}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label>Quantité à utiliser :</label>
            <input type="number" name="quantityUsed" min="1" required>
        </div>
        <div class="form-actions">
            <input type="submit" value="Ajouter" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/tasks?projectId=${projectId}" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>