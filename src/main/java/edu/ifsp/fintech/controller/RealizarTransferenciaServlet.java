package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/transferir")
public class RealizarTransferenciaServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String origem = req.getParameter("origem");
            String destino = req.getParameter("destino");
            double valor = Double.parseDouble(req.getParameter("valor").replace(",", "."));
            ContaDAO dao = new ContaDAO();
            boolean ok = dao.transferir(origem, destino, valor);
            if (ok) {
                req.setAttribute("mensagem", "Transferência realizada");
                req.getRequestDispatcher("/paginas/Sucesso.jsp").forward(req, resp);
            } else {
                req.setAttribute("erro", "Falha na transferência");
                req.getRequestDispatcher("/paginas/Erro.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
