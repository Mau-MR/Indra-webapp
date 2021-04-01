package mx.itesm.Indra.login.dao;


import mx.itesm.Indra.login.model.Cuenta;
import mx.itesm.Indra.login.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao implements ILoginDao{


    @Override
    public boolean verifyUser(String correo, String password) {
        String sql = "SELECT COUNT(*) FROM cuenta WHERE correo = ? AND password = SHA2(?,224)";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, correo);
            preparedStatement.setString(2, password);

            // SELECT devuelve registros - ResultSet
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                if (resultSet.getInt(1) == 0 || resultSet.getInt(1) > 1) {
                    return false;
                }
                return true;
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getClass().getCanonicalName() + "-" + ex.getMessage());
        }

        return false;
    }

    @Override
    public String getUserType(String correo) {
        String sql = "SELECT nombre AS tipo FROM rol WHERE id_rol = ( SELECT id_rol FROM cuenta WHERE correo = ?)";

        try {
            Connection conexion = MySQLConnection.getConnection(); // Nos conectamos a la base de datos
            PreparedStatement preparedStatement = conexion.prepareStatement(sql); //Conectamos con la sentencia sql
            preparedStatement.setString(1, correo); //Asignamos a '?' el crreo que recibimos para identificar el tipo de usuario

            ResultSet resultSet = preparedStatement.executeQuery(); //Ejecutamos la consulta y nos devuelve un "administrador" o "candidato"

            //Entramos en el If y verificamos qué tipo de usuario es
            if(resultSet.next()) {
                return resultSet.getString("tipo");
            }
            else {
                return "";
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return null;
    }

    @Override
    public Cuenta verifyStatus(String correo, String password) {
        Cuenta cuenta = null; //Inicializamos un instancia de tipo Cuenta como null
        String sql = "SELECT id_cuenta, id_rol, id_persona, correo, password, status FROM cuenta WHERE correo = ? AND password = SHA2(?, 224)";

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, correo);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                //Llenamos la instancia 'cuenta' con los atributos obtenidos
                cuenta = new Cuenta (
                        resultSet.getString("correo"),
                        resultSet.getString("password"),
                        resultSet.getBoolean("status")
                );
                cuenta.setId_cuenta(resultSet.getInt("id_cuenta"));
                cuenta.setId_rol(resultSet.getInt("id_rol"));
                cuenta.setId_persona(resultSet.getInt("id_persona"));
                //Una vez llenado la instancia de Cuenta, verificamos si el status es aprobatorio para redireccionar a su respectiva página, si no, regresamos null
                if (cuenta.getStatus()) {
                    return cuenta;
                }
                else {
                    return null;
                }
            }
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return cuenta;
    }

}
