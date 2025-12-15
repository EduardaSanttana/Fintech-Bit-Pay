package edu.ifsp.fintech.persistencia;

import java.sql.*;
import edu.ifsp.fintech.modelo.Colaborador;
import edu.ifsp.fintech.util.Criptografia;

public class ColaboradorDAO {

    private Connection getConnection() throws Exception {
        return ConexaoBD.getConnection();
    }

    public void salvar(Colaborador u) throws Exception {

        String sql = "INSERT INTO COLABORADORES (NOME, EMAIL, SENHA, CPF, LOGRADOURO, NUMERO, BAIRRO, CIDADE, ESTADO, TELEFONE, FUNCAO) " +
                     "VALUES (?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, u.getNome());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getCpf());
            ps.setString(5, u.getLogradouro());
            ps.setString(6, u.getNumero());
            ps.setString(7, u.getBairro());
            ps.setString(8, u.getCidade());
            ps.setString(9, u.getEstado());
            ps.setString(10, u.getTelefone());
            ps.setString(11, u.getFuncao());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                u.setId(rs.getInt(1));
            }
        }
    }

    public Colaborador login(String email, String senha) throws Exception {

        String senhaMD5 = Criptografia.md5(senha);

        String sql = "SELECT * FROM COLABORADORES WHERE EMAIL=? AND SENHA=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, senhaMD5);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Colaborador u = new Colaborador();
                u.setId(rs.getInt("ID"));
                u.setNome(rs.getString("NOME"));
                u.setEmail(rs.getString("EMAIL"));
                u.setCpf(rs.getString("CPF"));
                u.setLogradouro(rs.getString("LOGRADOURO"));
                u.setNumero(rs.getString("NUMERO"));
                u.setBairro(rs.getString("BAIRRO"));
                u.setCidade(rs.getString("CIDADE"));
                u.setEstado(rs.getString("ESTADO"));
                u.setTelefone(rs.getString("TELEFONE"));
                u.setFuncao(rs.getString("FUNCAO"));
                return u;
            }
        }
        return null;
    }

    public boolean existeEmailOuCpf(String email, String cpf) throws Exception {

        String sql = "SELECT 1 FROM COLABORADORES WHERE EMAIL=? OR CPF=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, cpf);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    public void alterar(Colaborador u, int id) throws Exception {

        String sql = "UPDATE COLABORADORES SET NOME=?, EMAIL=?, LOGRADOURO=?, NUMERO=?, BAIRRO=?, CIDADE=?, ESTADO=?, TELEFONE=? WHERE ID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getNome());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getLogradouro());
            ps.setString(4, u.getNumero());
            ps.setString(5, u.getBairro());
            ps.setString(6, u.getCidade());
            ps.setString(7, u.getEstado());
            ps.setString(8, u.getTelefone());
            ps.setInt(9, id);

            ps.executeUpdate();
        }        
    }
    
    public void atualizarSenhaPorEmail(String email, String novaSenha) throws Exception {

        String senhaMD5 = Criptografia.md5(novaSenha);

        String sql = "UPDATE COLABORADORES SET SENHA = ? WHERE EMAIL = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, senhaMD5);
            ps.setString(2, email);

            ps.executeUpdate();
        }
    }

}
