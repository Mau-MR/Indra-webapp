<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <title>Administrador</title>
    <!-- StylesSheets and Fonts -->
    <link rel="preload" href="${pageContext.request.contextPath}/css/stylesAdmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesAdmin.css">
    <link rel="preload" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
    <link rel="preload" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="preload" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
    <!-- SweetAlert2 -->
    <script type="text/javascript" charset="utf8" src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Tables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.7/css/responsive.dataTables.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/responsive/2.2.7/js/responsive.bootstrap.min.js"></script>
</head>

<body>
<header class="header">
    <div class="header-left">
        <img class="header-left__logo-img" src="${pageContext.request.contextPath}/img/logominsaitBlanco.svg" alt="Minsait Image">
        <h2 class="header-left__role-h2">Administración</h2>
    </div>
    <div class="header-right">
        <div class="header-right__welcome-p">
            <p id="${id_cuenta}">¡Bienvenido ${nombre}!</p>
        </div>
        <button class="header-right__logout-button" action="logout" method="get" type="submit">Salir</button>
    </div>
</header>
<main class="page-container">
    <table id="example" class="page-container__table table-striped table-bordered nowrap" style="width:100%;">
        <thead class="page-container__table-thead">
        <tr>
            <th><i class="fas fa-info-circle page-container__table-thead--icon"></i>
            </th>
            <th><i class="fas fa-lock-open page-container__table-thead--icon"></i>
            </th>
            <th><i class="fas fa-gamepad page-container__table-thead--icon"></i>
            </th>
            <th>Acceso</th>
            <th>Nombre</th>
            <th>Apellido paterno</th>
            <th>Apellido materno</th>
            <th>Correo</th>
            <th>Juego realizado</th>
            <th>Inteligencia emocional</th>
            <th>Trabajo bajo presión</th>
            <th>Área de interés</th>
            <th>Número telefónico</th>
            <th>CURP</th>
            <th>Grado académico</th>
            <th>Carrera</th>
            <th>Segunda carrera</th>
            <th>Duración de prueba</th>
        </tr>
        </thead>
        <tbody class="page-container__table-tbody">
        <c:forEach var="candidato" items="${candidatosList}" varStatus="loop">
        <tr>
            <td></td>
            <!--Ends box-->
            <td>
                <div class="switch">
                    <c:choose>
                        <c:when test="${candidato.acceso == true}">
                            <input id="${candidato.curp}" type="checkbox" class="switch-input switch-1" onclick="box()" checked>
                            <label for="${candidato.curp}" class="switch-label"></label>
                        </c:when>
                        <c:when test="${candidato.acceso == false}">
                            <input id="${candidato.curp}" type="checkbox" class="switch-input switch-1" onclick="box()">
                            <label for="${candidato.curp}" class="switch-label"></label>
                        </c:when>
                    </c:choose>
                </div>
            </td>
            <td id="${candidato.curp}" class="page-container__table-tbody--td"
                style="color: var(--mainColor);" onclick="modalDisplay(this.id, ${candidato.score_inteligencia}, ${candidato.score_trabajo})">
                <a href="#"><i class="fas fa-id-card-alt page-container__table-tbody--td-icon"></i></a>
            </td>
            <!--Ends box-->
            <td class="${candidato.curp}">
                <c:choose>
                    <c:when test="${candidato.acceso == true}">
                        Sí
                    </c:when>
                    <c:when test="${candidato.acceso == false}">
                        No
                    </c:when>
                </c:choose>
            </td>
            <!--Ends box-->
            <td>${candidato.nombre}</td>
            <!--Ends box-->
            <td>${candidato.paterno}</td>
            <!--Ends box-->
            <td>${candidato.materno}</td>
            <!--Ends box-->
            <td>${candidato.correo}</td>
            <!--Ends box-->
            <td>
                <c:choose>
                    <c:when test="${candidato.status == true}">
                        Sí
                    </c:when>
                    <c:when test="${candidato.status == false}">
                        No
                    </c:when>
                </c:choose>
            </td>
            <!--Ends box-->
            <td>${candidato.skill_inteligencia}</td>
            <!--Ends box-->
            <td>${candidato.skill_trabajo}</td>
            <!--Ends box-->
            <td>${candidato.interes}</td>
            <!--Ends box-->
            <td>${candidato.telefono}</td>
            <!--Ends box-->
            <td>${candidato.curp}</td>
            <!--Ends box-->
            <td>${candidato.grado_academico}</td>
            <!--Ends box-->
            <td>${candidato.primera_carrera}</td>
            <!--Ends box-->
            <td>${candidato.segunda_carrera}</td>
            <!--Ends box-->
            <td>${candidato.duracion}</td>
            <!--Ends box-->
            <div id="modal-container-p_${candidato.curp}" class="modal-container">
                <div id="modal-p_${candidato.curp}" class="modal-container__square modal-container__close">
                    <p class="close-p" onclick="closeModal()">X</p>
                    <c:choose>
                        <c:when test="${candidato.status == true}">
                            <div class="modal-text-p">
                                <!------------------------------------------------------------------------------------------------------------------------>
                                <div class="modal-text-p__person">
                                    <h2>Datos del candidato:</h2>
                                    <p>${candidato.nombre} ${candidato.paterno} ${candidato.materno}</p>
                                </div>
                                <div class="modal-charts">
                                    <div class="modal-charts__canvas--circle">
                                        <canvas id="inteligencia_canva_${candidato.curp}"></canvas>
                                    </div>
                                    <div class="modal-charts__canvas--comparative">
                                        <canvas id="comparacion_canva_${candidato.curp}"></canvas>
                                    </div>
                                    <div class="modal-charts__canvas--circle">
                                        <canvas id="trabajo_canva_${candidato.curp}"></canvas>
                                    </div>
                                </div>

                                <h1 class="modal-softskill__title-h1">Durante el juego el candidato
                                    respondió así las situaciones:</h1>


                                <!--Stars Emotional Intelligence -->
                                <h2 class="modal-softskill__title-h2">Inteligencia Emocional</h2>
                                <!--Start client -->
                                <h3 class="modal-softskill__title-h3">Primer Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                ${candidato.preguntas[0]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[0] != '-1'}">
                                                            ${candidato.respuestas[0]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[0] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[0] != '-1'}">
                                                            ${candidato.tiempos[0]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[0] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                ${candidato.preguntas[1]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[1] != '-1'}">
                                                            ${candidato.respuestas[1]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[1] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[1] != '-1'}">
                                                            ${candidato.tiempos[1]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[1] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                ${candidato.preguntas[2]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[2] != '-1'}">
                                                            ${candidato.respuestas[2]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[2] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[2] != '-1'}">
                                                            ${candidato.tiempos[2]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[2] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->

                                <h3 class="modal-softskill__title-h3">Segundo Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[3]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[3] != '-1'}">
                                                            ${candidato.respuestas[3]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[3] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[3] != '-1'}">
                                                            ${candidato.tiempos[3]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[3] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[4]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[4] != '-1'}">
                                                            ${candidato.respuestas[4]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[4] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[4] != '-1'}">
                                                            ${candidato.tiempos[4]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[4] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[5]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[5] != '-1'}">
                                                            ${candidato.respuestas[5]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[5] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[5] != '-1'}">
                                                            ${candidato.tiempos[5]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[5] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->

                                <h3 class="modal-softskill__title-h3">Tercer Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[6]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[6] != '-1'}">
                                                            ${candidato.respuestas[6]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[6] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[6] != '-1'}">
                                                            ${candidato.tiempos[6]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[6] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[7]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[7] != '-1'}">
                                                            ${candidato.respuestas[7]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[7] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[7] != '-1'}">
                                                            ${candidato.tiempos[7]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[7] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[8]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                        <c:choose>
                                                        <c:when test="${candidato.respuestas[8] != '-1'}">
                                                            ${candidato.respuestas[8]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[8] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[8] != '-1'}">
                                                            ${candidato.tiempos[8]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[8] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->

                                <h3 class="modal-softskill__title-h3">Cuarto Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[9]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    1<c:choose>
                                                        <c:when test="${candidato.respuestas[9] != '-1'}">
                                                            ${candidato.respuestas[9]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[9] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[9] != '-1'}">
                                                            ${candidato.tiempos[9]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[9] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[10]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[10] != '-1'}">
                                                            ${candidato.respuestas[10]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[10] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[10] != '-1'}">
                                                            ${candidato.tiempos[10]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[10] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[11]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    2<c:choose>
                                                        <c:when test="${candidato.respuestas[11] != '-1'}">
                                                            ${candidato.respuestas[11]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[11] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[11] != '-1'}">
                                                            ${candidato.tiempos[11]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[11] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->

                                <h3 class="modal-softskill__title-h3">Quinto Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[12]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[12] != '-1'}">
                                                            ${candidato.respuestas[12]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[12] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[12] != '-1'}">
                                                            ${candidato.tiempos[12]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[12] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[13]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[13] != '-1'}">
                                                            ${candidato.respuestas[13]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[13] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[13] != '-1'}">
                                                            ${candidato.tiempos[13]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[13] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[14]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[14] != '-1'}">
                                                            ${candidato.respuestas[14]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[14] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[14] != '-1'}">
                                                            ${candidato.tiempos[14]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[14] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->

                                <h3 class="modal-softskill__title-h3">Sexto Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[15]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[15] != '-1'}">
                                                            ${candidato.respuestas[15]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[15] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[15] != '-1'}">
                                                            ${candidato.tiempos[15]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[15] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[16]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[16] != '-1'}">
                                                            ${candidato.respuestas[16]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[16] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[16] != '-1'}">
                                                            ${candidato.tiempos[16]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[16] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[17]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[17] != '-1'}">
                                                            ${candidato.respuestas[17]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[17] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[17] != '-1'}">
                                                            ${candidato.tiempos[17]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[17] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->

                                <h3 class="modal-softskill__title-h3">Séptimo Cliente</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[18]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[18] != '-1'}">
                                                            ${candidato.respuestas[18]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[18] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[18] != '-1'}">
                                                            ${candidato.tiempos[18]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[18] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[19]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[19] != '-1'}">
                                                            ${candidato.respuestas[19]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[19] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[19] != '-1'}">
                                                            ${candidato.tiempos[19]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[19] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                    <!--Start Emotional Intelligence Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Pregunta:</span>
                                            <p>
                                                    ${candidato.preguntas[20]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Respuesta:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[20] != '-1'}">
                                                            ${candidato.respuestas[20]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[20] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[20] != '-1'}">
                                                            ${candidato.tiempos[20]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[20] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Emotional Intelligence Box-->
                                </div>
                                <!--Ends client -->


                                <!--Stars Work Under Pressure-->
                                <h2 class="modal-softskill__title-h2">Trabajo bajo presión</h2>
                                <!--Start Work Under Pressure -->
                                <h3 class="modal-softskill__title-h3">Primera Situación</h3>
                                <div class="modal-text-softskill">
                                    <!--Start Work Under Pressure Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Situación:</span>
                                            <p>
                                                ${candidato.preguntas[21]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Decisión:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[21] != '-1'}">
                                                            ${candidato.respuestas[21]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[21] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[21] != '-1'}">
                                                            ${candidato.tiempos[21]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[21] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Work Under Pressure Box-->
                                    <!--Start Work Under Pressure Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Situación:</span>
                                            <p>
                                                ${candidato.preguntas[22]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Decisión:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[22] != '-1'}">
                                                            ${candidato.respuestas[22]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[22] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[22] != '-1'}">
                                                            ${candidato.tiempos[22]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[22] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Work Under Pressure Box-->
                                    <!--Start Work Under Pressure Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Situación:</span>
                                            <p>
                                                ${candidato.preguntas[23]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Decisión:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[23] != '-1'}">
                                                            ${candidato.respuestas[23]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[23] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[23] != '-1'}">
                                                            ${candidato.tiempos[23]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[23] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Work Under Pressure Box-->
                                    <!--Start Work Under Pressure Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Situación:</span>
                                            <p>
                                                    ${candidato.preguntas[24]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Decisión:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[24] != '-1'}">
                                                            ${candidato.respuestas[24]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[24] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[24] != '-1'}">
                                                            ${candidato.tiempos[24]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[24] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Work Under Pressure Box-->
                                    <!--Start Work Under Pressure Box-->
                                    <div class="softskill">
                                        <div class="softskill__situation">
                                            <span>Situación:</span>
                                            <p>
                                                    ${candidato.preguntas[25]}
                                            </p>
                                        </div>
                                        <div class="softskill__parameter">
                                            <div class="softskill__parameter--answer">
                                                <span>Decisión:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.respuestas[25] != '-1'}">
                                                            ${candidato.respuestas[25]}
                                                        </c:when>
                                                        <c:when test="${candidato.respuestas[25] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="softskill__parameter--time">
                                                <span>Tiempo:</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${candidato.tiempos[25] != '-1'}">
                                                            ${candidato.tiempos[25]}
                                                        </c:when>
                                                        <c:when test="${candidato.tiempos[25] == '-1'}">
                                                            No respondió
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ends Work Under Pressure Box-->
                                </div>
                                <!--Ends Section per softskill-->

                                <!--Activities Inside the game-->
                                <h2 class="modal-softskill__title-h2">De las actividades disponibles el candidato
                                    realizadó:</h2>
                                <div class="modal-softskill__activities">
                                    <span class="modal-softskill__activities--span">${candidato.actividades}/15</span>
                                </div>


                            </div> <!-- Ends modal-text-p -->
                        </c:when>
                        <c:when test="${candidato.status == false}">
                            <div class="modal-text-p">
                                <!-- Start second modal-->
                                <div class="modal-text-p__person">
                                    <h2>Datos del candidato:</h2>
                                    <p>${candidato.nombre} ${candidato.paterno} ${candidato.materno}</p>
                                    <h1 class="modal-softskill__title-h1">El Candidato no realizado o finalizado la prueba</h1>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <!--Ends box-->
        </tr>
        <!--Ends row-->
        </c:forEach>
        </tbody> <!-- Ends table body -->
    </table>
</main>
</body>
<script src="${pageContext.request.contextPath}/js/charts.js"></script>
<script src="${pageContext.request.contextPath}/js/autorizacion.js"></script>
<script src="${pageContext.request.contextPath}/js/modal-page.js"></script>

</html>