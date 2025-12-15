package edu.ifsp.fintech.controller;

import java.io.IOException;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.persistencia.ParcelaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/faturas")
public class FaturaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            Conta conta = (Conta) req.getSession().getAttribute("contaLogada");

            if (conta == null) {
                resp.sendRedirect("Login.jsp");
                return;
            }

            ParcelaDAO parcelaDAO = new ParcelaDAO();

            req.setAttribute(
                "parcelas",
                parcelaDAO.listarPendentesPorConta(conta.getId())
            );

            req.getRequestDispatcher("/paginas/Faturas.jsp")
               .forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
