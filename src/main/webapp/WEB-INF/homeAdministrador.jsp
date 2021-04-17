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
            <p>Administración</p>
        </div>

        <div class="right-container">
            <div class="right">
                <div class="welcome">
                    <p>¡Bienvenido ${nombre}!</p>
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

    </div> <!-- Ends header-container -->
</header> <!--Ends header -->

<main class="page-container">
    <div class="table-bar">
        <div class="export">
            <button class="button-page">
                Seleccionar todo
            </button>
        </div>

        <div class="export">
            <button class="button-page">
                Borrar selección
            </button>
        </div>

        <div class="export">
            <button class="button-page">
                Exportar selección en excel
            </button>
        </div>

        <div class="export">
            <button class="button-page">
                Exportar individual en PDF
            </button>
        </div>

    </div>

    <div class="table">
        <script>
            $(document).ready(function() {
                $('#example').DataTable();
            } );
        </script>

        <table id="example" class="display" style="width:100%">
            <thead>
            <tr>
                <th>Selección</th>
                <th>Acceso</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Juego realizado</th>
                <th>Inteligencia emocional</th>
                <th>Trabajo bajo presión</th>
                <th>Área de interés</th>
                <th>Ver detalles</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="candidato" items="${candidatosList}">
                <tr>
                    <td>
                        <div class="minTable-container">
                            <input type="checkbox" id="select">
                            <label for="select"></label>
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                            <div class="switch">
                                <input id="switch-1" type="checkbox" class="switch-input">
                                <label for="switch-1" class="switch-label"></label>
                            </div>
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                                ${candidato.nombre}
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                                ${candidato.correo}
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                            <c:choose>
                                <c:when test="${candidato.status == true}">
                                    Sí
                                </c:when>
                                <c:when test="${candidato.status == false}">
                                    No
                                </c:when>
                            </c:choose>
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                                ${candidato.skill_inteligencia}
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                                ${candidato.skill_trabajo}
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                                ${candidato.interes}
                        </div>
                    </td> <!--Ends box-->
                    <td>
                        <div class="minTable-container">
                            <a href="#registro">Info</a>
                        </div>
                    </td> <!--Ends box-->
                </tr>
            </c:forEach>
            </tbody> <!-- Ends table body -->
        </table>
    </div> <!-- Ends Table -->
</main>
<footer class="footer"> <!-- Stars footer -->

</footer> <!--Ends footer-->
</body>
</html>