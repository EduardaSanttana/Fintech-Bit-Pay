package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ExtratoDAO;
import edu.ifsp.fintech.modelo.Extrato;
import edu.ifsp.fintech.service.GerarPDFService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/extrato/pdf")
public class ExtratoPDFServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String inicio = req.getParameter("inicio");
        String fim = req.getParameter("fim");

        int idConta = (int) req.getSession().getAttribute("idConta");

        try {
            ExtratoDAO dao = new ExtratoDAO();
            List<Extrato> lista = dao.listarPorPeriodo(idConta, inicio, fim);

            byte[] pdf = GerarPDFService.gerarPDF(lista, inicio, fim);

            resp.setContentType("application/pdf");
            resp.setHeader("Content-Disposition", "attachment; filename=extrato.pdf");
            resp.getOutputStream().write(pdf);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
