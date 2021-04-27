package mx.itesm.Indra.login.utility;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection; // Similar a include en C
import java.sql.DriverManager;

public class MySQLConnection {
    public static Connection getConnection() {
        String cadena = "jdbc:mysql://Localhost:3306/traum?user=root"; // &password=root
        //String cadena = "jdbc:mysql://35.230.11.123:3306/traum?user=traumAdmin&password=Traum12345";
        Connection conexion = null;
        try {
            DriverManager.registerDriver(new Driver());
            conexion = DriverManager.getConnection(cadena);
        }
        catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return conexion;
    }

    public static void main(String[] args) {
        try {
            Connection conexion = MySQLConnection.getConnection();
            if(conexion != null) {
                System.out.println("Se conectó");
            }
            else {
                System.out.println("No se conectó");
            }
        } catch(Exception ex) {
            System.out.println(ex.getMessage()); // ¿Qué error hubo?
        }
    }
}