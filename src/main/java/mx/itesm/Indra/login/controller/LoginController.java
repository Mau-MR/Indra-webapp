package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.LoginDao;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
// Anotación
// IMPORTANTE: Aqui nombramos el servlet y declaramos la ruta para acceder a él
@WebServlet(name = "Login", value = "/login")
public class LoginController extends HttpServlet {
    //Recuperar información (mostrar páginas a las que no sea necesario enviar valores)
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    //Manipular la información
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        //Codigo para verificar en la BD
        // DAO = DATO ACCESS OBJECT
        System.out.println(usuario);
        System.out.println(password);

        LoginDao loginDao = new LoginDao();
        boolean flag = loginDao.verifyUser(usuario,password);
        if(flag) {
            //Redirigir a la página home
            // sendRedirect redirigé a un recurso sin eviar valores o parámetros
            //              hace un petición HTTP con request y response vacíos
            response.sendRedirect("main.html");
        } else {
            // Redirigir al index con el mensaje de error
            request.setAttribute("mensaje","El usuario o contraseña son incorrectos");
            try {
                request.getRequestDispatcher("loginCandidato.html").forward(request,response);
            } catch(Exception ex) {
                System.out.println(ex.getClass().getCanonicalName() + "-" + ex.getMessage());
            }
        }
    }
}