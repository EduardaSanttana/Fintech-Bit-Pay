package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ClienteDAO;
import edu.ifsp.fintech.modelo.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            ClienteDAO dao = new ClienteDAO();
            Cliente c = dao.autenticar(email, senha);

            if (c != null) {

                HttpSession s = request.getSession(true);
                s.setAttribute("usuarioId", c.getId());
                s.setAttribute("usuarioNome", c.getNome());

                // NÃO TEM MAIS TIPO

                response.sendRedirect(request.getContextPath() + "/paginas/Index.jsp");

            } else {

                request.setAttribute("erro", "Email ou senha inválidos");
                request.getRequestDispatcher("/paginas/Login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
