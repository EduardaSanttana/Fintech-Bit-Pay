package edu.ifsp.fintech.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import edu.ifsp.fintech.modelo.Conta;

public class ContaDAO {

    private ExtratoDAO extratoDAO = new ExtratoDAO();

    private String gerarNumeroConta() throws SQLException {
        String sql = "SELECT COUNT(*) AS total FROM contas";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            int total = 0;
            if (rs.next()) total = rs.getInt("total");
            return "2025" + String.format("%05d", total + 1);
        }
    }

    // AGORA RETORNA O NÚMERO DA CONTA
    public String abrirConta(int clienteId, String tipoConta) throws SQLException {
        String numeroConta = gerarNumeroConta();
        String sql = "INSERT INTO contas (cliente_id, numero_conta, saldo, tipo) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, clienteId);
            stmt.setString(2, numeroConta);
            stmt.setDouble(3, 0.0);
            stmt.setString(4, tipoConta);
            stmt.executeUpdate();
        }

        return numeroConta;
    }

    public Conta buscarPorNumeroConta(String numeroConta) throws SQLException {
        String sql = "SELECT id, cliente_id, numero_conta, saldo, tipo FROM contas WHERE numero_conta = ?";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, numeroConta);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Conta(
                        rs.getInt("id"),
                        rs.getInt("cliente_id"),
                        rs.getString("numero_conta"),
                        rs.getDouble("saldo"),
                        rs.getString("tipo")
                    );
                }
                return null;
            }
        }
    }

    public boolean depositarPorNumeroConta(String numeroConta, double valor) throws SQLException {
        if (valor <= 0) throw new IllegalArgumentException("Valor deve ser maior que zero.");

        String sqlSelect = "SELECT id, saldo FROM contas WHERE numero_conta = ? FOR UPDATE";
        String sqlUpdate = "UPDATE contas SET saldo = ? WHERE id = ?";

        Connection conn = null;
        try {
            conn = ConexaoBD.getConnection();
            conn.setAutoCommit(false);

            int contaId;
            double saldoAtual;

            try (PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
                ps.setString(1, numeroConta);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) { conn.rollback(); return false; }
                    contaId = rs.getInt("id");
                    saldoAtual = rs.getDouble("saldo");
                }
            }

            double novoSaldo = saldoAtual + valor;

            try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                ps.setDouble(1, novoSaldo);
                ps.setInt(2, contaId);
                ps.executeUpdate();
            }

            extratoDAO.registrar(conn, contaId, "DEPOSITO", valor, "Depósito realizado na conta " + numeroConta);
            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (conn != null) { conn.setAutoCommit(true); conn.close(); }
        }
    }

    public boolean sacar(String numeroConta, double valor) throws SQLException {
        if (valor <= 0) throw new IllegalArgumentException("Valor inválido.");

        String sqlSelect = "SELECT id, saldo FROM contas WHERE numero_conta = ? FOR UPDATE";
        String sqlUpdate = "UPDATE contas SET saldo = ? WHERE id = ?";

        Connection conn = null;
        try {
            conn = ConexaoBD.getConnection();
            conn.setAutoCommit(false);

            int contaId;
            double saldoAtual;

            try (PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
                ps.setString(1, numeroConta);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) { conn.rollback(); return false; }
                    contaId = rs.getInt("id");
                    saldoAtual = rs.getDouble("saldo");
                }
            }

            if (saldoAtual < valor) { conn.rollback(); return false; }

            double novoSaldo = saldoAtual - valor;

            try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                ps.setDouble(1, novoSaldo);
                ps.setInt(2, contaId);
                ps.executeUpdate();
            }

            extratoDAO.registrar(conn, contaId, "SAQUE", valor, "Saque realizado na conta " + numeroConta);
            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (conn != null) { conn.setAutoCommit(true); conn.close(); }
        }
    }

    public boolean transferir(String origem, String destino, double valor) throws SQLException {
        if (valor <= 0) throw new IllegalArgumentException("Valor inválido.");

        String sqlSelect = "SELECT id, saldo FROM contas WHERE numero_conta = ? FOR UPDATE";
        String sqlUpdate = "UPDATE contas SET saldo = ? WHERE id = ?";

        Connection conn = null;
        try {
            conn = ConexaoBD.getConnection();
            conn.setAutoCommit(false);

            int idOrigem, idDestino;
            double saldoOrigem, saldoDestino;

            try (PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
                ps.setString(1, origem);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) { conn.rollback(); return false; }
                    idOrigem = rs.getInt("id");
                    saldoOrigem = rs.getDouble("saldo");
                }
            }

            try (PreparedStatement ps = conn.prepareStatement(sqlSelect)) {
                ps.setString(1, destino);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) { conn.rollback(); return false; }
                    idDestino = rs.getInt("id");
                    saldoDestino = rs.getDouble("saldo");
                }
            }

            if (saldoOrigem < valor) { conn.rollback(); return false; }

            double novoSaldoOrigem = saldoOrigem - valor;
            double novoSaldoDestino = saldoDestino + valor;

            try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                ps.setDouble(1, novoSaldoOrigem);
                ps.setInt(2, idOrigem);
                ps.executeUpdate();
            }

            try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                ps.setDouble(1, novoSaldoDestino);
                ps.setInt(2, idDestino);
                ps.executeUpdate();
            }

            extratoDAO.registrar(conn, idOrigem, "TRANSFERENCIA_ENVIADA", valor, "Transferência enviada para " + destino);
            extratoDAO.registrar(conn, idDestino, "TRANSFERENCIA_RECEBIDA", valor, "Transferência recebida de " + origem);

            conn.commit();
            return true;

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (conn != null) { conn.setAutoCommit(true); conn.close(); }
        }
    }
}
