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
        //Obtenemos los datos del form de Registro
        String nombre = request.getParameter("nombre");
        String apellido_paterno = request.getParameter("apellido_paterno");
        String apellido_materno = request.getParameter("apellido_materno");
        String curp = request.getParameter("curp");
        int telefono = Integer.parseInt(request.getParameter("telefono")); // Transformamos de string a int
        String password = request.getParameter("password");
        String area_interes = request.getParameter("area_interes");
        String grado_academico = request.getParameter("grado_academico");
        String carrera = request.getParameter("carrera");
        String segunda_carrera = request.getParameter("segunda_carrera");

        //Llenamos un objeto de tipo Candidato con los datos
        Candidato candidato = new Candidato();

        candidato.setNombre(nombre);
        candidato.setApellido(apellido_paterno + " " + apellido_materno);
        candidato.setCurp(curp);
        candidato.setTelefono(telefono);
        candidato.setInteres(area_interes);
        candidato.setGrado_academico(grado_academico);
        if (segunda_carrera != null) {
            candidato.setCarreras(carrera + ";" + segunda_carrera);
        }
        else {
            candidato.setCarreras(carrera);
        }


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
