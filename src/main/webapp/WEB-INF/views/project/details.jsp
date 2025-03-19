<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Détails du Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .nested-table { margin: 10px 0 0 20px; width: 90%; }
    </style>
</head>
<body class="bg-gray-100 min-h-screen p-6">
<div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-lg">
    <h1 class="text-3xl font-bold text-gray-800 mb-4">${project.name}</h1>
    <div class="space-y-2 mb-6">
        <p><strong class="text-gray-700">Description :</strong> ${project.description}</p>
        <p><strong class="text-gray-700">Date de Début :</strong> ${project.startDate}</p>
        <p><strong class="text-gray-700">Date de Fin :</strong> ${project.endDate}</p>
        <p><strong class="text-gray-700">Budget :</strong> ${project.budget}</p>
    </div>

    <div class="flex justify-between items-center mb-4">
        <h2 class="text-xl font-semibold text-gray-800">Tâches</h2>
        <a href="${pageContext.request.contextPath}/tasks/create?projectId=${project.id}"
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
                           class="text-blue-600 hover:underline">Modifier</a>
                        <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${project.id}"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');"
                           class="text-red-600 hover:underline">Supprimer</a>
                        <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${project.id}"
                           class="text-green-600 hover:underline">Ajouter une ressource</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="p-4">
                        <h3 class="text-lg font-medium text-gray-700 mb-2">Ressources associées</h3>
                        <div class="overflow-x-auto">
                            <table class="w-full text-sm text-gray-600 nested-table">
                                <thead class="bg-gray-100">
                                <tr>
                                    <th class="py-2 px-3">ID</th>
                                    <th class="py-2 px-3">Nom</th>
                                    <th class="py-2 px-3">Type</th>
                                    <th class="py-2 px-3">Quantité utilisée</th> <!-- Updated header -->
                                    <th class="py-2 px-3">Info Fournisseur</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="resource" items="${task.resources}">
                                    <tr class="border-b hover:bg-gray-50">
                                        <td class="py-2 px-3">${resource.id}</td>
                                        <td class="py-2 px-3">${resource.name}</td>
                                        <td class="py-2 px-3">${resource.type}</td>
                                        <td class="py-2 px-3">${resource.quantityUsed}</td> <!-- Updated to quantityUsed -->
                                        <td class="py-2 px-3">${resource.supplierInfo}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/projects"
       class="inline-block mt-6 bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600 transition duration-200">
        Retour à la liste des projets
    </a>
</div>
</body>
</html>