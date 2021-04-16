<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>homeAdministrador</title>
  <link rel="preload" href="${pageContext.request.contextPath}/css/normalize.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
  <link rel="preload" href="${pageContext.request.contextPath}/css/styles.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Roboto/Roboto-Regular.ttf" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css"/>
  <!--Tablas></!--> 
  <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
</head>
<body>
    <header class="header"> <!--Stars header -->
        <div class="header-container">
            <div class="logo-home">
                <img src="${pageContext.request.contextPath}/img/logominsaitBlanco.svg" alt="Image logo">
            </div>
            <div class="left">
                <div class="welcome">
                    <p>¡Bienvenido NAME!</p>
                </div>
                <div class="logOut-page">
                    <form action="logout" method="get">
                        <button class="button-page" type="submit">
                            Salir
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </header> <!--Ends header -->

    <main class="page-container">
        <div class="table-bar">
            <div class="select">
                <p>Otra cosa...</p>
            </div>
            <div class="export">
                <button class="button-page">
                    Exportar en excel
                </button>
            </div>
        </div>
        <div class="table">
            <script>
                $(document).ready(function() {
                    $('#example').DataTable();
                } );
            </script>
            <table id="example" class="display" style="width:100%" action="candidatos" method="get">
                <thead>
                    <tr>
                        <td>Nombre</td>
                        <td>CURP</td>
                        <td>Teléfono</td>
                        <td>Correo</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="candidato" items="${candidatosList}">
                    <tr>
                            <td>${candidato.nombre}</td>
                            <td>${candidato.curp}</td>
                            <td>${candidato.telefono}</td>
                            <td>${candidato.correo}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>

        </div> <!-- Ends Table -->
    </main>
    <footer class="footer"> <!-- Stars footer-->

    </footer> <!--Ends footer-->
</body>
</html>