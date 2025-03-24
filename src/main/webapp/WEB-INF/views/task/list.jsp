<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/task/list.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="max-w-4xl mx-auto p-6">
    <div class="flex justify-between items-center mb-6">
        <h1>Liste des Tâches du Projet ${projectId}</h1>
        <a href="${pageContext.request.contextPath}/tasks/create?projectId=${projectId}" class="bg-blue-600 text-white px-4 py-2 rounded-md">
            Ajouter une tâche
        </a>
    </div>

    <div class="overflow-x-auto">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Date de Début</th>
                <th>Date de Fin</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr>
                    <td>${task.id}</td>
                    <td>${task.description}</td>
                    <td>${task.startDate}</td>
                    <td>${task.endDate}</td>
                    <td class="space-x-2">
                        <a href="${pageContext.request.contextPath}/tasks/edit?id=${task.id}" class="text-green-600 hover:underline">Modifier</a>
                        <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${projectId}" onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');" class="text-red-600 hover:underline">Supprimer</a>
                        <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${projectId}" class="text-blue-600 hover:underline">Ajouter une ressource</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/projects" class="btn-back">
        Retour aux projets
    </a>
</div>
</body>
</html>