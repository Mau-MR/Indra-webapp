package mx.itesm.Indra.login.model;

import java.io.Serializable;

public class Candidato implements Serializable {

    private String nombre;
    private String apellido;
    private String curp;
    private int telefono;
    private String correo;
    private String nacimiento;
    private int edad;
    private boolean status;
    private boolean acceso;
    private String interes;
    private String skill_inteligencia;
    private String skill_trabajo;
    private String grado_academico;
    private String carreras;

    public Candidato() {

    }

    public Candidato(String nombre, String apellido, String curp, int telefono, String correo, String nacimiento, int edad, boolean status, boolean acceso, String interes, String skill_inteligencia, String skill_trabajo, String grado_academico, String carreras) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.curp = curp;
        this.telefono = telefono;
        this.correo = correo;
        this.nacimiento = nacimiento;
        this.edad = edad;
        this.status = status;
        this.acceso = acceso;
        this.interes = interes;
        this.skill_inteligencia = skill_inteligencia;
        this.skill_trabajo = skill_trabajo;
        this.grado_academico = grado_academico;
        this.carreras = carreras;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isAcceso() {
        return acceso;
    }

    public void setAcceso(boolean acceso) {
        this.acceso = acceso;
    }

    public String getInteres() {
        return interes;
    }

    public void setInteres(String interes) {
        this.interes = interes;
    }

    public String getSkill_inteligencia() {
        return skill_inteligencia;
    }

    public void setSkill_inteligencia(String skill_inteligencia) {
        this.skill_inteligencia = skill_inteligencia;
    }

    public String getSkill_trabajo() {
        return skill_trabajo;
    }

    public void setSkill_trabajo(String skill_trabajo) {
        this.skill_trabajo = skill_trabajo;
    }

    public String getGrado_academico() {
        return grado_academico;
    }

    public void setGrado_academico(String grado_academico) {
        this.grado_academico = grado_academico;
    }

    public String getCarreras() {
        return carreras;
    }

    public void setCarreras(String carreras) {
        this.carreras = carreras;
    }

    @Override
    public String toString() {
        return "Candidato{" +
                "nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", curp='" + curp + '\'' +
                ", telefono=" + telefono +
                ", correo='" + correo + '\'' +
                ", nacimiento='" + nacimiento + '\'' +
                ", edad=" + edad +
                ", status=" + status +
                ", acceso=" + acceso +
                ", interes='" + interes + '\'' +
                ", skill_inteligencia='" + skill_inteligencia + '\'' +
                ", skill_trabajo='" + skill_trabajo + '\'' +
                ", grado_academico='" + grado_academico + '\'' +
                ", carreras='" + carreras + '\'' +
                '}';
    }
}