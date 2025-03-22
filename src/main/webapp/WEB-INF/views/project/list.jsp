<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        tbody tr {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        tbody tr:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        th {
            background: rgba(229, 231, 235, 0.9);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        td, th {
            padding: 1rem;
        }

        a[href*="/projects/create"] {
            background: linear-gradient(45deg, #3b82f6, #60a5fa);
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
            transition: all 0.3s ease;
        }

        a[href*="/projects/create"]:hover {
            background: linear-gradient(45deg, #2563eb, #3b82f6);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.6);
        }

        td a {
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            transition: all 0.3s ease;
        }

        td a[href*="/details"] {
            background: linear-gradient(45deg, #3b82f6, #60a5fa);
            color: white;
        }

        td a[href*="/details"]:hover {
            background: linear-gradient(45deg, #2563eb, #3b82f6);
            transform: scale(1.05);
        }

        td a[href*="/edit"] {
            background: linear-gradient(45deg, #10b981, #34d399);
            color: white;
        }

        td a[href*="/edit"]:hover {
            background: linear-gradient(45deg, #059669, #10b981);
            transform: scale(1.05);
        }

        td a[href*="/delete"] {
            background: linear-gradient(45deg, #ef4444, #f87171);
            color: white;
        }

        td a[href*="/delete"]:hover {
            background: linear-gradient(45deg, #dc2626, #ef4444);
            transform: scale(1.05);
        }

        .max-w-5xl {
            background: rgba(255, 255, 255, 0.95);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
        }

        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }

            tbody tr {
                margin-bottom: 1rem;
                display: block;
            }

            td, th {
                display: block;
                text-align: left;
            }

            td.space-x-2 {
                display: flex;
                gap: 0.5rem;
                justify-content: center;
            }
        }
    </style>
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