package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import edu.ifsp.fintech.persistencia.ContaDAO;

@WebServlet("/abrir-conta")
public class AbrirContaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String tipoConta = request.getParameter("tipoConta");

        ContaDAO dao = new ContaDAO();

        try {
            int clienteId = dao.buscarClienteId(nome, cpf);

            if (clienteId == -1) {
                response.sendRedirect("paginas/Erro.jsp");
                return;
            }

            dao.abrirConta(clienteId, tipoConta);
            response.sendRedirect("paginas/Sucesso.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("paginas/Erro.jsp");
        }
    }
}
