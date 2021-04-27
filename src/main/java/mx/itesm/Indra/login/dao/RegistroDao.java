package mx.itesm.Indra.login.dao;

import mx.itesm.Indra.login.model.Candidato;
import mx.itesm.Indra.login.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegistroDao implements IRegistroDao{
    @Override
    public boolean registroCandidato(Candidato candidato, String password) {
        // Definimos los inserts para cada tabla
        String insert_persona = "INSERT INTO persona(curp, nombre, paterno, materno, telefono) VALUES(?, ?, ?, ?, ?)";
        String insert_cuenta = "INSERT INTO cuenta(id_rol, id_persona, correo, password, status) VALUES (2, ?, ?, SHA2(?, 224), ?)";
        String insert_cuenta_grado = "INSERT INTO cuenta_grado_academico(id_cuenta, id_grado_academico, carrera) VALUES(?, ?, ?)";
        String insert_cuenta_interes = "INSERT INTO cuenta_area_interes(id_cuenta, id_area_interes) VALUES(?, ?)";

        // El apellido tiene el paterno y el materno, entonces lo dividimos según el espacio que hay entre ellos
        String apellido_paterno = candidato.getPaterno();
        String apellido_materno = candidato.getMaterno();

        // Nos conectamos a la base de datos y empezamos con las inserciones
        try {
            // Nos conectamos a la base de datos
            Connection conexion = MySQLConnection.getConnection();

            // Creamos los preparedStament para los cuatro inserts
            PreparedStatement ps_persona = conexion.prepareStatement(insert_persona);
            PreparedStatement ps_cuenta = conexion.prepareStatement(insert_cuenta);
            PreparedStatement ps_cuenta_grado = conexion.prepareStatement(insert_cuenta_grado);
            PreparedStatement ps_cuenta_interes = conexion.prepareStatement(insert_cuenta_interes);

            // Llenamos los ps con sus respectivos datos
            // ------------- Se hace al inserción en la tabla Persona -------------
            ps_persona.setString(1, candidato.getCurp());
            ps_persona.setString(2, candidato.getNombre());
            ps_persona.setString(3, apellido_paterno);
            ps_persona.setString(4, apellido_materno);
            ps_persona.setLong(5, candidato.getTelefono());
            ps_persona.executeUpdate();
            // Para obtener el id_persona, hacemos una query con los datos ofrecidos
            String get_id_persona = "SELECT id_persona FROM persona WHERE curp = ? AND nombre = ? AND paterno = ? AND materno = ? AND telefono = ?";
            PreparedStatement ps_get_id_persona = conexion.prepareStatement(get_id_persona);
            ps_get_id_persona.setString(1, candidato.getCurp());
            ps_get_id_persona.setString(2, candidato.getNombre());
            ps_get_id_persona.setString(3, apellido_paterno);
            ps_get_id_persona.setString(4, apellido_materno);
            ps_get_id_persona.setString(5, Long.toString(candidato.getTelefono()));
            ResultSet rs_get_id_persona = ps_get_id_persona.executeQuery();

            // Una vez obtenido el id_persona, podemos hacer las demás queries
            if (rs_get_id_persona.next()) {

                // ------------- Se hace la inserción de los datos en la tabla Cuenta -------------
                ps_cuenta.setInt(1, rs_get_id_persona.getInt("id_persona"));
                ps_cuenta.setString(2, candidato.getCorreo());
                ps_cuenta.setString(3, password);
                ps_cuenta.setBoolean(4, false);
                ps_cuenta.executeUpdate();

                // Para obtener el id_cuenta, hacemos una query con los datos ofrecidos
                String get_id_cuenta = "SELECT id_cuenta FROM cuenta WHERE id_persona = ? AND correo = ? AND password = SHA2(?, 224)";
                PreparedStatement ps_get_id_cuenta = conexion.prepareStatement(get_id_cuenta);
                ps_get_id_cuenta.setInt(1, rs_get_id_persona.getInt("id_persona"));
                ps_get_id_cuenta.setString(2, candidato.getCorreo());
                ps_get_id_cuenta.setString(3, password);
                ResultSet rs_get_id_cuenta = ps_get_id_cuenta.executeQuery();

                //Una vez obtenido el id_cuenta, seguimos con las inserciones
                if (rs_get_id_cuenta.next()) {
                    // Obtenemos el indice de la tabla de grado_academico
                    String get_id_grado_academico = "SELECT id_grado_academico FROM grado_academico WHERE nombre = ?";
                    PreparedStatement ps_get_id_grado_academico = conexion.prepareStatement(get_id_grado_academico);
                    ps_get_id_grado_academico.setString(1, candidato.getGrado_academico());
                    ResultSet rs_get_id_grado_academico = ps_get_id_grado_academico.executeQuery();

                    if (rs_get_id_grado_academico.next()) {
                        // ------------- Se hace la inserción de los datos en la tabla cuenta_grado_academico -------------
                        String primera_carrera = candidato.getPrimera_carrera();
                        String segunda_carrera = candidato.getSegunda_carrera();
                        ps_cuenta_grado.setInt(1, rs_get_id_cuenta.getInt("id_cuenta"));
                        ps_cuenta_grado.setInt(2, rs_get_id_grado_academico.getInt("id_grado_academico"));
                        ps_cuenta_grado.setString(3, primera_carrera);
                        ps_cuenta_grado.executeUpdate();

                        // Si existe otra carrera, ejecutamos la misma executeUpdate
                        if (segunda_carrera != null) {
                            ps_cuenta_grado.setString(3, segunda_carrera);
                            ps_cuenta_grado.executeUpdate();
                        }

                        // Obtenemos el indice de la tabla de area_interes
                        String get_id_area_interes = "SELECT id_area_interes FROM area_interes WHERE nombre = ?";
                        PreparedStatement ps_get_id_area_interes = conexion.prepareStatement(get_id_area_interes);
                        ps_get_id_area_interes.setString(1, candidato.getInteres());
                        ResultSet rs_get_id_area_interes = ps_get_id_area_interes.executeQuery();

                        if (rs_get_id_area_interes.next()) {
                            // ------------- Se hace la insercion en la tabla cuenta_area_interes -------------
                            ps_cuenta_interes.setInt(1, rs_get_id_cuenta.getInt("id_cuenta"));
                            ps_cuenta_interes.setInt(2, rs_get_id_area_interes.getInt("id_area_interes"));
                            ps_cuenta_interes.executeUpdate();

                            return true;
                        }
                    }
                }
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public static void main(String[] arg) {
        Candidato candidato = new Candidato();

        candidato.setNombre("Josías");
        candidato.setPaterno("González");
        candidato.setMaterno("Lucas");
        candidato.setCurp("GOLE010119HGRNCRA3");
        candidato.setTelefono(53356742);
        candidato.setCorreo("josias@gmail.com");
        candidato.setInteres("Videjuegos");
        candidato.setGrado_academico("Doctorado");
        String password = "hola";
        candidato.setPrimera_carrera("Licenciatura en Artes Musicales");

        RegistroDao registroDao = new RegistroDao();
        try {
            registroDao.registroCandidato(candidato, password);
        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }

    }
}
