<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Ressource</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/ressources/create.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
    <h1>Ajouter une Nouvelle Ressource</h1>
    <form action="${pageContext.request.contextPath}/resources" method="post" class="form">
        <div class="form-group">
            <label>Nom :</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label>Type :</label>
            <input type="text" name="type" required>
        </div>
        <div class="form-group">
            <label>Quantité :</label>
            <input type="number" name="quantity" required>
        </div>
        <div class="form-group">
            <label>Informations Fournisseur :</label>
            <textarea name="supplierInfo"></textarea>
        </div>
        <div class="form-actions">
            <input type="submit" value="Créer" class="btn btn-add">
            <a href="${pageContext.request.contextPath}/resources" class="btn btn-back">Retour</a>
        </div>
    </form>
</div>
</body>
</html>