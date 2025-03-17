<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Ajouter une Ressource à la Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Ajouter une Ressource à la Tâche #${taskId}</h1>
<form action="${pageContext.request.contextPath}/tasks/addResource" method="post">
    <input type="hidden" name="taskId" value="${taskId}">
    <input type="hidden" name="projectId" value="${projectId}">
    <label>Sélectionner une ressource :</label><br>
    <select name="resourceId" required>
        <c:forEach var="resource" items="${resources}">
            <option value="${resource.id}">${resource.name} (${resource.type}) - Stock: ${resource.quantity}</option>
        </c:forEach>
    </select><br>
    <label>Quantité à utiliser :</label><br>
    <input type="number" name="quantityUsed" min="1" required><br>
    <input type="submit" value="Ajouter">
    <a href="${pageContext.request.contextPath}/tasks?projectId=${projectId}">Retour</a>
</form>
</body>
</html>