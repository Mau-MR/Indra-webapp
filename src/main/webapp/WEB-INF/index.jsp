<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <title>Game</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Roboto/Roboto-Regular.ttf" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
</head>
<body>
<div id="particles-js">
    <script src="${pageContext.request.contextPath}/js/particles.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <main>
        <div class="login-container">
            <div class="img-login">
                <img src="${pageContext.request.contextPath}/img/logominsaitBlanco.svg" alt="Logo Indra">
                <p>Prueba psicométrica</p>
            </div>
            <form action="login" method="POST" class="login-form"> <!-- Starts LoginAction -->
                <div class="input-login">
                    <label for="mail">Tu correo:</label>
                    <input type="email" name="mail" id="mail" autocomplete="off" class="inputL"> <!--required -->
                    <label for="password">Tu contraseña:</label>
                    <div class="inputB inputL">
                        <input type="password" name="user-password" id="password" autocomplete="off"> <!--required -->
                        <i class="fas fa-eye" id="togglePassword"></i>
                    </div>
                </div>
                <div class="buttons-login">
                    <button class="my-button-login">Iniciar Sesión<i class="fas fa-sign-in-alt"></i></button>
                    <a href="#registro" class="my-button-login">Registrarse<i class="fas fa-user-plus"></i></a> <!--#registro-->
                    <div id="registro" class="modal"> <!--Starts Modal -->
                        <div class="modal-container">
                            <a href="#" class="icon-modal"><i class="fas fa-chevron-left"></i></a>
                            <form action="registro" method="POST" id="form-registro">  <!-- Starts LogUpAction -->
                                <div class="grid-columns">
                                    <section class="section-modal">
                                        <h2>Información personal</h2>
                                        <div class="column-one">
                                            <div class="item-grid">
                                                <label for="nombre">Nombre:</label>
                                                <input type="text" id="nombre" name="nombre">
                                            </div>
                                            <div class="item-grid">
                                                <label for="apellido_paterno">Apellido paterno:</label>
                                                <input type="text" id="apellido_paterno" name="apellido_paterno">
                                            </div>
                                            <div class="item-grid">
                                                <label for="apellido_materno">Apellido materno:</label>
                                                <input type="text" id="apellido_materno"  name="apellido_materno"
                                                       placeholder="Opcional">
                                            </div>
                                            <div class="item-grid">
                                                <label for="curp">CURP:</label>
                                                <input type="text" id="curp" name="curp" oninput="validarCURP(this)">
                                                <pre id="resultadoCURP" class="resultado ok"></pre>
                                                <!-- FALTA MEJORAR EL CODIGO -->
                                            </div>
                                        </div> <!-- Ends column-one -->
                                    </section>

                                    <section class="section-modal">
                                        <h2>Contacto</h2>
                                        <div class="column-two">
                                            <div class="item-grid">
                                                <label for="phone">Número de teléfono:</label>
                                                <input type="tel" id="phone" name="phone" value="+">
                                                <pre class="grey">Introduzca el prefijo y su número</pre>
                                            </div>
                                            <div class="item-grid">
                                                <label for="email">Correo:</label>
                                                <input type="email" id="email" name="email">
                                                <pre id="resultadoEMAIL" class="resultado ok"></pre>
                                            </div>
                                            <div class="item-grid">
                                                <label for="password">Contraseña:</label>
                                                <div class="inputB2 inputL2"> <!-- eye -->
                                                    <input type="password" id="password" autocomplete="off">
                                                    <i class="fas fa-eye" id="togglePassword"></i>
                                                </div>
                                                <pre id="message" class="resultado ok"></pre>
                                            </div>
                                            <div class="item-grid">
                                                <label for="password">Vuela a escribir la contraseña:</label>
                                                <div class="inputB2 inputL2"> <!-- eye -->
                                                    <input type="password" id="password" autocomplete="off">
                                                    <i class="fas fa-eye" id="togglePassword"></i>
                                                </div>
                                                <pre id="resultadoPASSWORD" class="resultado ok"></pre>
                                            </div>
                                        </div> <!-- Ends column-two -->
                                    </section>

                                    <section class="section-modal">
                                        <h2>Aptitudes</h2>
                                        <div class="column-three">
                                            <div class="item-grid">
                                                <label for="area_interes">Seleccione área de interés:</label>
                                                <select id="area_interes" name="area_interes" class="input" form="form-registro">
                                                    <option value="" disabled selected>— Seleccione —</option>
                                                    <option value="">Desarrollador Big Data</option>
                                                    <option value="">Desarrollador Web-Fullstack</option>
                                                    <option value="">Manager</option>
                                                    <option value="">Arquitecto AWS</option>
                                                    <option value="">Salesforce</option>
                                                </select>
                                            </div>
                                            <div class="item-grid">
                                                <label for="grado_academico">Seleccione su grado académico:</label>
                                                <select id="grado_academico" name="grado_academico" class="input" form="form-registro">
                                                    <option value="" disabled selected>— Seleccione —</option>
                                                    <option value="">Doctorado</option>
                                                    <option value="">Especialidad</option>
                                                    <option value="">Especialidad médica</option>
                                                    <option value="">Licenciatura</option>
                                                    <option value="">Maestría</option>
                                                    <option value="">Técnico</option>
                                                    <option value="">Ténico superior universitario</option>
                                                    <option value="">Especialidad tecnológica</option>
                                                </select>
                                            </div>
                                            <div class="item-grid">
                                                <label for="carrera">Carrera:</label>
                                                <input type="text" id="carrera" name="carrera" placeholder="Opcional">
                                            </div>
                                            <div class="item-grid">
                                                <label for="segunda_carrera">Segunda carrera:</label>
                                                <input type="text" id="segunda_carrera" name="segunda_carrera"
                                                       placeholder="Opcional">
                                            </div>
                                        </div> <!-- Ends column-three -->
                                    </section>

                                </div><!--Ends grid-columns -->
                                <div class="button-modal">
                                    <button id="login" type="submit" form="form-registro">Enviar <i class="fas fa-paper-plane"></i>
                                    </button>
                                </div>
                            </form> <!-- Ends LogUpAction -->
                        </div> <!--Ends modal-container -->
                    </div> <!--Ends myModal -->
                </div>
            </form> <!-- Ends LoginAction -->
        </div>
    </main>
</div>
<!--<script src="${pageContext.request.contextPath}js/passwords.js"></script>
<script src="${pageContext.request.contextPath}js/curp.js"></script>
<script src="${pageContext.request.contextPath}js/email.js"></script>
<script src="${pageContext.request.contextPath}js/phone.js"></script>
-->
</body>
</html>