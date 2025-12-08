package edu.ifsp.fintech.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.UUID;
import edu.ifsp.fintech.persistencia.ClienteDAO;
import java.sql.SQLException;

@WebServlet("/recuperar-senha")
public class RecuperarSenhaServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String token = UUID.randomUUID().toString();
            ClienteDAO dao = new ClienteDAO();
            dao.salvarTokenRecuperacao(email, token);
            req.setAttribute("mensagem", "Token gerado: " + token + " (substituir envio por e-mail)");
            req.getRequestDispatcher("/paginas/RecuperarSenha.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
