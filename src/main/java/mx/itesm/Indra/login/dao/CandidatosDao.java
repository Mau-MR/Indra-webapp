package mx.itesm.Indra.login.dao;

import mx.itesm.Indra.login.model.Candidato;
import mx.itesm.Indra.login.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CandidatosDao implements ICandidatosDao {

    @Override
    public List<Candidato> cargarCandidatos() {

        List<Candidato> candidatosList = new ArrayList<>(); //Creamos una nueva lista para almacenar a los candidatos
        String sqlBasicos = "SELECT c.id_cuenta, p.nombre, p.paterno, p.materno, p.curp, p.telefono, c.correo, c.status, ri.descripcion AS inteligencia_emocional, rt.descripcion AS trabajo_bajo_presion\n" +
                "\tFROM persona p, cuenta c, resultado ri, resultado rt\n" +
                "    WHERE c.id_persona = p.id_persona AND c.id_cuenta = ri.id_cuenta AND ri.id_softskill = 1 \n" +
                "    AND c.id_cuenta = rt.id_cuenta AND rt.id_softskill = 2";

        String sqlSecundarios = "SELECT ai.nombre AS area_interes, ga.nombre AS grado_academico, cga.carrera AS carrera\n" +
                "\tFROM area_interes ai, grado_academico ga, cuenta_grado_academico cga\n" +
                "    WHERE ai.id_area_interes IN (SELECT ai.id_area_interes FROM cuenta_area_interes cai WHERE cai" +
                ".id_cuenta = ?)\n" +
                "\t\tAND ga.id_grado_academico IN (SELECT id_grado_academico FROM cuenta_grado_academico WHERE " +
                "id_cuenta = ?) \n" +
                "        AND cga.id_cuenta = ?";

        String sqlAcceso = "SELECT * FROM autorizacion WHERE candidato = ?";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement psBasicos = conexion.prepareStatement(sqlBasicos);
            PreparedStatement psSecundarios = conexion.prepareStatement(sqlSecundarios);
            PreparedStatement psAcceso = conexion.prepareStatement(sqlAcceso);

            ResultSet rsBasicos = psBasicos.executeQuery(); // Ejecutamos la primera query

            while (rsBasicos.next()) {
                //Ejecutamos la segunda query
                psSecundarios.setString(1, rsBasicos.getString("id_cuenta"));
                psSecundarios.setString(2, rsBasicos.getString("id_cuenta"));
                psSecundarios.setString(3, rsBasicos.getString("id_cuenta"));
                ResultSet rsSecundarios = psSecundarios.executeQuery();

                psAcceso.setString(1, rsBasicos.getString("id_cuenta"));
                ResultSet rsAcceso = psAcceso.executeQuery();

                if (rsSecundarios.next()) {
                    //Primeros datos
                    String nombre = rsBasicos.getString("nombre");
                    String apellido = rsBasicos.getString("paterno") + " " + rsBasicos.getString("materno");
                    String curp = rsBasicos.getString("curp");
                    int telefono = rsBasicos.getInt("telefono");
                    String correo = rsBasicos.getString("correo");
                    boolean status = rsBasicos.getBoolean("status");
                    String inteligencia_emocional = rsBasicos.getString("inteligencia_emocional");
                    String trabajo_bajo_presion = rsBasicos.getString("trabajo_bajo_presion");

                    //Segunda parte - Secundarios
                    String area_interes = rsSecundarios.getString("area_interes");
                    String grado_academico = rsSecundarios.getString("grado_academico");
                    String carrera = rsSecundarios.getString("carrera");

                    if (rsAcceso.next() != false) { // Si la querie de la autorización es diferente de null, entonces
                        Candidato candidato = new Candidato(
                                nombre,
                                apellido,
                                curp,
                                telefono,
                                correo,
                                "1996/08/10",
                                23,
                                status,
                                true,
                                area_interes,
                                inteligencia_emocional,
                                trabajo_bajo_presion,
                                grado_academico,
                                carrera
                        );
                        candidatosList.add(candidato);
                    }
                    else {
                        Candidato candidato = new Candidato (
                                nombre,
                                apellido,
                                curp,
                                telefono,
                                correo,
                                "1996/08/10",
                                23,
                                status,
                                false,
                                area_interes,
                                inteligencia_emocional,
                                trabajo_bajo_presion,
                                grado_academico,
                                carrera
                        );
                        candidatosList.add(candidato);
                    }
                }
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return candidatosList;
    }

    public static void main(String[] arg) {
        String sql = "SELECT * FROM autorizacion WHERE candidato = 2";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();


            if (resultSet.next() == false) {
                System.out.println("Es nulo");
            }
            else if (resultSet.next() == true){
                System.out.println("No es nulo");
            }

        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
