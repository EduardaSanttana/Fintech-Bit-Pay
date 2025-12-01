package edu.ifsp.fintech.persistencia;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import edu.ifsp.fintech.modelo.Extrato;

public class ExtratoDAO {

    public void registrar(Extrato ext) throws SQLException {
        String sql = "INSERT INTO EXTRATOS (CONTA_ID, TIPO, VALOR, DESCRICAO) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, ext.getContaId());
            stmt.setString(2, ext.getTipo());
            stmt.setDouble(3, ext.getValor());
            stmt.setString(4, ext.getDescricao());

            stmt.executeUpdate();
        }
    }

    public void registrarExtrato(int contaId, String tipo, double valor, String descricao) throws SQLException {
        String sql = "INSERT INTO EXTRATOS (CONTA_ID, TIPO, VALOR, DESCRICAO) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, contaId);
            stmt.setString(2, tipo);
            stmt.setDouble(3, valor);
            stmt.setString(4, descricao);

            stmt.executeUpdate();
        }
    }

    public List<Extrato> listarPorConta(int contaId) throws SQLException {
        String sql = "SELECT * FROM EXTRATOS WHERE CONTA_ID = ? ORDER BY DATA_HORA DESC";

        List<Extrato> lista = new ArrayList<>();

        try (Connection conn = ConexaoBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, contaId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    lista.add(new Extrato(
                        rs.getInt("ID"),
                        rs.getInt("CONTA_ID"),
                        rs.getString("TIPO"),
                        rs.getDouble("VALOR"),
                        rs.getTimestamp("DATA_HORA").toLocalDateTime(),
                        rs.getString("DESCRICAO")
                    ));
                }
            }
        }

        return lista;
    }
}
