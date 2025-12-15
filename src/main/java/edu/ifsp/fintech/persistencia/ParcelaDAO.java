package edu.ifsp.fintech.persistencia;

import edu.ifsp.fintech.modelo.Parcela;
import java.sql.*;
import java.sql.Date;
import java.util.*;

public class ParcelaDAO {

	private Connection getConnection() throws Exception {
		return ConexaoBD.getConnection();
	}

	public void salvar(Parcela p) throws Exception {
		String sql = " INSERT INTO PARCELAS (EMPRESTIMO_ID, NUMERO, VALOR, DATA_VENCIMENTO, STATUS) VALUES (?, ?, ?, ?, ?)";

		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, p.getEmprestimoId());
			ps.setInt(2, p.getNumero());
			ps.setBigDecimal(3, p.getValor());
			ps.setDate(4, Date.valueOf(p.getDataVencimento()));
			ps.setString(5, p.getStatus());

			ps.executeUpdate();
		}
	}

	public List<Parcela> listarPendentesPorConta(int contaId) throws Exception {
		List<Parcela> lista = new ArrayList<>();

		String sql = "SELECT p.* FROM PARCELAS p JOIN EMPRESTIMOS e ON e.ID = p.EMPRESTIMO_ID WHERE e.CONTA_ID = ? AND p.STATUS = 'PENDENTE' ORDER BY p.DATA_VENCIMENTO";

		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, contaId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Parcela p = new Parcela();
				p.setId(rs.getInt("ID"));
				p.setEmprestimoId(rs.getInt("EMPRESTIMO_ID"));
				p.setNumero(rs.getInt("NUMERO"));
				p.setValor(rs.getBigDecimal("VALOR"));
				p.setDataVencimento(rs.getDate("DATA_VENCIMENTO").toLocalDate());
				p.setStatus(rs.getString("STATUS"));

				lista.add(p);
			}
		}
		return lista;
	}

	public Parcela buscarPorId(int id) throws Exception {
		String sql = "SELECT * FROM PARCELAS WHERE ID = ?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Parcela p = new Parcela();
				p.setId(id);
				p.setEmprestimoId(rs.getInt("EMPRESTIMO_ID"));
				p.setValor(rs.getBigDecimal("VALOR"));
				return p;
			}
		}
		return null;
	}

	public void marcarComoPaga(int id) throws Exception {
		String sql = "UPDATE PARCELAS SET STATUS = 'PAGA' WHERE ID = ?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		}
	}

	public boolean todasPagas(int emprestimoId) throws Exception {
		String sql = "SELECT COUNT(*) FROM PARCELAS WHERE EMPRESTIMO_ID = ? AND STATUS = 'PENDENTE' ";

		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, emprestimoId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1) == 0;
		}
	}
}
