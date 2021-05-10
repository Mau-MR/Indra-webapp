package mx.itesm.Indra.login.model;

import java.io.Serializable;
import java.util.Arrays;

public class Candidato implements Serializable {
    // Model del Candidato

    private String nombre;
    private String paterno;
    private String materno;
    private String curp;
    private String telefono;
    private String correo;
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
    private int duracion;
    private String[] preguntas = new String[26];
    private String[] respuestas = new String[26];
    private String[] tiempos = new String[26];
    private int actividades;

    public Candidato() {

    }

    public Candidato(String nombre, String paterno, String materno, String curp, String telefono,
                     String correo, boolean status, boolean acceso, String interes, String skill_inteligencia,
                     String skill_trabajo, String grado_academico, String primera_carrera, String segunda_carrera,
                     int score_inteligencia, int score_trabajo, int duracion, String[] preguntas, String[] respuestas,
                     String[] tiempos, int actividades) {
        this.nombre = nombre;
        this.paterno = paterno;
        this.materno = materno;
        this.curp = curp;
        this.telefono = telefono;
        this.correo = correo;
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
        this.duracion = duracion;
        this.preguntas = preguntas;
        this.respuestas = respuestas;
        this.tiempos = tiempos;
        this.actividades = actividades;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String[] getPreguntas() {
        return preguntas;
    }

    public void setPreguntas(String[] preguntas) {
        this.preguntas = preguntas;
    }

    public String[] getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(String[] respuestas) {
        this.respuestas = respuestas;
    }

    public String[] getTiempos() {
        return tiempos;
    }

    public void setTiempos(String[] tiempos) {
        this.tiempos = tiempos;
    }

    public int getActividades() {
        return actividades;
    }

    public void setActividades(int actividades) {
        this.actividades = actividades;
    }

    @Override
    public String toString() {
        return "Candidato{" +
                "nombre='" + nombre + '\'' +
                ", paterno='" + paterno + '\'' +
                ", materno='" + materno + '\'' +
                ", curp='" + curp + '\'' +
                ", telefono='" + telefono + '\'' +
                ", correo='" + correo + '\'' +
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
                ", duracion=" + duracion +
                ", preguntas=" + Arrays.toString(preguntas) +
                ", respuestas=" + Arrays.toString(respuestas) +
                ", tiempos=" + Arrays.toString(tiempos) +
                ", actividades=" + actividades +
                '}';
    }
}