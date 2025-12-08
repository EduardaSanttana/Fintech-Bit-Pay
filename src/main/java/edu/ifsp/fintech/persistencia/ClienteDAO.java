package edu.ifsp.fintech.persistencia;

import edu.ifsp.fintech.modelo.Cliente;
import java.sql.*;

public class ClienteDAO {

    public Cliente criar(Cliente cliente) throws SQLException {
        String sql = "INSERT INTO CLIENTES (nome, cpf, email, senha, telefone, endereco) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCpf());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getSenha());
            ps.setString(5, cliente.getTelefone());
            ps.setString(6, cliente.getEndereco());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) cliente.setId(rs.getInt(1));
            }
            return cliente;
        }
    }

    public Cliente autenticar(String email, String senha) throws SQLException {
        String sql = "SELECT * FROM CLIENTES WHERE email = ? AND senha = ?";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, senha);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Cliente(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("cpf"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("telefone"),
                        rs.getString("endereco")
                    );
                }
            }
        }
        return null;
    }

    public Cliente buscarPorCpf(String cpf) throws SQLException {
        String sql = "SELECT * FROM CLIENTES WHERE CPF = ?";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cpf);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Cliente(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("cpf"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("telefone"),
                        rs.getString("endereco")
                    );
                }
            }
        }
        return null;
    }

    public void salvarTokenRecuperacao(String email, String token) throws SQLException {
        String sql = "INSERT INTO recuperacao_senha (email, token, criado_em) VALUES (?, ?, NOW())";
        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, token);
            ps.executeUpdate();
        }
    }
}
