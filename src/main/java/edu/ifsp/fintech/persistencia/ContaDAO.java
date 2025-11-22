package edu.ifsp.fintech.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContaDAO {

    // Gera o número da conta automaticamente
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

    // Abre a conta para um cliente específico
    public void abrirConta(int clienteId, String tipoConta) throws SQLException {
        String numeroConta = gerarNumeroConta();
        String sql = "INSERT INTO contas (CLIENTE_ID, NUMERO_CONTA, SALDO, TIPO) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, clienteId);
            stmt.setString(2, numeroConta);
            stmt.setDouble(3, 0.0); // saldo inicial
            stmt.setString(4, tipoConta);

            stmt.executeUpdate();
        }
    }

    // Busca o ID do cliente pelo nome e CPF
    public int buscarClienteId(String nome, String cpf) throws SQLException {
        String sql = "SELECT ID FROM clientes WHERE NOME = ? AND CPF = ?";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nome);
            stmt.setString(2, cpf);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("ID");
                } else {
                    return -1; // cliente não encontrado
                }
            }
        }
    }
}
