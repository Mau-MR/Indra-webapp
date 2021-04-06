package mx.itesm.Indra.login.dao;

import mx.itesm.Indra.login.model.Cuenta;

public interface ILoginDao {
     public boolean verifyUser(String correo, String password);
     public String getUserType(String correo);
     public Cuenta verifyStatus(String correo, String password);

}