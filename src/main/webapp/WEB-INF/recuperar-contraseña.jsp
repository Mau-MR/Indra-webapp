<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Roboto/Roboto-Regular.ttf" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
</head>
<body class="background">
    <div class="page-container ">
        <header>
            <div class="header-login">
                <img src="${pageContext.request.contextPath}/img/logominsaitBlanco.svg" alt="Logo Indra">
                
            </div>
        </header>
        <main class="container-login">
            <div class="login">
                <div class="logo-login">
                    <img src="${pageContext.request.contextPath}/img/Logo-Traum.svg" alt="Logo T">
                </div>
                <form action="LoginAction" class="login-form font-login">
                    <div class="form-login"> 
                        <label for="mail">Tu correo</label>
                        <input type="email" name="user-mail" id="mail" required autocomplete="off"> 
                        <label for="password">Tu contraseña</label>
                        <input type="password" name="user-password" id="password" required autocomplete="off">
                    </div>
                    <div>
                        <div class="forgot-password">
                            <a href="#">¿Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>