package edu.ifsp.fintech.persistencia;

import java.sql.*;

import edu.ifsp.fintech.modelo.Usuario;

public class UsuarioDAO {

	private Connection getConnection() throws Exception {
	    return ConexaoBD.getConnection();
	}

    public void salvar(Usuario u) throws Exception {
        String sql = "INSERT INTO USUARIOS (NOME, EMAIL, SENHA, CPF, ENDERECO, TELEFONE) VALUES (?,?,?,?,?,?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, u.getNome());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getCpf());
            ps.setString(5, u.getEndereco());
            ps.setString(6, u.getTelefone());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                u.setId(rs.getInt(1));
            }
        }
    }

    public Usuario login(String email, String senha) throws Exception {
        String sql = "SELECT * FROM USUARIOS WHERE EMAIL=? AND SENHA=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, senha);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("ID"));
                u.setNome(rs.getString("NOME"));
                u.setEmail(rs.getString("EMAIL"));
                u.setCpf(rs.getString("CPF"));
                u.setEndereco(rs.getString("ENDERECO"));
                u.setTelefone(rs.getString("TELEFONE"));
                return u;
            }
        }

        return null;
    }
    
    public boolean existeEmailOuCpf(String email, String cpf) throws Exception {
        String sql = "SELECT 1 FROM USUARIOS WHERE EMAIL=? OR CPF=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, cpf);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

}
