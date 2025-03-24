<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Projets</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/project/list.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="max-w-5xl mx-auto p-6">
    <div class="flex justify-between items-center mb-6">
        <h1>Liste des Projets</h1>
        <a href="${pageContext.request.contextPath}/projects/create" class="bg-blue-600 text-white px-4 py-2 rounded-md">
            Ajouter un projet
        </a>
    </div>

    <div class="overflow-x-auto">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Description</th>
                <th>Date de Début</th>
                <th>Date de Fin</th>
                <th>Budget</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="project" items="${projects}">
                <tr>
                    <td>${project.id}</td>
                    <td>${project.name}</td>
                    <td>${project.description}</td>
                    <td>${project.startDate}</td>
                    <td>${project.endDate}</td>
                    <td>${project.budget}</td>
                    <td class="space-x-2">
                        <a href="${pageContext.request.contextPath}/projects/details?id=${project.id}" class="text-blue-600 hover:underline">Détails</a>
                        <a href="${pageContext.request.contextPath}/projects/edit?id=${project.id}" class="text-green-600 hover:underline">Modifier</a>
                        <a href="${pageContext.request.contextPath}/projects/delete?id=${project.id}" onclick="return confirm('Êtes-vous sûr ?')" class="text-red-600 hover:underline">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>