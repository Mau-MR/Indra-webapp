package mx.itesm.Indra.login.model;

import java.io.Serializable;

public class Candidato implements Serializable {

    private String nombre;
    private String paterno;
    private String materno;
    private String curp;
    private int telefono;
    private String correo;
    private int edad;
    private boolean status;
    private boolean acceso;
    private String interes;
    private String skill_inteligencia;
    private String skill_trabajo;
    private String grado_academico;
    private String primera_carrera;
    private String segunda_carrera;
    private int score_inteligencia;
    private int score_trabajo;

    public Candidato() {

    }

    public Candidato(String nombre, String paterno, String materno, String curp, int telefono, String correo, int edad,
                     boolean status, boolean acceso, String interes, String skill_inteligencia, String skill_trabajo,
                     String grado_academico, String primera_carrera, String segunda_carrera, int score_inteligencia,
                     int score_trabajo) {
        this.nombre = nombre;
        this.paterno = paterno;
        this.materno = materno;
        this.curp = curp;
        this.telefono = telefono;
        this.correo = correo;
        this.edad = edad;
        this.status = status;
        this.acceso = acceso;
        this.interes = interes;
        this.skill_inteligencia = skill_inteligencia;
        this.skill_trabajo = skill_trabajo;
        this.grado_academico = grado_academico;
        this.primera_carrera = primera_carrera;
        this.segunda_carrera = segunda_carrera;
        this.score_inteligencia = score_inteligencia;
        this.score_trabajo = score_trabajo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
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

    public String getPrimera_carrera() {
        return primera_carrera;
    }

    public void setPrimera_carrera(String primera_carrera) {
        this.primera_carrera = primera_carrera;
    }

    public String getSegunda_carrera() {
        return segunda_carrera;
    }

    public void setSegunda_carrera(String segunda_carrera) {
        this.segunda_carrera = segunda_carrera;
    }

    public int getScore_inteligencia() {
        return score_inteligencia;
    }

    public void setScore_inteligencia(int score_inteligencia) {
        this.score_inteligencia = score_inteligencia;
    }

    public int getScore_trabajo() {
        return score_trabajo;
    }

    public void setScore_trabajo(int score_trabajo) {
        this.score_trabajo = score_trabajo;
    }

    @Override
    public String toString() {
        return "Candidato{" +
                "nombre='" + nombre + '\'' +
                ", paterno='" + paterno + '\'' +
                ", materno='" + materno + '\'' +
                ", curp='" + curp + '\'' +
                ", telefono=" + telefono +
                ", correo='" + correo + '\'' +
                ", edad=" + edad +
                ", status=" + status +
                ", acceso=" + acceso +
                ", interes='" + interes + '\'' +
                ", skill_inteligencia='" + skill_inteligencia + '\'' +
                ", skill_trabajo='" + skill_trabajo + '\'' +
                ", grado_academico='" + grado_academico + '\'' +
                ", primera_carrera='" + primera_carrera + '\'' +
                ", segunda_carrera='" + segunda_carrera + '\'' +
                ", score_inteligencia=" + score_inteligencia +
                ", score_trabajo=" + score_trabajo +
                '}';
    }
}