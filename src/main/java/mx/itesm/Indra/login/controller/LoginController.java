package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.LoginDao;
import mx.itesm.Indra.login.model.Cuenta;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtenemos los datos del correo y de la contraseña
        String correo = request.getParameter("user-mail");
        String password = request.getParameter("user-password");

        LoginDao loginDao = new LoginDao();
        //Verificar el tipo de usuario
        String tipo = loginDao.getUserType(correo);
        //Dividimos según el tipo de cuenta que sea, y después verificamos con el método verifyStatus si está habilitada
        switch (tipo) {
            case "administrador":
                if (loginDao.verifyUser(correo, password)) {
                    // Como la cuenta administrador nunca se va a poder deshabilitar, entonces se redirecciona automáticamente
                    Cuenta administrador = loginDao.verifyStatus(correo, password);
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("administrador", administrador);
                    sesion.removeAttribute("candidato");
                    response.sendRedirect("administrador");
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
