package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.util.List;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.modelo.Extrato;
import edu.ifsp.fintech.persistencia.ExtratoDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/extrato")
public class ExtratoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Conta conta = (Conta) request.getSession().getAttribute("contaLogada");

        if (conta == null) {
            response.sendRedirect("paginas/Login.jsp");
            return;
        }

        try {
            List<Extrato> lista = new ExtratoDAO().listar(conta.getId());

            request.setAttribute("extratos", lista);
            request.getRequestDispatcher("paginas/Extrato.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/Extrato.jsp?erro=1");
        }
    }
}
