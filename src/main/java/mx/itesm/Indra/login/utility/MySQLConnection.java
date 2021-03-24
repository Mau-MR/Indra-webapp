package mx.itesm.Indra.login.utility;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection; // Similar a include en C
import java.sql.DriverManager;

public class MySQLConnection {
    public static Connection getConnection() {
        String cadena = "jdbc:mysql://Localhost:3306/pruebabloque?user=mawi&password=12345"; // &password=root
        Connection conexion = null;
        try {
            // ¿Qué driver en qué librería va a usar para conectarse?
            DriverManager.registerDriver(new Driver());
            conexion = DriverManager.getConnection(cadena);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return conexion;
    }
    // psvm + tab
    public static void main(String[] args) {
        // Toda llamada a un servicio remoto debe verificarse - try/catch
        try {
            Connection conexion = MySQLConnection.getConnection(); // sobre rojo -> alt + Enter
            if(conexion != null) {
                System.out.println("Se conectó");
            } else {
                System.out.println("No se conectó");
            }
        } catch(Exception ex) {
            System.out.println(ex.getMessage()); // ¿Qué erro hobo?
        }
    }
    // Clases genéricas para manipular la conexión a BD: java.sql
    // Toda llamada a un servisio remoto debe verificarse -> con try/catch

}

/*
Static
    No
    MySQLConnection con = new MySQLConnection();
    con.getConnection();

    SI
    MySQLConnection.getConnection();
 */