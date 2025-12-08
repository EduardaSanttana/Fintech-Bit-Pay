package edu.ifsp.fintech.persistencia;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import edu.ifsp.fintech.modelo.Extrato;

public class ExtratoDAO {

	private Connection getConnection() throws Exception {
	    return ConexaoBD.getConnection();
	}


    public List<Extrato> listar(int contaId) throws Exception {
        List<Extrato> lista = new ArrayList<>();

        String sql = "SELECT * FROM EXTRATOS WHERE CONTA_ID=? ORDER BY DATA_HORA DESC";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, contaId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Extrato e = new Extrato();
                e.setTipo(rs.getString("TIPO"));
                e.setValor(rs.getBigDecimal("VALOR"));
                e.setDataHora(rs.getTimestamp("DATA_HORA"));
                e.setDescricao(rs.getString("DESCRICAO"));

                lista.add(e);
            }
        }

        return lista;
    }
}
