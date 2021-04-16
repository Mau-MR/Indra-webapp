package mx.itesm.Indra.login.controller;

import mx.itesm.Indra.login.dao.CandidatosDao;
import mx.itesm.Indra.login.model.Candidato;
import mx.itesm.Indra.login.utility.MySQLConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "candidatos", value = "/candidatos")
public class CandidatosController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
