package mx.itesm.Indra.login.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "administrador", value = "/administrador")
public class AdministradorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("administrador") != null) {
                request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
            }
            else {
                request.setAttribute("mensaje", "No tienes acceso, inicia sesión");
                request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
