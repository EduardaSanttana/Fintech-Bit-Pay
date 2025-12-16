package edu.ifsp.fintech.controller;

import java.io.IOException;

import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/alterar-situacao-conta")
public class AlteraSituacaoContaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

		Integer idConta = Integer.parseInt(request.getParameter("idConta"));
        String acao = request.getParameter("acao");

        try {
        	
            if ("aprovar".equals(acao)) {
            	new ContaDAO().atualizarSituacao(idConta, "ATIVA");
            } else if ("reprovar".equals(acao)) {
            	new ContaDAO().atualizarSituacao(idConta, "INATIVA");
            }

            response.sendRedirect(request.getContextPath() + "/aprovar-contas");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/IndexColaborador.jsp?erroMsg=" + e.getMessage());
        }
    }
}