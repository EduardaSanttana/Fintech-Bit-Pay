package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ExtratoDAO;
import edu.ifsp.fintech.modelo.Extrato;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/extrato")
public class ExtratoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String inicio = req.getParameter("inicio");
            String fim = req.getParameter("fim");

            int idConta = (int) req.getSession().getAttribute("idConta");

            ExtratoDAO dao = new ExtratoDAO();

            List<Extrato> lista;

            // Se o usuário filtrou por período
            if (inicio != null && fim != null && 
                !inicio.isEmpty() && !fim.isEmpty()) {

                lista = dao.listarPorPeriodo(idConta, inicio, fim);

            } else {
                // Se abriu o extrato sem filtro
                lista = dao.listarTodos(idConta);
            }

            req.setAttribute("extratos", lista);
            req.getRequestDispatcher("/paginas/Extrato.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Erro ao buscar extrato", e);
        }
    }
}
