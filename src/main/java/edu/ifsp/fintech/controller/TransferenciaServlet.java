package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.math.BigDecimal;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.persistencia.ContaDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/transferir")
public class TransferenciaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String numDestino = request.getParameter("contaDestino");
        BigDecimal valor = new BigDecimal(request.getParameter("valor"));
        Conta origem = (Conta) request.getSession().getAttribute("contaLogada");

        try {
            ContaDAO dao = new ContaDAO();
            Conta destino = dao.buscarPorNumero(numDestino);

            if (destino == null) {
                response.sendRedirect("paginas/Transferencia.jsp?erroConta=1");
                return;
            }

            if (origem.getSaldo().compareTo(valor) < 0) {
                response.sendRedirect("paginas/Transferencia.jsp?erroSaldo=1");
                return;
            }

            BigDecimal saldoOrigem = origem.getSaldo().subtract(valor);
            BigDecimal saldoDestino = destino.getSaldo().add(valor);

            dao.atualizarSaldo(origem.getId(), saldoOrigem);
            dao.atualizarSaldo(destino.getId(), saldoDestino);

            origem.setSaldo(saldoOrigem);

            dao.registrarExtrato(
                origem.getId(), "TRANSFERENCIA", valor,
                "Para conta " + numDestino
            );

            dao.registrarExtrato(
                destino.getId(), "TRANSFERENCIA", valor,
                "Recebido de " + origem.getNumeroConta()
            );

            response.sendRedirect("paginas/Transferencia.jsp?sucesso=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/Transferencia.jsp?erro=1");
        }
    }
}
