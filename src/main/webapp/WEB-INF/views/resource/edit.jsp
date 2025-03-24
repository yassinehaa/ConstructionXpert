<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Modifier une Ressource</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/ressources/edit.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
    <h1>Modifier la Ressource</h1>
    <form action="${pageContext.request.contextPath}/resources/update" method="post" class="form">
        <input type="hidden" name="id" value="${resource.id}">
        <div class="form-group">
            <label>Nom :</label>
            <input type="text" name="name" value="${resource.name}" required>
        </div>
        <div class="form-group">
            <label>Type :</label>
            <input type="text" name="type" value="${resource.type}" required>
        </div>
        <div class="form-group">
            <label>Quantité :</label>
            <input type="number" name="quantity" value="${resource.quantity}" required>
        </div>
        <div class="form-group">
            <label>Informations Fournisseur :</label>
            <textarea name="supplierInfo">${resource.supplierInfo}</textarea>
        </div>
        <div class="form-actions">
            <input type="submit" value="Mettre à jour" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/resources" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>