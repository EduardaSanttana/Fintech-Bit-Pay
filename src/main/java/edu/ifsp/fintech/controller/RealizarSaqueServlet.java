package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import edu.ifsp.fintech.persistencia.ContaDAO;

@WebServlet("/saque")
public class RealizarSaqueServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String numeroConta = request.getParameter("numeroConta");
        double valor = Double.parseDouble(request.getParameter("valor"));

        ContaDAO contaDAO = new ContaDAO();

        try {
            boolean sucesso = contaDAO.sacarPorNumeroConta(numeroConta, valor);

            if (sucesso) {
                response.sendRedirect("paginas/saqueSucesso.jsp");
            } else {
                response.sendRedirect("paginas/saqueErro.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("paginas/saqueErro.jsp");
        }
    }
}
