package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.modelo.*;
import edu.ifsp.fintech.persistencia.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/pagar-fatura")
public class PagarFaturaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int parcelaId = Integer.parseInt(req.getParameter("id"));

            Conta conta = (Conta) req.getSession().getAttribute("contaLogada");

            ParcelaDAO parcelaDAO = new ParcelaDAO();
            Parcela parcela = parcelaDAO.buscarPorId(parcelaId);

            if (conta.getSaldo().compareTo(parcela.getValor()) < 0) {
                resp.sendRedirect("faturas?erro=saldo");
                return;
            }

            conta.setSaldo(conta.getSaldo().subtract(parcela.getValor()));
            new ContaDAO().atualizarSaldo(conta);

            parcelaDAO.marcarComoPaga(parcelaId);

            if (parcelaDAO.todasPagas(parcela.getEmprestimoId())) {
                new EmprestimoDAO().quitar(parcela.getEmprestimoId());
            }

            resp.sendRedirect("faturas");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
