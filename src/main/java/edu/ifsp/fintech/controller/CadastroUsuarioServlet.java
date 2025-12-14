package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.time.LocalDate;

import edu.ifsp.fintech.modelo.Usuario;
import edu.ifsp.fintech.persistencia.ContaDAO;
import edu.ifsp.fintech.persistencia.UsuarioDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cadastrar")
public class CadastroUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Usuario u = new Usuario();
        u.setNome(request.getParameter("nome"));
        u.setEmail(request.getParameter("email"));
        u.setSenha(request.getParameter("senha"));
        u.setCpf(request.getParameter("cpf"));

        u.setDataNascimento(LocalDate.parse(request.getParameter("dataNascimento")));

        u.setLogradouro(request.getParameter("logradouro"));
        u.setNumero(request.getParameter("numero"));
        u.setBairro(request.getParameter("bairro"));
        u.setCidade(request.getParameter("cidade"));
        u.setEstado(request.getParameter("estado"));

        u.setTelefone(request.getParameter("telefone"));

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            if (usuarioDAO.existeEmailOuCpf(u.getEmail(), u.getCpf())) {
                response.sendRedirect("paginas/CadastrarConta.jsp?erroMsg=Email ou CPF já cadastrados.");
                return;
            }

            usuarioDAO.salvar(u);

            // cria conta com situação padrão ATIVA
            new ContaDAO().criarConta(u.getId());

            response.sendRedirect("paginas/Login.jsp?sucesso=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/CadastrarConta.jsp?erroMsg=" + e.getMessage());
        }
    }
}
