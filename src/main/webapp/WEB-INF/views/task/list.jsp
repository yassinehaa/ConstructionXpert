<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen p-6">
<div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-lg">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-gray-800">Liste des Tâches du Projet ${projectId}</h1>
        <a href="${pageContext.request.contextPath}/tasks/create?projectId=${projectId}"
           class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition duration-200">
            Ajouter une tâche
        </a>
    </div>

    <div class="overflow-x-auto">
        <table class="w-full text-sm text-gray-700">
            <thead class="bg-gray-200">
            <tr>
                <th class="py-3 px-4">ID</th>
                <th class="py-3 px-4">Description</th>
                <th class="py-3 px-4">Date de Début</th>
                <th class="py-3 px-4">Date de Fin</th>
                <th class="py-3 px-4">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr class="border-b hover:bg-gray-50">
                    <td class="py-3 px-4">${task.id}</td>
                    <td class="py-3 px-4">${task.description}</td>
                    <td class="py-3 px-4">${task.startDate}</td>
                    <td class="py-3 px-4">${task.endDate}</td>
                    <td class="py-3 px-4 space-x-2">
                        <a href="${pageContext.request.contextPath}/tasks/edit?id=${task.id}"
                           class="text-green-600 hover:underline">Modifier</a>
                        <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${projectId}"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');"
                           class="text-red-600 hover:underline">Supprimer</a>
                        <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${projectId}"
                           class="text-blue-600 hover:underline">Ajouter une ressource</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/projects"
       class="inline-block mt-6 bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600 transition duration-200">
        Retour aux projets
    </a>
</div>
</body>
</html>