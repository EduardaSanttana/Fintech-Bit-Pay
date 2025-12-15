package edu.ifsp.fintech.persistencia;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.modelo.Investimento;

public class InvestimentoDAO {

    public List<Investimento> listarInvestimentos() throws SQLException {
        String sql = "SELECT * FROM INVESTIMENTOS";
        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        List<Investimento> lista = new ArrayList<>();

        while (rs.next()) {
            Investimento i = new Investimento();
            i.setId(rs.getInt("ID"));
            i.setNome(rs.getString("NOME"));
            i.setRisco(rs.getString("RISCO"));

            // ✅ CORREÇÃO AQUI — BigDecimal → double
            i.setRentabilidade(rs.getBigDecimal("RENTABILIDADE").doubleValue());

            lista.add(i);
        }

        conn.close();
        return lista;
    }

    public void aplicar(int idConta, int idInvestimento, double valor) throws Exception {

        Connection conn = ConexaoBD.getConnection();

        try {
            conn.setAutoCommit(false);

            // 1) Carrega saldo real
            ContaDAO contaDAO = new ContaDAO();
            Conta conta = contaDAO.buscarPorId(idConta);

            if (conta == null) {
                throw new Exception("Conta não encontrada!");
            }

            BigDecimal saldoAtual = conta.getSaldo();
            BigDecimal valorAplicado = BigDecimal.valueOf(valor);

            if (saldoAtual.compareTo(valorAplicado) < 0) {
                throw new Exception("Saldo insuficiente!");
            }

            // 2) Debitar saldo
            BigDecimal novoSaldo = saldoAtual.subtract(valorAplicado);
            contaDAO.atualizarSaldo(idConta, novoSaldo);

            // 3) Registrar aplicação
            String sqlAplic = "INSERT INTO APLICACOES (ID_CONTA, ID_INVESTIMENTO, VALOR) VALUES (?, ?, ?)";
            PreparedStatement psAplic = conn.prepareStatement(sqlAplic);
            psAplic.setInt(1, idConta);
            psAplic.setInt(2, idInvestimento);
            psAplic.setBigDecimal(3, valorAplicado);
            psAplic.executeUpdate();

            // 4) Registrar extrato
            contaDAO.registrarExtrato(idConta, "Débito", valorAplicado, "Aplicação em investimento");

            conn.commit();

        } catch (Exception e) {
            conn.rollback();
            throw e;

        } finally {
            conn.setAutoCommit(true);
            conn.close();
        }
    }
}
