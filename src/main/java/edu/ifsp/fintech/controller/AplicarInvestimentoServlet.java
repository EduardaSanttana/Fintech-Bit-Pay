package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.modelo.Investimento;
import edu.ifsp.fintech.persistencia.InvestimentoDAO;
import edu.ifsp.fintech.persistencia.ContaDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/investimentos")
public class AplicarInvestimentoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            InvestimentoDAO dao = new InvestimentoDAO();
            List<Investimento> lista = dao.listarInvestimentos();
            req.setAttribute("investimentos", lista);

            req.getRequestDispatcher("/paginas/Investimentos.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int idInvest = Integer.parseInt(req.getParameter("idInvestimento"));
            double valor = Double.parseDouble(req.getParameter("valor"));

            Conta conta = (Conta) req.getSession().getAttribute("contaLogada");
            int idConta = conta.getId();

            InvestimentoDAO dao = new InvestimentoDAO();
            dao.aplicar(idConta, idInvest, valor);

            // ⭐ NOVO: recarregar saldo atualizado e salvar na sessão
            ContaDAO contaDAO = new ContaDAO();
            Conta contaAtualizada = contaDAO.buscarPorId(idConta);
            req.getSession().setAttribute("contaLogada", contaAtualizada);

            req.setAttribute("mensagem", "Aplicação realizada com sucesso!");
            req.getRequestDispatcher("/paginas/InvestimentoSucesso.jsp").forward(req, resp);

        } catch (Exception e) {

            try {
                InvestimentoDAO dao = new InvestimentoDAO();
                List<Investimento> lista = dao.listarInvestimentos();
                req.setAttribute("investimentos", lista);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            req.setAttribute("erro", "Erro ao aplicar investimento: " + e.getMessage());
            req.getRequestDispatcher("/paginas/Investimentos.jsp").forward(req, resp);
        }
    }
}
