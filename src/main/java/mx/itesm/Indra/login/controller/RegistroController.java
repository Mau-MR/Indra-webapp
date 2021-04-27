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
        // Obtenemos los datos del form de Registro y para corregir errores de acentos, añadimos la función de .getBytes()
        String nombre =new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
        String apellido_paterno =new String(request.getParameter("secondName").getBytes("ISO-8859-1"),"UTF-8");
        String apellido_materno =new String(request.getParameter("maternalSurname").getBytes("ISO-8859-1"),"UTF-8");
        String curp = request.getParameter("curp");
        String telefono = request.getParameter("phone"); // Transformamos de string a long
        String correo = request.getParameter("email");
        String password =new String(request.getParameter("password1").getBytes("ISO-8859-1"),"UTF-8");
        String area_interes =new String(request.getParameter("area_interes").getBytes("ISO-8859-1"),"UTF-8");
        String grado_academico =new String(request.getParameter("grado_academico").getBytes("ISO-8859-1"),"UTF-8");
        String primera_carrera =new String(request.getParameter("career").getBytes("ISO-8859-1"),"UTF-8");
        String segunda_carrera =new String(request.getParameter("Secondcareer").getBytes("ISO-8859-1"),"UTF-8");


        // Llenamos un objeto de tipo Candidato con los datos
        Candidato candidato = new Candidato();
        candidato.setNombre(nombre);
        candidato.setPaterno(apellido_paterno);
        candidato.setMaterno(apellido_materno);
        candidato.setCurp(curp);
        candidato.setTelefono(telefono);
        candidato.setCorreo(correo);
        candidato.setInteres(area_interes);
        candidato.setGrado_academico(grado_academico);
        candidato.setPrimera_carrera(primera_carrera);
        candidato.setSegunda_carrera(segunda_carrera);

        // Creamos una instancia de RegistroDao para llamar al método de registroCandidato, le mandamos la cuenta y la contraseña
        RegistroDao registroDao = new RegistroDao();
        boolean flag = registroDao.registroCandidato(candidato, password);

        // Se redirecciona al index.jsp con un mensaje según si se registró o no
        if (flag) {
            request.setAttribute("mensaje", "Se registró el usuario");
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
