package mx.itesm.Indra.login.model;

import java.io.Serializable;

public class Cuenta implements Serializable {
    private int id_cuenta;
    private int id_rol;
    private int id_persona;
    private String correo;
    private String password;
    private boolean status;

    public Cuenta() {

    }

    public Cuenta(String correo, String password, boolean status) {
        this.correo = correo;
        this.password = password;
        this.status = status;
    }

    public int getId_cuenta() {
        return id_cuenta;
    }

    public void setId_cuenta(int id_cuenta) {
        this.id_cuenta = id_cuenta;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Cuenta{" +
                "id_cuenta=" + id_cuenta +
                ", id_rol=" + id_rol +
                ", id_persona=" + id_persona +
                ", correo='" + correo + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                '}';
    }
}
