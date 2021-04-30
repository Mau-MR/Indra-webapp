package mx.itesm.Indra.login.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "candidato", value = "/candidato")
public class CandidatoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("candidato") != null) {
                response.sendRedirect("https://developer.cloud.unity3d.com/share/share.html?shareId=ZJlykx-JeD");
            }
            else {
                request.setAttribute("mensaje", "No tienes acceso, inicia sesión.");
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
