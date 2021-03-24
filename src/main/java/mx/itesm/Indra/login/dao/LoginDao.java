package mx.itesm.Indra.login.dao;


import mx.itesm.Indra.login.utility.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao implements ILoginDao{
    private String SELECT_USER = "SELECT COUNT(*) FROM usuario WHERE usuario = ? AND password = ?";

    @Override
    public boolean verifyUser(String user, String password) {

        try {
            Connection conexion = MySQLConnection.getConnection();
            PreparedStatement ps = conexion.prepareStatement(SELECT_USER);
            ps.setString(1,user);
            ps.setString(2,password);
            ResultSet resultSet =ps.executeQuery();
            if(resultSet.next()){
                System.out.println(resultSet.getInt(1));
                return resultSet.getInt(1) <= 1 && resultSet.getInt(1) != 0;
            }
        }catch (Exception ex){
            System.out.println(ex.getClass().getCanonicalName() +"-"+ ex.getMessage());
        }
        return false;
    }
}
