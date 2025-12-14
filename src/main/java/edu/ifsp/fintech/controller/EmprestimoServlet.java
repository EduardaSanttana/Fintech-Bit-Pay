package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.util.List;

import edu.ifsp.fintech.modelo.Emprestimo;
import edu.ifsp.fintech.persistencia.EmprestimoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/simular-emprestimo")
public class EmprestimoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final double TAXA_JUROS_MENSAL = 0.02;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/paginas/Emprestimo.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double valor = Double.parseDouble(request.getParameter("valor"));
        int parcelas = Integer.parseInt(request.getParameter("parcelas"));

        EmprestimoDAO dao = new EmprestimoDAO();
        List<Emprestimo> tabela =
                dao.simularSAC(valor, TAXA_JUROS_MENSAL, parcelas);

        double totalJuros = tabela.stream()
                                  .mapToDouble(Emprestimo::getJuros)
                                  .sum();

        double totalPago = tabela.stream()
                                 .mapToDouble(Emprestimo::getValorParcela)
                                 .sum();

        request.setAttribute("tabela", tabela);
        request.setAttribute("totalJuros", totalJuros);
        request.setAttribute("totalPago", totalPago);

        request.getRequestDispatcher("/paginas/resultadoEmprestimo.jsp")
               .forward(request, response);
    }
}
