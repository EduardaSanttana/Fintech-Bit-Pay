package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.math.BigDecimal;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/depositar")
public class DepositoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        BigDecimal valor = new BigDecimal(request.getParameter("valor"));
        Conta conta = (Conta) request.getSession().getAttribute("contaLogada");

        try {
            BigDecimal novoSaldo = conta.getSaldo().add(valor);

            ContaDAO dao = new ContaDAO();
            dao.atualizarSaldo(conta.getId(), novoSaldo);
            dao.registrarExtrato(conta.getId(), "DEPOSITO", valor, "Depósito realizado");

            conta.setSaldo(novoSaldo);

            response.sendRedirect("paginas/Deposito.jsp?sucesso=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/Deposito.jsp?erro=1");
        }
    }
}
