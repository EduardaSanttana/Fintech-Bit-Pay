package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/aprovar-contas")
public class AprovaContaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException {

        try {
            List<Map<String, Object>> lista = new ContaDAO().listarContasPendentes();

            request.setAttribute("contasPendentes", lista);
            request.getRequestDispatcher("paginas/AprovarConta.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/Index.jsp?erro=1");
        }
    }
}