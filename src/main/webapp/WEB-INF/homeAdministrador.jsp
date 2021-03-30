<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>homeAdministrador</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
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
    </div>


  </header>
  <main class="page-container"> <!--Ends header -->
    <div class="table">
      <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );
      </script>
      <table id="example" class="display" style="width:100%">
        <thead>
          <tr>
            <th>Acceso</th>
            <th>Nombre</th>
            <th>CURP</th>
            <th>Télefono</th>
            <th>Correo</th>
            <th>Juego realizado</th>
            <th>Nivel de inteligencia emocional</th>
            <th>Nivel de trabajo bajo presión</th>
            <th>Área de interés</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Aceptado</td>
            <td>manuel camacho padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td><button>Boton</button></td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>1111111111</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Ándres Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
            </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>No</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
          <tr>
            <td>Aceptado</td>
            <td>Manuel Camacho Padilla</td>
            <td>CURP1234567890CURP</td>
            <td>777777777</td>
            <td>correo@gcorreo.com</td>
            <td>Si</td>
            <td>Alto</td>
            <td>Bajo</td>
            <td>Comer</td>
          </tr>
        </tbody>   
      </table>
    </div> <!-- Ends Table -->
  </main>
  <footer class="footer"> <!-- Stars footer-->

  </footer> <!--Ends footer-->
</body>
</html>