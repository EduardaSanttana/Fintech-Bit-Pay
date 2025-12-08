package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;

import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/aprovar-conta")
public class AprovarContaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioTipo") == null
                || !"GERENTE".equalsIgnoreCase(session.getAttribute("usuarioTipo").toString())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acesso permitido apenas para gerente.");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/paginas/GerentePendencias.jsp?erro=ID+inválido");
            return;
        }

        try {
            int contaId = Integer.parseInt(idParam);
            ContaDAO dao = new ContaDAO();
            dao.aprovarConta(contaId);
            response.sendRedirect(request.getContextPath() + "/paginas/GerentePendencias.jsp?sucesso=Conta+aprovada");
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/paginas/GerentePendencias.jsp?erro=ID+inválido");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
