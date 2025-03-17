<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Modifier une Ressource</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Modifier la Ressource</h1>
<form action="${pageContext.request.contextPath}/resources/update" method="post">
    <input type="hidden" name="id" value="${resource.id}">
    <label>Nom :</label><br>
    <input type="text" name="name" value="${resource.name}" required><br>
    <label>Type :</label><br>
    <input type="text" name="type" value="${resource.type}" required><br>
    <label>Quantité :</label><br>
    <input type="number" name="quantity" value="${resource.quantity}" required><br>
    <label>Informations Fournisseur :</label><br>
    <textarea name="supplierInfo">${resource.supplierInfo}</textarea><br>
    <input type="submit" value="Mettre à jour">
    <a href="${pageContext.request.contextPath}/resources">Retour</a>
</form>
</body>
</html>