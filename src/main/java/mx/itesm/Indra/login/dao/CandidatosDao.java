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
        //Obtenemos los siguientes datos:
        /*
            id_cuenta
            nombre
            apellido paterno
            apellido materno
            curp
            teléfono
            correo
            status
         */
        String sql_persona_cuenta = "SELECT c.id_cuenta, p.nombre, p.paterno, p.materno, p.curp, p.telefono, c.correo, c.status" +
                " FROM persona p, cuenta c WHERE c.id_persona = p.id_persona AND c.id_rol = 2";

        /*
            area_interes
        */
        String sql_area_interes = "SELECT nombre AS area_interes FROM area_interes WHERE id_area_interes " +
                "IN (SELECT id_area_interes FROM cuenta_area_interes WHERE id_cuenta = ?)";

        /*
            grado_academico
         */
        String sql_grado_academico = "SELECT nombre AS grado_academico FROM grado_academico WHERE id_grado_academico " +
                "IN (SELECT id_grado_academico FROM cuenta_grado_academico WHERE id_cuenta = ?)";

        /*
            primera_carrera
            segunda_carrera
         */
        String sql_carreras = "SELECT carrera FROM cuenta_grado_academico WHERE id_cuenta = ?";

        /*
            resultado de inteligencia emocional y trabajo bajo presion
            score_inteligencia
            score_trabajo
            duracion
         */
        String sql_resultado = "SELECT ri.descripcion AS inteligencia_emocional, ri.valor AS score_inteligencia, rt.descripcion AS trabajo_presion, " +
                "rt.valor AS score_trabajo, ri.duracion AS duracion  FROM resultado ri, resultado rt WHERE ri" +
                ".id_cuenta = ? AND ri.id_softskill = 1 AND rt.id_cuenta = ? AND rt.id_softskill = 2";
        /*
            Acceso -> Si tiene acceso para hacer el juego
         */
        String sql_acceso = "SELECT * FROM autorizacion WHERE candidato = ?";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement ps_persona_cuenta = conexion.prepareStatement(sql_persona_cuenta);
            PreparedStatement ps_area_interes = conexion.prepareStatement(sql_area_interes);
            PreparedStatement ps_grado_academico = conexion.prepareStatement(sql_grado_academico);
            PreparedStatement ps_carreras = conexion.prepareStatement(sql_carreras);
            PreparedStatement ps_resultado = conexion.prepareStatement(sql_resultado);
            PreparedStatement ps_acceso = conexion.prepareStatement(sql_acceso);

            // Obtenemos el id_cuenta para las demás queries
            ResultSet rs_persona_cuenta = ps_persona_cuenta.executeQuery();

            while (rs_persona_cuenta.next()) {

                System.out.println("id_cuenta: " + rs_persona_cuenta.getString("id_cuenta"));

                // Insertamos el id_cuenta para que se puedan realizar las queries
                ps_area_interes.setString(1, rs_persona_cuenta.getString("id_cuenta"));
                ps_grado_academico.setString(1, rs_persona_cuenta.getString("id_cuenta"));
                ps_carreras.setString(1, rs_persona_cuenta.getString("id_cuenta"));
                ps_resultado.setString(1, rs_persona_cuenta.getString("id_cuenta"));
                ps_resultado.setString(2, rs_persona_cuenta.getString("id_cuenta"));
                ps_acceso.setString(1, rs_persona_cuenta.getString("id_cuenta"));


                // Ejecutamos las queries
                ResultSet rs_area_interes = ps_area_interes.executeQuery();
                ResultSet rs_grado_academico = ps_grado_academico.executeQuery();
                ResultSet rs_carreras = ps_carreras.executeQuery();
                ResultSet rs_resultado = ps_resultado.executeQuery();
                ResultSet rs_acceso = ps_acceso.executeQuery();

                if (rs_area_interes.next() & rs_grado_academico.next()) {
                    //Verificamos si hay resultados, si hay, se llena, si no se llena con "...."
                    String inteligencia_emocional = "....";
                    String trabajo_presion = "....";
                    int score_inteligencia = 0;
                    int score_trabajo = 0;
                    int duracion = 0;
                    if (rs_resultado.next()) {
                        inteligencia_emocional = rs_resultado.getString("inteligencia_emocional");
                        trabajo_presion = rs_resultado.getString("trabajo_presion");
                        score_inteligencia = rs_resultado.getInt("score_inteligencia");
                        score_trabajo = rs_resultado.getInt("score_trabajo");
                        duracion = rs_resultado.getInt("duracion");
                    }

                    //Verificamos si el candidato tiene acceso para hacer el juego, si no, llenamos el acceso con false
                    boolean acceso = false;
                    if (rs_acceso.next()) {
                        acceso = true;
                    }


                    //Verificamos si tiene una carrera
                    String primera_carrera = "....";
                    String segunda_carrera = "....";
                    if (rs_carreras.next()) {
                        primera_carrera = rs_carreras.getString("carrera");

                        //Si tiene otra carrera vamos a la siguiente fila
                        if (rs_carreras.next()) {
                            segunda_carrera = rs_carreras.getString("carrera");
                        }
                    }


                    //Llenamos los demás campos
                    String nombre = rs_persona_cuenta.getString("nombre");
                    String paterno = rs_persona_cuenta.getString("paterno");
                    String materno = rs_persona_cuenta.getString("materno");
                    String curp = rs_persona_cuenta.getString("curp");
                    String telefono = rs_persona_cuenta.getString("telefono");
                    String correo = rs_persona_cuenta.getString("correo");
                    boolean status = rs_persona_cuenta.getBoolean("status");
                    String area_interes = rs_area_interes.getString("area_interes");
                    String grado_academico = rs_grado_academico.getString("grado_academico");

                    //Llenamos un objeto de tipo Candidato y lo añadimos al arreglo
                    Candidato candidato = new Candidato(
                            nombre,
                            paterno,
                            materno,
                            curp,
                            telefono,
                            correo,
                            23,
                            status,
                            acceso,
                            area_interes,
                            inteligencia_emocional,
                            trabajo_presion,
                            grado_academico,
                            primera_carrera,
                            segunda_carrera,
                            score_inteligencia,
                            score_trabajo,
                            duracion

                    );
                    candidatosList.add(candidato);
                }
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return candidatosList;
    }

    public static void main(String[] arg) {
        String cadena = "545234567446727353";
        long telefono = Long.parseLong(cadena);

        System.out.println(telefono);

    }
}
