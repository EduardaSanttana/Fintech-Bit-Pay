package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import edu.ifsp.fintech.persistencia.ContaDAO;

@WebServlet("/realizar-deposito")
public class RealizarDepositoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContaDAO contaDAO = new ContaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/paginas/Deposito.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String numeroConta = req.getParameter("numeroConta");
        String valorStr = req.getParameter("valor");

        if (numeroConta == null || numeroConta.trim().isEmpty() || valorStr == null || valorStr.trim().isEmpty()) {
            req.setAttribute("erro", "Número da conta e valor são obrigatórios.");
            req.getRequestDispatcher("/paginas/DepositoErro.jsp").forward(req, resp);
            return;
        }

        double valor;
        try {
            valor = Double.parseDouble(valorStr);
        } catch (NumberFormatException e) {
            req.setAttribute("erro", "Valor inválido.");
            req.getRequestDispatcher("/paginas/DepositoErro.jsp").forward(req, resp);
            return;
        }

        try {
            boolean ok = contaDAO.depositarPorNumeroConta(numeroConta, valor);
            if (ok) {
                req.setAttribute("mensagem", "Depósito realizado com sucesso!");
                req.setAttribute("numeroConta", numeroConta);
                req.setAttribute("valor", String.format("%.2f", valor));
                req.getRequestDispatcher("/paginas/DepositoSucesso.jsp").forward(req, resp);
            } else {
                req.setAttribute("erro", "Conta não encontrada ou atualização falhou.");
                req.getRequestDispatcher("/paginas/DepositoErro.jsp").forward(req, resp);
            }
        } catch (IllegalArgumentException iae) {
            req.setAttribute("erro", iae.getMessage());
            req.getRequestDispatcher("/paginas/DepositoErro.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("erro", "Erro ao acessar o banco: " + e.getMessage());
            req.getRequestDispatcher("/paginas/DepositoErro.jsp").forward(req, resp);
        }
    }
}
