package mx.itesm.Indra.login.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "logout", value = "/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Cerramos sesión
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        //response.sendRedirect("WEB-INF/index.jsp");
        request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
    }
}
