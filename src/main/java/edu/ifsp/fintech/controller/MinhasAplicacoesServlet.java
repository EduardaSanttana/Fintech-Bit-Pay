package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import edu.ifsp.fintech.modelo.Aplicacao;
import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.persistencia.AplicacaoDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/minhas-aplicacoes")
public class MinhasAplicacoesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Conta conta = (Conta) req.getSession().getAttribute("contaLogada");
            int idConta = conta.getId();

            AplicacaoDAO dao = new AplicacaoDAO();
            List<Aplicacao> lista = dao.listarPorConta(idConta);

            req.setAttribute("aplicacoes", lista);
            req.getRequestDispatcher("/paginas/MinhasAplicacoes.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
