<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Liste des Ressources</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Liste des Ressources</h1>
<a href="${pageContext.request.contextPath}/resources/create">Ajouter une ressource</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Type</th>
        <th>Quantité</th>
        <th>Info Fournisseur</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="resource" items="${resources}">
        <tr>
            <td>${resource.id}</td>
            <td>${resource.name}</td>
            <td>${resource.type}</td>
            <td>${resource.quantity}</td>
            <td>${resource.supplierInfo}</td>
            <td>
                <a href="${pageContext.request.contextPath}/resources/edit?id=${resource.id}">Modifier</a>
                <a href="${pageContext.request.contextPath}/resources/delete?id=${resource.id}"
                   onclick="return confirm('Voulez-vous vraiment supprimer cette ressource ?');">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>