<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Tâche</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
    <h1 class="text-2xl font-bold text-gray-800 mb-6 text-center">Ajouter une Nouvelle Tâche</h1>
    <form action="${pageContext.request.contextPath}/tasks" method="post" class="space-y-4">
        <input type="hidden" name="projectId" value="${projectId}">
        <div>
            <label class="block text-gray-700 font-medium mb-1">Description :</label>
            <textarea name="description" required
                      class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 h-24 resize-y"></textarea>
        </div>
        <div>
            <label class="block text-gray-700 font-medium mb-1">Date de Début :</label>
            <input type="date" name="startDate" required
                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div>
            <label class="block text-gray-700 font-medium mb-1">Date de Fin :</label>
            <input type="date" name="endDate" required
                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
        </div>
        <div class="flex space-x-4 mt-6">
            <input type="submit" value="Créer"
                   class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition duration-200 cursor-pointer">
            <a href="${pageContext.request.contextPath}/tasks?projectId=${projectId}"
               class="w-full bg-gray-500 text-white py-2 rounded-md hover:bg-gray-600 transition duration-200 text-center">Retour</a>
        </div>
    </form>
</div>
</body>
</html>