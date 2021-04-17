package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.LoginDao;
import mx.itesm.Indra.login.model.Cuenta;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    //Recuperar información (mostrar páginas a las que no sea necesario enviar valores)
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    //Manipular la información
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtenemos los datos del correo y de la contraseña
        String correo = request.getParameter("mail");
        String password = request.getParameter("password");

        LoginDao loginDao = new LoginDao();
        //Verificar el tipo de usuario
        String tipo = loginDao.getUserType(correo);
        //Dividimos según el tipo de cuenta que sea, y después verificamos con el método verifyStatus si está habilitada
        switch (tipo) {
            case "administrador":
                if (loginDao.verifyUser(correo, password)) {
                    Cuenta administrador = loginDao.verifyStatus(correo, password);
                    if (administrador != null) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("administrador", administrador);
                        sesion.removeAttribute("candidato");
                        response.sendRedirect("administrador");
                    }
                    else {
                        try {
                            request.setAttribute("mensaje", "Cuenta inhabilitada");
                            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
                        }
                        catch (Exception ex) {
                            System.out.println(ex.getMessage());
                        }
                    }
                }
                else {
                    try {
                        request.setAttribute("mensaje", "El usuario o contraseña son incorrectos");
                        request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
                    }
                    catch (Exception ex) {
                        System.out.println(ex.getMessage());
                    }
                }
                break;
            case "candidato":
                if(loginDao.verifyUser(correo, password)) {
                    Cuenta candidato = loginDao.verifyStatus(correo, password);
                    if (candidato != null) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("candidato", candidato);
                        sesion.removeAttribute("administrador");
                        response.sendRedirect("candidato");
                    }
                    else {
                        try {
                            request.setAttribute("mensaje", "La cuenta está inhabilitada");
                            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
                        }
                        catch (Exception ex) {
                            System.out.println(ex.getMessage());
                        }
                    }
                }
                else {
                    try {
                        request.setAttribute("mensaje", "El usuario o contraseña son incorrectos");
                        request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
                    }
                    catch (Exception ex) {
                        System.out.println(ex.getMessage());
                    }
                }

                break;
            default:
                //Reedirigir al login con error
                try {
                    request.setAttribute("mensaje", "El usuario o contraseña son incorrectos");
                    request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
                }
                catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }

        }
    }
}