<%--
  Created by IntelliJ IDEA.
  User: ravmac
  Date: 16/10/19
  Time: 17:13
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Área restrita - Restaurante</title>
</head>

<body>
<sec:ifLoggedIn>
    Olá admin
    <a href="/restaurant/logoff">Sair</a>
</sec:ifLoggedIn>
</body>
</html>