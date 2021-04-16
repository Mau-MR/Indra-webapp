package mx.itesm.Indra.login.dao;

import mx.itesm.Indra.login.model.Candidato;

import java.util.List;

public interface ICandidatosDao {

    List<Candidato> cargarCandidatos();
}
