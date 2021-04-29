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
    <link rel="preload" href="${pageContext.request.contextPath}/css/table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
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
    <!--Stars header -->
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
</header>
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            dom: 'Bfrtip',
            select: true,
            scrollY: '50vh',
            scrollX: '50vw',
            scrollCollapse: true,
            paging: false,
            ordering: false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            },
            responsive: {
                details: {
                    renderer: function (api, rowIdx, columns) {
                        var data = $.map(columns, function (col, i) {
                            return col.hidden ?
                                '<tr data-dt-row="' + col.rowIndex + '" data-dt-column="' + col.columnIndex + '">' +
                                '<td>' + col.title + ':' + '</td> ' +
                                '<td>' + col.data + '</td>' +
                                '</tr>' :
                                '';
                        }).join('');

                        return data ?
                            $('<table/>').append(data) :
                            false;
                    }
                }
            },
            buttons: [
                { extend: 'copy', text: 'Copiar' },
                {
                    extend: 'pdfHtml5', text: 'Exportar en PDF', title: 'Lista de candidatos para Minsait',
                    customize: function (doc) {
                        doc.defaultStyle.alignment = 'center';
                        doc.styles.tableHeader.alignment = 'center';
                        doc.styles.tableBodyEven.alignment = 'center';
                        doc.styles.tableBodyOdd.alignment = 'center';
                    },
                    orientation: 'landscape',
                    pageSize: 'LEGAL'
                },
                {
                    extend: 'csv',
                    text: 'Exportar en CSV',
                    charset: 'UTF-8',
                    fieldSeparator: ';',
                    bom: true,
                    filename: 'Lista de Candidatos Minsait'
                },
                {
                    extend: 'excel',
                    text: 'Exportar en Excel',
                    charset: 'UTF-8',
                    fieldSeparator: ';',
                    bom: true,
                    filename: 'Lista de Candidatos Minsait'
                },
                {
                    extend: 'print',
                    text: 'Imprimir todo (no solo seleccionados)',
                    title: 'Lista de candidatos para Minsait',
                    exportOptions: {
                        modifier: {
                            selected: null
                        }
                    }
                }
            ]
        });
    });
</script>
<main class="page-container">
    <table id="example" class="table table-striped table-bordered nowrap" style="width:100%;">
        <thead>
        <tr>
            <div class="space text-justify">
                <th><i class="fas fa-info-circle" style="font-size:1.6rem;"></i></th>
                <th><i class="fas fa-lock-open" style="font-size:1.6rem;"></i></th>
                <th><i class="fas fa-gamepad" style="font-size:1.6rem;"></i></th>
                <th>Acceso</th>
                <th>Nombre</th>
                <th>Apellido paterno</th>
                <th>Apellido materno</th>
                <th>Juego realizado</th>
                <th>Inteligencia emocional</th>
                <th>Trabajo bajo presión</th>
                <th>Correo</th>
                <th>Área de interés</th>
                <th>Número telefónico</th>
                <th>CURP</th>
                <th>Grado académico</th>
                <th>Carrera</th>
                <th>Segunda carrera</th>
                <th>Duración de prueba</th>
            </div>
        </tr>
        </thead>
        <tbody>
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
            <td id="${candidato.curp}" class="minTable-container" style="color: var(--mainColor);"
                onclick="modalDisplay(this.id, ${candidato.score_inteligencia}, ${candidato.score_trabajo})">
                <a href="#" class="file minTable-container"><i class="fas fa-id-card-alt"></i></a>
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
            <div id="modal-container-p_${candidato.curp}" class="modal-container-p">
                <div id="modal-p_${candidato.curp}" class="modal-p modal-close-p">
                    <p class="close-p" onclick="closeModal()">X</p>
                    <div class="modal-text-p" style="font-family: 'Roboto-Regular', sans-serif; width: 90%; display:
                    flex">
                        <div>
                            <h2 style="color: black">Datos del candidato</h2>
                            <p>${candidato.nombre} ${candidato.paterno} ${candidato.materno}</p>
                        </div>

                        <c:choose>
                            <c:when test="${candidato.score_inteligencia > 0}">
                                <div style="width: 13vw;">
                                    <canvas id="inteligencia_canva_${candidato.curp}"></canvas>
                                </div>
                                <div style="width: 13vw;">
                                    <canvas id="trabajo_canva_${candidato.curp}"></canvas>
                                </div>
                                <div style="width: 30vw;">
                                    <canvas id="comparacion_canva_${candidato.curp}"></canvas>
                                </div>
                            </c:when>
                        </c:choose>

                    </div> <!-- Ends modal-text-p-->
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