<%--
  Created by IntelliJ IDEA.
  User: ravmac
  Date: 16/10/19
  Time: 11:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Área restrita - Restaurante</title>
    <asset:stylesheet src="signin.css"/>
</head>

<body class="text-center body-login">
    <form class="form-signin" action="${postUrl ?: '/restaurant/login/authenticate'}" method="POST" id="loginForm" name="loginForm">
        <img class="form-signin" src="https://image.flaticon.com/icons/svg/320/320366.svg" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal form-signin " >Faça login</h1>
        <label for="username" class="sr-only">Username</label>
        <input type="text" name="username" id="username" class="form-control" placeholder="Username">
        <label for="password" class="sr-only">Senha</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="Senha" >
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me" id="remember_me"> Lembrar de mim
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" value="${message(code: 'springSecurity.login.button')}">Login</button>
        <p class="mt-5 mb-3 text-muted">© 2019</p>
    </form>

</body>
</html>