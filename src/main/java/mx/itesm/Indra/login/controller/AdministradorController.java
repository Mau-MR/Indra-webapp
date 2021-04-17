package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.CandidatosDao;
import mx.itesm.Indra.login.dao.LoginDao;
import mx.itesm.Indra.login.model.Candidato;
import mx.itesm.Indra.login.model.Cuenta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

    }
}
