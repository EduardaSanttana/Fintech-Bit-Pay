package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ExtratoDAO;
import edu.ifsp.fintech.service.GerarPDFService;
import edu.ifsp.fintech.modelo.Extrato;

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
            List<Extrato> lista;

            // 🔥 TRATAMENTO COMPLETO PARA EVITAR ERRO AO GERAR PDF
            boolean semData =
                (inicio == null || inicio.isBlank() || inicio.equalsIgnoreCase("null")) ||
                (fim == null || fim.isBlank() || fim.equalsIgnoreCase("null"));

            if (semData) {
                // Sem período → extrato inteiro
                lista = dao.listarTodos(idConta);
                inicio = "Início";
                fim = "Atual";
            } else {
                // Com período → filtrar
                lista = dao.listarPorPeriodo(idConta, inicio, fim);
            }

            // Gerar PDF
            byte[] pdf = GerarPDFService.gerarPDF(lista, inicio, fim);

            // Resposta PDF
            resp.setContentType("application/pdf");
            resp.setHeader("Content-Disposition", "attachment; filename=extrato.pdf");
            resp.getOutputStream().write(pdf);

        } catch (Exception e) {
            throw new ServletException("Erro ao gerar PDF do extrato", e);
        }
    }
}
