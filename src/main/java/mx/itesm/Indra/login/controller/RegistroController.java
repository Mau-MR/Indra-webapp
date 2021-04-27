package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.RegistroDao;
import mx.itesm.Indra.login.model.Candidato;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "registro", value = "/registro")
public class RegistroController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtenemos los datos delform de Registro
        String nombre = request.getParameter("name");
        String apellido_paterno = request.getParameter("secondName");
        String apellido_materno = request.getParameter("maternalSurname");
        String curp = request.getParameter("curp");
        //Long telefono = Long.parseLong(request.getParameter("phone")); // Transformamos de string a int
        String telefono = request.getParameter("phone"); // Transformamos de string a int
        String correo = request.getParameter("email");
        String password = request.getParameter("password1");
        String area_interes = request.getParameter("area_interes");
        String grado_academico = request.getParameter("grado_academico");
        String primera_carrera = request.getParameter("career");
        String segunda_carrera = request.getParameter("Secondcareer");


        // Llenamos un objeto de tipo Candidato con los datos
        Candidato candidato = new Candidato();
        candidato.setNombre(nombre);
        candidato.setPaterno(apellido_paterno);
        candidato.setMaterno(apellido_materno);
        candidato.setCurp(curp);
        //candidato.setTelefono(telefono);
        candidato.setTelefono(0);
        candidato.setCorreo(correo);
        candidato.setInteres(area_interes);
        candidato.setGrado_academico(grado_academico);
        candidato.setPrimera_carrera(primera_carrera);
        candidato.setSegunda_carrera(segunda_carrera);

        //Creamos una instancia de RegistroDao para llamar al método de registroCandidato, le mandamos la cuenta y la contraseña
        RegistroDao registroDao = new RegistroDao();
        boolean flag = registroDao.registroCandidato(candidato, password);

        if (flag) {
            request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
        }
        else {
            request.setAttribute("mensaje", "No se pudo registrar el usuario");
            try {
                request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
            }
            catch (Exception ex) {
                System.out.println(ex.getClass().getCanonicalName() + "-" + ex.getMessage());
            }

        }

    }
}
