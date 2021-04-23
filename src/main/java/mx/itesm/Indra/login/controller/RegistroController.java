package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.IRegistroDao;
import mx.itesm.Indra.login.dao.RegistroDao;
import mx.itesm.Indra.login.model.Candidato;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "registro", value = "/registro")
public class RegistroController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtenemos los datos del form de Registro
        String nombre = request.getParameter("nombre");
        String apellido_paterno = request.getParameter("apellido_paterno");
        String apellido_materno = request.getParameter("apellido_materno");
        String curp = request.getParameter("curp");
        int telefono = Integer.parseInt(request.getParameter("phone")); // Transformamos de string a int
        String correo = request.getParameter("email");
        String password = request.getParameter("password1");
        String area_interes = request.getParameter("area_interes");
        String grado_academico = request.getParameter("grado_academico");
        String primera_carrera = request.getParameter("carrera");
        String segunda_carrera = request.getParameter("segunda_carrera");

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


        System.out.println(nombre);
        System.out.println(apellido_paterno);
        System.out.println(apellido_materno);
        System.out.println(curp);
        System.out.println(telefono);
        System.out.println(correo);
        System.out.println(password);
        System.out.println(area_interes);
        System.out.println(grado_academico);
        System.out.println(primera_carrera);
        System.out.println(segunda_carrera);

        //Creamos una instancia de RegistroDao para llamar al método de registroCandidato, le mandamos la cuenta y la
        // contraseña
        RegistroDao registroDao = new RegistroDao();
        try {
            registroDao.registroCandidato(candidato, password);
        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
