package edu.ifsp.fintech.persistencia;

import java.math.BigDecimal;
import java.sql.*;

import edu.ifsp.fintech.modelo.Conta;

public class ContaDAO {

	private Connection getConnection() throws Exception {
	    return ConexaoBD.getConnection();
	}


    public void criarConta(int usuarioId) throws Exception {
        String sql = "INSERT INTO CONTAS (USUARIO_ID, NUMERO_CONTA, SALDO) VALUES (?, ?, 0.00)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String numero = "BIT" + (int)(Math.random() * 999999);

            ps.setInt(1, usuarioId);
            ps.setString(2, numero);

            ps.executeUpdate();
        }
    }

    public Conta buscarPorUsuario(int usuarioId) throws Exception {
        String sql = "SELECT * FROM CONTAS WHERE USUARIO_ID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Conta c = new Conta();
                c.setId(rs.getInt("ID"));
                c.setUsuarioId(rs.getInt("USUARIO_ID"));
                c.setNumeroConta(rs.getString("NUMERO_CONTA"));
                c.setSaldo(rs.getBigDecimal("SALDO"));
                return c;
            }
        }
        return null;
    }
    
    public void atualizarSaldo(int contaId, BigDecimal novoSaldo) throws Exception {
        String sql = "UPDATE CONTAS SET SALDO=? WHERE ID=?";
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setBigDecimal(1, novoSaldo);
            ps.setInt(2, contaId);
            ps.executeUpdate();
        }
    }

    public Conta buscarPorId(int contaId) throws Exception {
        String sql = "SELECT * FROM CONTAS WHERE ID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, contaId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Conta c = new Conta();
                c.setId(rs.getInt("ID"));
                c.setUsuarioId(rs.getInt("USUARIO_ID"));
                c.setNumeroConta(rs.getString("NUMERO_CONTA"));
                c.setSaldo(rs.getBigDecimal("SALDO"));
                return c;
            }
        }
        return null;
    }
    
    public Conta buscarPorNumero(String numeroConta) throws Exception {
        String sql = "SELECT * FROM CONTAS WHERE NUMERO_CONTA=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, numeroConta);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Conta c = new Conta();
                c.setId(rs.getInt("ID"));
                c.setUsuarioId(rs.getInt("USUARIO_ID"));
                c.setNumeroConta(rs.getString("NUMERO_CONTA"));
                c.setSaldo(rs.getBigDecimal("SALDO"));
                return c;
            }
        }
        return null;
    }
    
    public void registrarExtrato(int contaId, String tipo, BigDecimal valor, String descricao) throws Exception {
        String sql = "INSERT INTO EXTRATOS (CONTA_ID, TIPO, VALOR, DESCRICAO) VALUES (?, ?, ?, ?)";
        
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, contaId);
            ps.setString(2, tipo);
            ps.setBigDecimal(3, valor);
            ps.setString(4, descricao);
            ps.executeUpdate();
        }
    }


}
