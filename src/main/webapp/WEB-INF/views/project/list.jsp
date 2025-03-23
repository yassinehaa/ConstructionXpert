<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Projets</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/project/list.css">
</head>
<body class="bg-gray-100 min-h-screen">
<%@ include file="/header.jsp" %>
<div class="p-6 mt-16">
    <div class="max-w-5xl mx-auto bg-white p-6 rounded-lg shadow-lg">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Liste des Projets</h1>
            <a href="${pageContext.request.contextPath}/projects/create"
               class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition duration-200">
                Ajouter un projet
            </a>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full text-sm text-gray-700">
                <thead class="bg-gray-200">
                <tr>
                    <th class="py-3 px-4">ID</th>
                    <th class="py-3 px-4">Nom</th>
                    <th class="py-3 px-4">Description</th>
                    <th class="py-3 px-4">Date de Début</th>
                    <th class="py-3 px-4">Date de Fin</th>
                    <th class="py-3 px-4">Budget</th>
                    <th class="py-3 px-4">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="project" items="${projects}">
                    <tr class="border-b hover:bg-gray-50">
                        <td class="py-3 px-4">${project.id}</td>
                        <td class="py-3 px-4">${project.name}</td>
                        <td class="py-3 px-4">${project.description}</td>
                        <td class="py-3 px-4">${project.startDate}</td>
                        <td class="py-3 px-4">${project.endDate}</td>
                        <td class="py-3 px-4">${project.budget}</td>
                        <td class="py-3 px-4 space-x-2">
                            <a href="${pageContext.request.contextPath}/projects/details?id=${project.id}"
                               class="text-blue-600 hover:underline">Détails</a>
                            <a href="${pageContext.request.contextPath}/projects/edit?id=${project.id}"
                               class="text-green-600 hover:underline">Modifier</a>
                            <a href="${pageContext.request.contextPath}/projects/delete?id=${project.id}"
                               onclick="return confirm('etes vous sur ?')"
                               class="text-red-600 hover:underline">Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>