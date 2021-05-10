<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
    <title>Inicia Sesión</title>

    <link rel="preload" href="${pageContext.request.contextPath}/css/normalize.css" as="style">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="preload" href="${pageContext.request.contextPath}/css/styles.css" as="style">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="preload" href="${pageContext.request.contextPath}/Roboto/Roboto-Regular.ttf" as="font">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Roboto/Roboto-Regular.ttf">
    <link rel="preload" href="${pageContext.request.contextPath}/css/all.min.css" as="style">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
    <link rel="preload" href="${pageContext.request.contextPath}/css/fontawesome.min.css" as="style">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
</head>

<body>
<div id="particles-js">
    <script src="${pageContext.request.contextPath}/js/particles.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <main>
        <div class="login-container">
            <div class="img-login">
                <img src="${pageContext.request.contextPath}/img/logominsaitBlanco.svg" alt="Logo Indra">
            </div>
            <form action="login" method="POST" class="login-form"> <!-- Starts LoginAction -->
                <div class="input-login">
                    <label for="mail">Tu correo:</label>
                    <input type="email" name="user-mail" id="mail" autocomplete="off" class="inputL">
                    <label for="password">Tu contraseña:</label>
                    <div class="inputB inputL">
                        <input type="password" name="user-password" id="password" autocomplete="off">
                        <i class="fas fa-eye" id="togglePassword"></i>
                    </div>
                    <span class="Login__span">${mensaje}</span>
                </div>

                <div class="buttons-login">
                    <button class="my-button-login">Iniciar Sesión<i class="fas fa-sign-in-alt"></i></button>
                    <a href="#registro" class="my-button-login">Registrarse<i class="fas fa-user-plus"></i></a>
                    <!--#registro-->

            </form> <!-- Ends LoginAction -->

            <div id="registro" class="modal"><!--Starts Modal -->
                <div class="modal-container">
                    <a href="#" class="icon-modal"><i class="fas fa-chevron-left"></i></a>
                    <form action="registro" method="POST">  <!-- Starts LogUpAction -->
                        <div class="grid-columns">
                            <section class="section-modal">
                                <h2>Información personal</h2>
                                <div class="column-one">
                                    <div class="item-grid" id="i">
                                        <label for="name">Nombre:</label>
                                        <input type="text" id="name" name="name" placeholder="Requerido">
                                    </div>
                                    <div class="item-grid" id="i">
                                        <label for="secondName">Apellido paterno:</label>
                                        <input type="text" id="secondName" name="secondName" placeholder="Requerido">
                                    </div>
                                    <div class="item-grid" id="i">
                                        <label for="maternalSurname">Apellido materno:</label>
                                        <input type="text" id="maternalSurname" name="maternalSurname" placeholder="Requerido">
                                    </div>
                                    <div class="item-grid" id="i">
                                        <label for="curp">CURP:</label>
                                        <input type="text" id="curp" name="curp" oninput="validarCURP(this)">
                                        <pre id="resultadoCURP" class="resultado ok"></pre>
                                    </div>
                                </div> <!-- Ends column-one -->
                            </section>

                            <section class="section-modal">
                                <h2>Contacto</h2>
                                <div class="column-two">
                                    <div class="item-grid" id="i">
                                        <label for="phone">Número de teléfono:</label>
                                        <input type="text" id="phone" name="phone" value="">
                                        <pre class="gray">Introduzca el prefijo y su número (requerido)</pre>
                                    </div>
                                    <div class="item-grid" id="i">
                                        <label for="email">Correo:</label>
                                        <input type="text" id="email" name="email" placeholder="Requerido">
                                        <pre id="resultadoEMAIL" class="resultado ok"></pre>
                                    </div>
                                    <div class="item-grid">
                                        <label for="password">Contraseña:</label>
                                        <div class="inputB2 inputL2" id="i">
                                            <!-- eye -->
                                            <input type="password" id="password" name="password1" placeholder="Requerido" autocomplete="off">
                                            <i class="fas fa-eye" id="togglePassword"></i>
                                        </div>
                                        <pre id="resultadoCORRECTA" class="resultado ok"></pre>
                                    </div>
                                    <div class="item-grid">
                                        <label for="password">Vuela a escribir la contraseña:</label>
                                        <div class="inputB2 inputL2" id="i">
                                            <!-- eye -->
                                            <input type="password" id="password" placeholder="Requerido"
                                                   autocomplete="off">
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
                                        <label for="areaInterest">Seleccione área de interés:</label>
                                        <select id="areaInterest" class="input" name="area_interes">
                                            <option value="Desarrollador Big Data">
                                                Desarrollador Big Data
                                            </option>
                                            <option value="Desarrollador Web-Fullstack">
                                                Desarrollador Web-Fullstack
                                            </option>
                                            <option value="Manager">
                                                Manager
                                            </option>
                                            <option value="Arquitecto AWS">
                                                Arquitecto AWS
                                            </option>
                                            <option value="Salesforce">
                                                Salesforce
                                            </option>
                                        </select>
                                        <pre class="gray">(requerido)</pre>
                                    </div>
                                    <div class="item-grid">
                                        <label for="academicDegree">Seleccione su grado académico:</label>
                                        <select id="academicDegree" class="input" name="grado_academico">
                                            <option value="Doctorado">
                                                Doctorado
                                            </option>
                                            <option value="Especialidad">
                                                Especialidad
                                            </option>
                                            <option value="Especialidad médica">
                                                Especialidad médica
                                            </option>
                                            <option value="Licenciatura">
                                                Licenciatura
                                            </option>
                                            <option value="Maestría">
                                                Maestría
                                            </option>
                                            <option value="Técnico">
                                                Técnico
                                            </option>
                                            <option value="Técnico superior universitario">
                                                Técnico superior universitario
                                            </option>
                                            <option value="Especialidad tecnológica">
                                                Especialidad tecnológica
                                            </option>
                                        </select>
                                        <pre class="gray">(requerido)</pre>
                                    </div>
                                    <div class="item-grid" id="i">
                                        <label for="career">Carrera:</label>
                                        <input type="text" id="career" name="career" placeholder="Opcional">
                                    </div>
                                    <div class="item-grid" id="">
                                        <label for="Secondcareer">Segunda carrera:</label>
                                        <input type="text" id="Secondcareer" name="Secondcareer" placeholder="Opcional">
                                    </div>
                                </div> <!-- Ends column-three -->
                            </section>
                        </div><!--Ends grid-columns -->
                        <div class="button-modal">
                            <input type="submit" id="register" value="Registrarse" disabled="disabled">
                        </div>
                    </form> <!-- Ends LogUpAction -->
                </div> <!--Ends modal-container -->
            </div>
        </div>
    </main>
</div>
<script src="${pageContext.request.contextPath}/js/passwords.js"></script>
<script src="${pageContext.request.contextPath}/js/curp.js"></script>
<script src="${pageContext.request.contextPath}/js/email.js"></script>
<script src="${pageContext.request.contextPath}/js/phone.js"></script>
<script src="${pageContext.request.contextPath}/js/validateRegistry.js"></script>
</body>

</html>