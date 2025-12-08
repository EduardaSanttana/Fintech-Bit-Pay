package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/depositar")
public class RealizarDepositoServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");

            // Pega parâmetros do formulário
            String numeroConta = req.getParameter("numeroConta");
            String valorTexto = req.getParameter("valor");

            // Validação básica
            if (numeroConta == null || numeroConta.trim().isEmpty() ||
                valorTexto == null || valorTexto.trim().isEmpty()) {

                req.setAttribute("erro", "Informe número da conta e o valor.");
                req.getRequestDispatcher("/paginas/Erro.jsp").forward(req, resp);
                return;
            }

            // Converte o valor (suporta vírgula e ponto)
            double valor = Double.parseDouble(valorTexto.replace(",", "."));

            ContaDAO dao = new ContaDAO();
            boolean ok = dao.depositarPorNumeroConta(numeroConta, valor);

            if (ok) {
                req.setAttribute("mensagem", "Depósito realizado com sucesso!");
                req.getRequestDispatcher("/paginas/Sucesso.jsp").forward(req, resp);
            } else {
                req.setAttribute("erro", "Conta não encontrada ou erro ao depositar.");
                req.getRequestDispatcher("/paginas/Erro.jsp").forward(req, resp);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("erro", "Valor inválido.");
            req.getRequestDispatcher("/paginas/Erro.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Erro ao realizar depósito: ", e);
        }
    }
}
