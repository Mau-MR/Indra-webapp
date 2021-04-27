package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.AutorizarDao;
import mx.itesm.Indra.login.dao.CandidatosDao;
import mx.itesm.Indra.login.dao.LoginDao;
import mx.itesm.Indra.login.model.Candidato;
import mx.itesm.Indra.login.model.Cuenta;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "administrador", value = "/administrador")
public class AdministradorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("administrador") != null) {
                // Llenamos la lista con los candidatos y los mostramos en la página
                CandidatosDao candidatosDao = new CandidatosDao();
                List<Candidato> candidatosList = candidatosDao.cargarCandidatos();
                request.setAttribute("candidatosList", candidatosList);

                //Obtenemos el nombre a partir de obtener el objeto de la sesion de tipo de Cuenta y lo mandamos al jsp
                LoginDao loginDao = new LoginDao();
                Cuenta admin = (Cuenta) sesion.getAttribute("administrador");
                request.setAttribute("id_cuenta", admin.getId_cuenta());
                String nombre = loginDao.getName(admin);
                request.setAttribute("nombre", nombre);

                request.getRequestDispatcher("WEB-INF/homeAdministrador.jsp").forward(request, response);
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
        String curp = request.getParameter("curp");
        String minsait = request.getParameter("minsait");
        boolean action = Boolean.parseBoolean(request.getParameter("action"));

        AutorizarDao autorizarDao = new AutorizarDao();
        autorizarDao.autorizacion(curp, minsait, action);

        PrintWriter out = response.getWriter();
        out.println("OK");
    }
}
