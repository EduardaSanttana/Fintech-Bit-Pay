package edu.ifsp.fintech.persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.ifsp.fintech.modelo.Cliente;

public class ClienteDAO {

    public void inserir(Cliente c) throws SQLException {
        String sql = "INSERT INTO CLIENTES (NOME, EMAIL, SENHA, CPF, ENDERECO, TELEFONE) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, c.getNome());
        stmt.setString(2, c.getEmail());
        stmt.setString(3, c.getSenha());
        stmt.setString(4, c.getCpf());
        stmt.setString(5, c.getEndereco());
        stmt.setString(6, c.getTelefone());

        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public Cliente buscarPorId(int id) throws SQLException {
        String sql = "SELECT * FROM CLIENTES WHERE ID = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        Cliente c = null;
        if (rs.next()) {
            c = mapearCliente(rs);
        }

        rs.close();
        stmt.close();
        conn.close();

        return c;
    }

    public Cliente buscarPorEmail(String email) throws SQLException {
        String sql = "SELECT * FROM CLIENTES WHERE EMAIL = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);

        ResultSet rs = stmt.executeQuery();

        Cliente c = null;
        if (rs.next()) {
            c = mapearCliente(rs);
        }

        rs.close();
        stmt.close();
        conn.close();

        return c;
    }

    public Cliente login(String email, String senha) throws SQLException {
        String sql = "SELECT * FROM CLIENTES WHERE EMAIL = ? AND SENHA = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, email);
        stmt.setString(2, senha);

        ResultSet rs = stmt.executeQuery();

        Cliente c = null;
        if (rs.next()) {
            c = mapearCliente(rs);
        }

        rs.close();
        stmt.close();
        conn.close();

        return c;
    }

    public List<Cliente> listarTodos() throws SQLException {
        String sql = "SELECT * FROM CLIENTES";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        ResultSet rs = stmt.executeQuery();

        List<Cliente> lista = new ArrayList<>();

        while (rs.next()) {
            lista.add(mapearCliente(rs));
        }

        rs.close();
        stmt.close();
        conn.close();

        return lista;
    }

    public void atualizar(Cliente c) throws SQLException {
        String sql = "UPDATE CLIENTES SET NOME = ?, EMAIL = ?, ENDERECO = ?, TELEFONE = ? "
                   + "WHERE ID = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, c.getNome());
        stmt.setString(2, c.getEmail());
        stmt.setString(3, c.getEndereco());
        stmt.setString(4, c.getTelefone());
        stmt.setInt(5, c.getId());

        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public void atualizarSenha(int id, String novaSenha) throws SQLException {
        String sql = "UPDATE CLIENTES SET SENHA = ? WHERE ID = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, novaSenha);
        stmt.setInt(2, id);

        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public void deletar(int id) throws SQLException {
        String sql = "DELETE FROM CLIENTES WHERE ID = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);

        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public boolean emailExiste(String email) throws SQLException {
        String sql = "SELECT ID FROM CLIENTES WHERE EMAIL = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, email);

        ResultSet rs = stmt.executeQuery();

        boolean existe = rs.next();

        rs.close();
        stmt.close();
        conn.close();

        return existe;
    }

    public boolean cpfExiste(String cpf) throws SQLException {
        String sql = "SELECT ID FROM CLIENTES WHERE CPF = ?";

        Connection conn = ConexaoBD.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, cpf);

        ResultSet rs = stmt.executeQuery();

        boolean existe = rs.next();

        rs.close();
        stmt.close();
        conn.close();

        return existe;
    }

    private Cliente mapearCliente(ResultSet rs) throws SQLException {
        return new Cliente(
            rs.getInt("ID"),
            rs.getString("NOME"),
            rs.getString("EMAIL"),
            rs.getString("SENHA"),
            rs.getString("CPF"),
            rs.getString("ENDERECO"),
            rs.getString("TELEFONE"),
            rs.getString("TIPO_CONTA")
        );
    }
}
