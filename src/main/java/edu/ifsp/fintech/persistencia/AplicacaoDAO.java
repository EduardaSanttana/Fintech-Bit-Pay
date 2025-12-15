package edu.ifsp.fintech.persistencia;

import java.sql.*;
import java.util.*;

import edu.ifsp.fintech.modelo.Aplicacao;

public class AplicacaoDAO {

    public List<Aplicacao> listarPorConta(int idConta) throws SQLException {
        String sql = """
            SELECT a.ID, a.VALOR, a.DATA_APLICACAO, 
                   i.NOME AS nomeInvestimento
            FROM APLICACOES a
            JOIN INVESTIMENTOS i ON i.ID = a.ID_INVESTIMENTO
            WHERE a.ID_CONTA = ?
            ORDER BY a.DATA_APLICACAO DESC
        """;

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, idConta);

        ResultSet rs = stmt.executeQuery();
        List<Aplicacao> lista = new ArrayList<>();

        while (rs.next()) {
            Aplicacao ap = new Aplicacao();
            ap.setId(rs.getInt("ID"));
            ap.setValor(rs.getDouble("VALOR"));
            ap.setDataAplicacao(rs.getTimestamp("DATA_APLICACAO"));
            ap.setNomeInvestimento(rs.getString("nomeInvestimento"));

            lista.add(ap);
        }

        rs.close();
        stmt.close();
        conn.close();

        return lista;
    }
}
