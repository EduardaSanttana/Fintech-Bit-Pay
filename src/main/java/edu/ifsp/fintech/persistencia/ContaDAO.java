package edu.ifsp.fintech.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.modelo.Extrato;

public class ContaDAO {

    private ExtratoDAO extratoDAO = new ExtratoDAO();

    // ------------------------------------------------------------
    // GERA NÚMERO DA CONTA
    // ------------------------------------------------------------
    private String gerarNumeroConta() throws SQLException {
        String sql = "SELECT COUNT(*) AS quant_contas FROM contas";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            int quantidade = 0;
            if (rs.next()) {
                quantidade = rs.getInt("quant_contas");
            }
            return "2025" + String.format("%05d", quantidade + 1);
        }
    }

    // ------------------------------------------------------------
    // ABRIR CONTA
    // ------------------------------------------------------------
    public void abrirConta(int clienteId, String tipoConta) throws SQLException {
        String numeroConta = gerarNumeroConta();
        String sql = "INSERT INTO contas (CLIENTE_ID, NUMERO_CONTA, SALDO, TIPO) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, clienteId);
            stmt.setString(2, numeroConta);
            stmt.setDouble(3, 0.0);
            stmt.setString(4, tipoConta);

            stmt.executeUpdate();
        }
    }

    // ------------------------------------------------------------
    // BUSCAR CLIENTE POR NOME + CPF
    // ------------------------------------------------------------
    public int buscarClienteId(String nome, String cpf) throws SQLException {
        String sql = "SELECT ID FROM clientes WHERE NOME = ? AND CPF = ?";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nome);
            stmt.setString(2, cpf);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return rs.getInt("ID");
                return -1;
            }
        }
    }

    // ------------------------------------------------------------
    // BUSCAR CONTA PELO NÚMERO
    // ------------------------------------------------------------
    public Conta buscarPorNumeroConta(String numeroConta) throws SQLException {
        String sql = "SELECT ID, CLIENTE_ID, NUMERO_CONTA, SALDO, TIPO FROM CONTAS WHERE NUMERO_CONTA = ?";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, numeroConta);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Conta(
                        rs.getInt("ID"),
                        rs.getInt("CLIENTE_ID"),
                        rs.getString("NUMERO_CONTA"),
                        rs.getDouble("SALDO"),
                        rs.getString("TIPO")
                    );
                }
                return null;
            }
        }
    }

    // ------------------------------------------------------------
    // DEPÓSITO COM REGISTRO NO EXTRATO
    // ------------------------------------------------------------
    public boolean depositarPorNumeroConta(String numeroConta, double valor) throws SQLException {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor deve ser maior que zero.");
        }

        String sqlSelect = "SELECT ID, SALDO FROM CONTAS WHERE NUMERO_CONTA = ? FOR UPDATE";
        String sqlUpdate = "UPDATE CONTAS SET SALDO = ? WHERE ID = ?";

        Connection conn = null;
        try {
            conn = ConexaoBD.getConnection();
            conn.setAutoCommit(false);

            int contaId = -1;
            double saldoAtual;

            // Buscar conta
            try (PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
                ps.setString(1, numeroConta);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) {
                        conn.rollback();
                        return false;
                    }
                    contaId = rs.getInt("ID");
                    saldoAtual = rs.getDouble("SALDO");
                }
            }

            // Atualizar saldo
            double novoSaldo = saldoAtual + valor;
            try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                ps.setDouble(1, novoSaldo);
                ps.setInt(2, contaId);
                ps.executeUpdate();
            }

            // Registrar extrato
            extratoDAO.registrarExtrato(contaId, "DEPOSITO", valor,
                    "Depósito realizado na conta " + numeroConta);

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }
    }

    // ------------------------------------------------------------
    // SAQUE COM EXTRATO
    // ------------------------------------------------------------
    public boolean sacar(String numeroConta, double valor) throws SQLException {
        if (valor <= 0) throw new IllegalArgumentException("Valor inválido.");

        String sqlSelect = "SELECT ID, SALDO FROM CONTAS WHERE NUMERO_CONTA = ? FOR UPDATE";
        String sqlUpdate = "UPDATE CONTAS SET SALDO = ? WHERE ID = ?";

        Connection conn = null;
        try {
            conn = ConexaoBD.getConnection();
            conn.setAutoCommit(false);

            int contaId = -1;
            double saldoAtual;

            try (PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
                ps.setString(1, numeroConta);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) {
                        conn.rollback();
                        return false;
                    }
                    contaId = rs.getInt("ID");
                    saldoAtual = rs.getDouble("SALDO");
                }
            }

            if (saldoAtual < valor) {
                conn.rollback();
                return false; // saldo insuficiente
            }

            double novoSaldo = saldoAtual - valor;

            try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                ps.setDouble(1, novoSaldo);
                ps.setInt(2, contaId);
                ps.executeUpdate();
            }

            extratoDAO.registrarExtrato(contaId, "SAQUE", -valor,
                    "Saque realizado na conta " + numeroConta);

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }
    }

    // ------------------------------------------------------------
    // TRANSFERÊNCIA ENTRE CONTAS
    // ------------------------------------------------------------
    public boolean transferir(String origem, String destino, double valor) throws SQLException {
        if (valor <= 0) throw new IllegalArgumentException("Valor inválido.");

        Conta contaOrigem = buscarPorNumeroConta(origem);
        Conta contaDestino = buscarPorNumeroConta(destino);

        if (contaOrigem == null || contaDestino == null) return false;

        if (!sacar(origem, valor)) return false;
        if (!depositarPorNumeroConta(destino, valor)) return false;

        extratoDAO.registrarExtrato(contaOrigem.getId(), "TRANSFERENCIA", -valor,
                "Transferência enviada para conta " + destino);

        extratoDAO.registrarExtrato(contaDestino.getId(), "TRANSFERENCIA", valor,
                "Transferência recebida da conta " + origem);

        return true;
    }
    
    public boolean sacarPorNumeroConta(String numeroConta, double valor) throws SQLException {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor de saque deve ser maior que zero.");
        }

        String sqlSelect = "SELECT ID, SALDO FROM CONTAS WHERE NUMERO_CONTA = ? FOR UPDATE";
        String sqlUpdate = "UPDATE CONTAS SET SALDO = ? WHERE NUMERO_CONTA = ?";

        Connection conn = null;

        try {
            conn = ConexaoBD.getConnection();
            conn.setAutoCommit(false);

            int contaId;
            double saldoAtual;

            // 1 — Buscar saldo com lock
            try (PreparedStatement psSelect = conn.prepareStatement(sqlSelect)) {
                psSelect.setString(1, numeroConta);
                try (ResultSet rs = psSelect.executeQuery()) {

                    if (!rs.next()) {
                        conn.rollback();
                        return false;
                    }

                    contaId = rs.getInt("ID");
                    saldoAtual = rs.getDouble("SALDO");
                }
            }

            // 2 — Verificar saldo insuficiente
            if (saldoAtual < valor) {
                conn.rollback();
                return false;
            }

            double novoSaldo = saldoAtual - valor;

            // 3 — Atualizar saldo
            try (PreparedStatement psUpdate = conn.prepareStatement(sqlUpdate)) {
                psUpdate.setDouble(1, novoSaldo);
                psUpdate.setString(2, numeroConta);
                psUpdate.executeUpdate();
            }

            // 4 — Registrar extrato
            ExtratoDAO extratoDAO = new ExtratoDAO();
            extratoDAO.registrar(
                new Extrato(contaId, "SAQUE", valor, "Saque realizado da conta " + numeroConta)
            );

            conn.commit();
            return true;

        } catch (SQLException e) {

            if (conn != null) conn.rollback();
            throw e;

        } finally {

            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }
    }
}


