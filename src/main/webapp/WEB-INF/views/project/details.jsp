<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Détails du Projet</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0e7ff, #f3f4f6);
            min-height: 100vh;
            padding: 1rem;
            margin: 0;
        }

        .container {
            max-width: 80rem;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(8px);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
        }

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        h1 {
            font-size: 1.875rem;
            font-weight: 700;
            background: linear-gradient(90deg, #1e3a8a, #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 0;
        }

        h2 {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1f2937;
            margin: 0;
        }

        h3 {
            font-size: 1.125rem;
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .project-info p {
            background: rgba(255, 255, 255, 0.7);
            padding: 0.75rem;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
            margin-bottom: 0.5rem;
            word-wrap: break-word;
        }

        .project-info p:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .table-wrapper {
            overflow-x: auto;
            margin-bottom: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 0.75rem;
            text-align: left;
        }

        th {
            background: rgba(229, 231, 235, 0.9);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .task-row {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .task-row:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .resource-row {
            background: none;
            border: none;
        }

        .nested-table-wrapper {
            padding: 1rem;
        }

        .nested-table {
            width: 100%;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 8px;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
            margin: 0;
        }

        .nested-table th {
            background: rgba(243, 244, 246, 0.9);
            padding: 0.5rem 0.75rem;
        }

        .nested-table td {
            padding: 0.5rem 0.75rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .nested-table tr:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 15px;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            text-align: center;
        }

        .btn-add {
            background: linear-gradient(45deg, #3b82f6, #60a5fa);
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
        }

        .btn-add:hover {
            background: linear-gradient(45deg, #2563eb, #3b82f6);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.6);
        }

        .btn-edit {
            background: linear-gradient(45deg, #10b981, #34d399);
        }

        .btn-edit:hover {
            background: linear-gradient(45deg, #059669, #10b981);
            transform: scale(1.05);
        }

        .btn-delete {
            background: linear-gradient(45deg, #ef4444, #f87171);
        }

        .btn-delete:hover {
            background: linear-gradient(45deg, #dc2626, #ef4444);
            transform: scale(1.05);
        }

        .btn-resource {
            background: linear-gradient(45deg, #8b5cf6, #a78bfa);
        }

        .btn-resource:hover {
            background: linear-gradient(45deg, #7c3aed, #8b5cf6);
            transform: scale(1.05);
        }

        .btn-back {
            background: linear-gradient(45deg, #6b7280, #9ca3af);
            margin-top: 1.5rem;
            box-shadow: 0 4px 15px rgba(107, 114, 128, 0.4);
            display: inline-block;
        }

        .btn-back:hover {
            background: linear-gradient(45deg, #4b5563, #6b7280);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(107, 114, 128, 0.6);
        }

        .actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
            justify-content: flex-start;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
            }

            .table-wrapper {
                overflow-x: auto;
            }

            table {
                display: block;
                width: 100%;
            }

            thead, tbody, tr, th, td {
                display: block;
                width: 100%;
            }

            th, td {
                box-sizing: border-box;
            }

            th {
                display: none;
            }

            .task-row {
                margin-bottom: 1rem;
                border-radius: 8px;
                padding: 0.5rem;
            }

            .task-row td {
                padding: 0.5rem;
                position: relative;
            }

            .task-row td::before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                margin-bottom: 0.25rem;
                color: #1f2937;
            }

            .task-row td:nth-child(1)::before { content: "ID"; }
            .task-row td:nth-child(2)::before { content: "Description"; }
            .task-row td:nth-child(3)::before { content: "Date de Début"; }
            .task-row td:nth-child(4)::before { content: "Date de Fin"; }
            .task-row td:nth-child(5)::before { content: "Actions"; }

            .actions {
                justify-content: center;
                padding: 0.5rem 0;
            }

            .resource-row td {
                padding: 0;
            }

            .nested-table-wrapper {
                padding: 0.5rem;
            }

            .nested-table {
                display: block;
                width: 100%;
            }

            .nested-table thead, .nested-table tbody, .nested-table tr, .nested-table th, .nested-table td {
                display: block;
                width: 100%;
            }

            .nested-table th {
                display: none;
            }

            .nested-table td {
                padding: 0.5rem;
                position: relative;
            }

            .nested-table td::before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                margin-bottom: 0.25rem;
                color: #374151;
            }

            .nested-table td:nth-child(1)::before { content: "ID"; }
            .nested-table td:nth-child(2)::before { content: "Nom"; }
            .nested-table td:nth-child(3)::before { content: "Type"; }
            .nested-table td:nth-child(4)::before { content: "Quantité utilisée"; }
            .nested-table td:nth-child(5)::before { content: "Info Fournisseur"; }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${project.name}</h1>
    <div class="project-info">
        <p><strong>Description :</strong> ${project.description}</p>
        <p><strong>Date de Début :</strong> ${project.startDate}</p>
        <p><strong>Date de Fin :</strong> ${project.endDate}</p>
        <p><strong>Budget :</strong> ${project.budget}</p>
    </div>

    <div class="header">
        <h2>Tâches</h2>
        <a href="${pageContext.request.contextPath}/tasks/create?projectId=${project.id}" class="btn btn-add">
            Ajouter une tâche
        </a>
    </div>

    <div class="table-wrapper">
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
                <tr class="task-row">
                    <td>${task.id}</td>
                    <td>${task.description}</td>
                    <td>${task.startDate}</td>
                    <td>${task.endDate}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/tasks/edit?id=${task.id}" class="btn btn-edit">Modifier</a>
                        <a href="${pageContext.request.contextPath}/tasks/delete?id=${task.id}&projectId=${project.id}"
                           onclick="return confirm('Voulez-vous vraiment supprimer cette tâche ?');"
                           class="btn btn-delete">Supprimer</a>
                        <a href="${pageContext.request.contextPath}/tasks/addResource?taskId=${task.id}&projectId=${project.id}"
                           class="btn btn-resource">Ajouter une ressource</a>
                    </td>
                </tr>
                <tr class="resource-row">
                    <td colspan="5">
                        <div class="nested-table-wrapper">
                            <h3>Ressources associées</h3>
                            <table class="nested-table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Type</th>
                                    <th>Quantité utilisée</th>
                                    <th>Info Fournisseur</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="resource" items="${task.resources}">
                                    <tr>
                                        <td>${resource.id}</td>
                                        <td>${resource.name}</td>
                                        <td>${resource.type}</td>
                                        <td>${resource.quantityUsed}</td>
                                        <td>${resource.supplierInfo}</td>
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

    <a href="${pageContext.request.contextPath}/projects" class="btn btn-back">
        Retour à la liste des projets
    </a>
</div>
</body>
</html>