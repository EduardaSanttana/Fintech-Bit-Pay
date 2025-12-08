package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import edu.ifsp.fintech.modelo.Extrato;
import edu.ifsp.fintech.persistencia.ExtratoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/extrato")
public class ExtratoServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int contaId = Integer.parseInt(req.getParameter("id"));
            ExtratoDAO dao = new ExtratoDAO();
            List<Extrato> lista = dao.listarPorConta(contaId);
            req.setAttribute("extratos", lista);
            req.getRequestDispatcher("/paginas/Extrato.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
