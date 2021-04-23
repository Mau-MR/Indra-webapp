package mx.itesm.Indra.login.dao;

import mx.itesm.Indra.login.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AutorizarDao implements IAutorizarDao{


    @Override
    public void autorizacion(String curp, String minsait, boolean action) {
        // Cuando action es 'true', entonces vamos a insertar en la tabla Autorizacion, es decir, vamos a autorizar
        // al usuario, en caso contrario, vamos a eliminar su autorización, es decir, su registro en la tabla
        // Obtenemos el id_cuenta a partir de la curp
        String sql_id_cuenta = "SELECT id_cuenta FROM cuenta WHERE id_persona IN (SELECT id_persona FROM persona WHERE curp = ?)";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement ps_id_cuenta = conexion.prepareStatement(sql_id_cuenta);
            ps_id_cuenta.setString(1, curp);
            ResultSet rs_id_cuenta = ps_id_cuenta.executeQuery();

            if (rs_id_cuenta.next()) {
                String candidato = rs_id_cuenta.getString("id_cuenta");

                // Si la action es verdad, entonces significa que se hace el insert
                if (action) {
                    String sql = "INSERT INTO autorizacion(minsait, candidato, fecha) VALUES (?, ?, CURDATE())";
                    PreparedStatement preparedStatement = conexion.prepareStatement(sql);
                    preparedStatement.setString(1, minsait);
                    preparedStatement.setString(2, candidato);
                    int in = preparedStatement.executeUpdate();
                }
                else {
                    String sql = "DELETE FROM autorizacion WHERE candidato = ?";
                    PreparedStatement preparedStatement = conexion.prepareStatement(sql);
                    preparedStatement.setString(1, candidato);
                    int out = preparedStatement.executeUpdate();
                }
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
