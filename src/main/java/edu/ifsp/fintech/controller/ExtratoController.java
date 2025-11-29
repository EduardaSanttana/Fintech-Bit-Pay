package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ExtratoDAO;
import edu.ifsp.fintech.persistencia.ContaDAO;
import edu.ifsp.fintech.modelo.Extrato;
import edu.ifsp.fintech.modelo.Conta;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/extrato")
public class ExtratoController extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String numeroConta = req.getParameter("numero");

        try {
            ContaDAO contaDAO = new ContaDAO();
            Conta conta = contaDAO.buscarPorNumeroConta(numeroConta);

            if (conta == null) {
                req.setAttribute("erro", "Conta não encontrada!");
                req.getRequestDispatcher("erro.jsp").forward(req, resp);
                return;
            }

            ExtratoDAO extratoDAO = new ExtratoDAO();
            List<Extrato> extratoList = extratoDAO.listarPorConta(conta.getId());

            req.setAttribute("conta", conta);
            req.setAttribute("extrato", extratoList);

            req.getRequestDispatcher("extrato.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Erro ao carregar extrato.", e);
        }
    }
}
