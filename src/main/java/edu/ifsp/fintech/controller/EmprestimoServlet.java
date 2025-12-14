package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.modelo.Emprestimo;
import edu.ifsp.fintech.modelo.SimulacaoEmprestimo;
import edu.ifsp.fintech.persistencia.ContaDAO;
import edu.ifsp.fintech.persistencia.EmprestimoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/emprestimos")
public class EmprestimoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Conta conta = (Conta) session.getAttribute("contaLogada");

            EmprestimoDAO dao = new EmprestimoDAO();
            List<Emprestimo> emprestimos = dao.listarPorConta(conta.getId());

            request.setAttribute("emprestimos", emprestimos);

            request.getRequestDispatcher("/paginas/Emprestimo.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        try {
            if ("simular".equals(acao)) {
                simular(request, response);
            } else if ("contratar".equals(acao)) {
                contratar(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void simular(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double valor = Double.parseDouble(request.getParameter("valor"));
        int parcelas = Integer.parseInt(request.getParameter("parcelas"));
        double taxaJuros = 0.02;

        double saldo = valor;
        double amortizacao = valor / parcelas;
        double totalPago = 0;
        double totalJuros = 0;

        List<SimulacaoEmprestimo> tabela = new ArrayList<>();

        for (int i = 1; i <= parcelas; i++) {
            double juros = saldo * taxaJuros;
            double parcelaValor = amortizacao + juros;

            totalPago += parcelaValor;
            totalJuros += juros;
            saldo -= amortizacao;

            tabela.add(new SimulacaoEmprestimo(
                i,
                saldo < 0 ? 0 : saldo,
                juros,
                amortizacao,
                parcelaValor
            ));
        }

        request.setAttribute("tabela", tabela);
        request.setAttribute("valor", valor);
        request.setAttribute("parcelas", parcelas);
        request.setAttribute("taxaJuros", taxaJuros);
        request.setAttribute("totalPago", totalPago);
        request.setAttribute("totalJuros", totalJuros);

        request.getRequestDispatcher("/paginas/resultadoEmprestimo.jsp")
               .forward(request, response);
    }

    private void contratar(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();
        Conta conta = (Conta) session.getAttribute("contaLogada");

        BigDecimal valor = new BigDecimal(request.getParameter("valor"));
        int parcelas = Integer.parseInt(request.getParameter("parcelas"));
        BigDecimal taxaJuros = new BigDecimal(request.getParameter("taxaJuros"));
        BigDecimal valorTotal = new BigDecimal(request.getParameter("valorTotal"));

        Emprestimo emprestimo = new Emprestimo(
            conta.getId(), valor, parcelas, taxaJuros, valorTotal
        );

        EmprestimoDAO emprestimoDAO = new EmprestimoDAO();
        ContaDAO contaDAO = new ContaDAO();

        emprestimoDAO.salvar(emprestimo);

        BigDecimal novoSaldo = conta.getSaldo().add(valor);
        contaDAO.atualizarSaldo(conta.getId(), novoSaldo);

        conta.setSaldo(novoSaldo);
        session.setAttribute("contaLogada", conta);

        contaDAO.registrarExtrato(
            conta.getId(),
            "CREDITO",
            valor,
            "Empréstimo contratado"
        );

        response.sendRedirect(
            request.getContextPath() + "/emprestimos"
        );
    }
}
