<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Ressources</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen p-6">
<%@ include file="/header.jsp" %>
<div class="max-w-4xl mx-auto bg-white p-6 rounded-lg shadow-lg">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-gray-800">Liste des Ressources</h1>
        <a href="${pageContext.request.contextPath}/resources/create"
           class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition duration-200">
            Ajouter une ressource
        </a>
    </div>

    <div class="overflow-x-auto">
        <table class="w-full text-sm text-gray-700">
            <thead class="bg-gray-200">
            <tr>
                <th class="py-3 px-4">ID</th>
                <th class="py-3 px-4">Nom</th>
                <th class="py-3 px-4">Type</th>
                <th class="py-3 px-4">Quantité</th>
                <th class="py-3 px-4">Info Fournisseur</th>
                <th class="py-3 px-4">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="resource" items="${resources}">
                <tr class="border-b hover:bg-gray-50">
                    <td class="py-3 px-4">${resource.id}</td>
                    <td class="py-3 px-4">${resource.name}</td>
                    <td class="py-3 px-4">${resource.type}</td>
                    <td class="py-3 px-4">${resource.quantity}</td>
                    <td class="py-3 px-4">${resource.supplierInfo}</td>
                    <td class="py-3 px-4 space-x-2">
                        <a href="${pageContext.request.contextPath}/resources/edit?id=${resource.id}"
                           class="text-green-600 hover:underline">Modifier</a>
                        <a href="${pageContext.request.contextPath}/resources/delete?id=${resource.id}"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette ressource ?');"
                           class="text-red-600 hover:underline">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>