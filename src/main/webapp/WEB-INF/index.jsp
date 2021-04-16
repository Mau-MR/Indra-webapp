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
                            <input type="password" name="password" id="password" autocomplete="off"> <!--required -->
                            <i class="fas fa-eye" id="togglePassword"></i>
                        </div>
                    </div>
                    <div class="buttons-login">
                        <button class="my-button-login">Iniciar Sesión<i class="fas fa-sign-in-alt"></i></button>         
                        <a href="#registro" class="my-button-login">Registrarse<i class="fas fa-user-plus"></i></a> <!--#registro-->
                            <div id="registro" class="modal"> <!--Starts Modal -->
                                <div class="modal-container">
                                    <a href="#" class="icon-modal"><i class="fas fa-chevron-left"></i></a>
                                    <form action="LogUpAction">  <!-- Starts LogUpAction -->
                                        <div class="grid-columns">
                                            <section class="section-modal">
                                                <h2>Información personal</h2>
                                                <div class="column-one">
                                                    <div class="item-grid"> 
                                                        <label for="">Nombre:</label>
                                                        <input type="text">
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">Apellido paterno:</label>
                                                        <input type="text">
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">Apellido materno:</label>
                                                        <input type="text" placeholder="Opcional">
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">CURP:</label>
                                                        <input type="text">
                                                    </div>
                                                </div> <!-- Ends column-one -->
                                            </section>
                                            <section class="section-modal">
                                                <h2>Contacto</h2>
                                                <div class="column-two">
                                                    <div class="item-grid"> 
                                                        <label for="">Número de télefono:</label>
                                                        <input type="text">
                                                    </div> 
                                                    <div class="item-grid"> 
                                                        <label for="">Correo:</label>
                                                        <input type="text">
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">Contraseña:</label>
                                                        <div class="inputB2 inputL2"> <!-- eye -->
                                                            <input type="password" autocomplete="off" id="password-2">
                                                            <i class="fas fa-eye" id="togglePassword-2"></i>
                                                        </div>
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">Vuela a escribir la contraseña:</label>
                                                        <div class="inputB2 inputL2"> <!-- eye -->
                                                            <input type="password" id="password-3">
                                                            <i class="fas fa-eye" id="togglePassword-3"></i>
                                                        </div> 
                                                    </div>
                                                </div> <!-- Ends column-two -->
                                            </section>
                                            <section class="section-modal">
                                                <h2>Aptitudes</h2>
                                                <div class="column-three">
                                                    <div class="item-grid"> 
                                                        <label for="">Seleccione área de interés:</label>
                                                        <select id="" class="input">
                                                            <option value="" disabled selected>— Seleccione —</option>
                                                            <option value="">Área Uno</option>
                                                            <option value="">Área Dos</option>
                                                            <option value="">Área Tres</option>
                                                            <option value="">Área Cuatro</option>
                                                            <option value="">Área Cinco</option>
                                                        </select>
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">Seleccione su grado académico:</label>
                                                        <select class="input">
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
                                                        <label for="">Carrera:</label>
                                                        <input type="text" placeholder="Opcional">
                                                    </div>
                                                    <div class="item-grid"> 
                                                        <label for="">Segunda carrera:</label>
                                                        <input type="text" placeholder="Opcional">
                                                    </div>
                                                </div> <!-- Ends column-three -->
                                            </section>
                                        </div><!--Ends grid-columns -->
                                        <div class="button-modal">
                                            <button>Enviar <i class="fas fa-paper-plane"></i> </button>
                                        </div>
                                    </form> <!-- Ends LogUpAction -->
                                </div> <!--Ends modal-container -->
                            </div> <!--Ends myModal -->
                        <div class="forgot-password-login">
                            <a href="forgot_password">¿Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                </form> <!-- Ends LoginAction -->
            </div>
        </main> 
    </div>
    <script src="${pageContext.request.contextPath}/js/app-eye.js"></script>
</body>
</html>