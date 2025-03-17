<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Ressource</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Ajouter une Nouvelle Ressource</h1>
<form action="${pageContext.request.contextPath}/resources" method="post">
    <label>Nom :</label><br>
    <input type="text" name="name" required><br>
    <label>Type :</label><br>
    <input type="text" name="type" required><br>
    <label>Quantité :</label><br>
    <input type="number" name="quantity" required><br>
    <label>Informations Fournisseur :</label><br>
    <textarea name="supplierInfo"></textarea><br>
    <input type="submit" value="Créer">
    <a href="${pageContext.request.contextPath}/resources">Retour</a>
</form>
</body>
</html>