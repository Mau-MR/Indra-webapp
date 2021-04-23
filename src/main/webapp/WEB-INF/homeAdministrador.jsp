<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <title>Administración</title>
    <link rel="preload" href="${pageContext.request.contextPath}/css/normalize.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
    <link rel="preload" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Roboto/Roboto-Regular.ttf" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css"/>
    <!-- sweetalert2 -->
    <script type="text/javascript" charset="utf8" src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- Gráficas -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
                <h2>Administración</h2>
            </div>

            <div class="right-container">
                <div class="right">
                    <div class="welcome">
                        <p id="${id_cuenta}">¡Bienvenido ${nombre}!</p>
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
                    scrollY: 400;
                    select: true;
                    paging: false;
                } );

            </script>

            <table id="example" class="display table table-striped table-bordered text-justify" style="width:98%" >
                <thead>
                <tr>
                    <div class="space text-justify">
                        <th>Selección</th>
                        <th>Acceso</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Correo</th>
                        <th>Juego realizado</th>
                        <th>Inteligencia emocional</th>
                        <th>Trabajo bajo presión</th>
                        <th>Área de interés</th>
                        <th>Ver detalles</th>
                    </div>
                </tr>
                </thead>

            <tbody>
            <c:forEach var="candidato" items="${candidatosList}" varStatus="loop">
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
                                <c:choose>
                                    <c:when test="${candidato.acceso == true}">
                                        <input id="${candidato.curp}" type="checkbox" class="switch-input" checked>
                                        <label for="${candidato.curp}" class="switch-label"></label>
                                    </c:when>
                                    <c:when test="${candidato.acceso == false}">
                                        <input id="${candidato.curp}" type="checkbox" class="switch-input">
                                        <label for="${candidato.curp}" class="switch-label"></label>
                                    </c:when>
                                </c:choose>
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
                                ${candidato.paterno} ${candidato.materno}
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
                            <a href="#" class="cta" id="${candidato.curp}">Info</a>
                        </div>
                    </td> <!--Ends box-->
                </tr> <!-- Ends row -->
            </c:forEach>
            </tbody> <!-- Ends table body -->
        </table>
    </div> <!-- Ends Table -->

        <div class="modal-container-p">
            <div class="modal-p modal-close-p">
                <p class="close-p">X</p>
                <div class="modal-text-p" style="font-family: Roboto-Regular;">
                    <h2>Datos del candidato</h2>
                    <br>
                    <fieldset>
                        <legend>Datos personales</legend>

                        <table id="example" style="width:98%" >
                            <thead>
                            <tr>
                                <div class="space text-justify">
                                    <th>Dato</th>
                                    <th>Información</th>
                                </div>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="candidato" items="${candidatosList}" varStatus="loop">
                            <tr>
                                <td style="width: 50%">
                                    <div class="minTable-container">
                                        Nombre(s):
                                    </div>
                                </td> <!--Ends box-->
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.nombre}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Apellido paterno:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.paterno}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Apellido materno (opcional):
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.materno}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        CURP:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.curp}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Correo:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.correo}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Teléfono:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.telefono}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Grado académico:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.grado_academico}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Carrera (opcional):
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.primera_carrera}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Segunda carrera (opcional):
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.segunda_carrera}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Área de interés:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.interes}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>
                            </c:forEach>
                            </tbody> <!-- Ends table body -->
                        </table>
                    </fieldset>
                    <br>

                    <fieldset>
                        <legend>Datos de la prueba</legend>
                        <table id="example" style="width:98%" >
                            <thead>
                            <tr>
                                <div class="space text-justify">
                                    <th>Dato</th>
                                    <th>Información</th>
                                </div>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="candidato" items="${candidatosList}" varStatus="loop">
                            <tr>
                                <td style="width: 50%">
                                    <div class="minTable-container">
                                        Juego realizado:
                                    </div>
                                </td> <!--Ends box-->
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.status}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Duración:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        Relleno
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Trabajo bajo presión:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.skill_trabajo}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>

                            <tr>
                                <td>
                                    <div class="minTable-container">
                                        Inteligencia emocional:
                                    </div>
                                </td>
                                <td>
                                    <div class="minTable-container">
                                        ${candidato.skill_inteligencia}
                                    </div>
                                </td> <!--Ends box-->
                            </tr>
                            </c:forEach>
                            </tbody> <!-- Ends table body -->
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </main>

<script src="${pageContext.request.contextPath}/js/homeAdministrador.js"></script>
<script src="${pageContext.request.contextPath}/js/modal-page.js"></script>

</body>
</html>