package edu.ifsp.fintech.persistencia;

import edu.ifsp.fintech.modelo.Emprestimo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmprestimoDAO {

	private Connection getConnection() throws Exception {
		return ConexaoBD.getConnection();
	}

	public int salvar(Emprestimo e) throws Exception {

		String sql = """
				    INSERT INTO EMPRESTIMOS
				    (CONTA_ID, VALOR, PARCELAS, TAXA_JUROS, VALOR_TOTAL, STATUS, DATA_CONTRATACAO)
				    VALUES (?, ?, ?, ?, ?, ?, ?)
				""";

		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			ps.setInt(1, e.getContaId());
			ps.setBigDecimal(2, e.getValor());
			ps.setInt(3, e.getParcelas());
			ps.setBigDecimal(4, e.getTaxaJuros());
			ps.setBigDecimal(5, e.getValorTotal());
			ps.setString(6, e.getStatus());
			ps.setDate(7, Date.valueOf(e.getDataContratacao()));

			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}

		throw new RuntimeException("Erro ao salvar empréstimo");
	}

	public List<Emprestimo> listarPorConta(int contaId) throws Exception {

		List<Emprestimo> lista = new ArrayList<>();

		String sql = """
				    SELECT *
				    FROM EMPRESTIMOS
				    WHERE CONTA_ID = ?
				    ORDER BY DATA_CONTRATACAO DESC
				""";

		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, contaId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Emprestimo e = new Emprestimo(rs.getInt("CONTA_ID"), rs.getBigDecimal("VALOR"), rs.getInt("PARCELAS"),
						rs.getBigDecimal("TAXA_JUROS"), rs.getBigDecimal("VALOR_TOTAL"));

				e.setStatus(rs.getString("STATUS"));
				e.setDataContratacao(rs.getDate("DATA_CONTRATACAO").toLocalDate());

				lista.add(e);
			}
		}

		return lista;
	}

	public void quitar(int emprestimoId) throws Exception {
		String sql = "UPDATE EMPRESTIMOS SET STATUS = 'QUITADO' WHERE ID = ?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, emprestimoId);
			ps.executeUpdate();
		}
	}

}
