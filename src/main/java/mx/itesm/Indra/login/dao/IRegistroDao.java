package mx.itesm.Indra.login.dao;

import mx.itesm.Indra.login.model.Candidato;

public interface IRegistroDao {
    public void registroCandidato(Candidato candidato, String password);
}
