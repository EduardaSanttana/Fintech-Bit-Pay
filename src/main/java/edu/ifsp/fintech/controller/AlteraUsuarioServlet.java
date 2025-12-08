package edu.ifsp.fintech.controller;

import java.io.IOException;

import edu.ifsp.fintech.modelo.Conta;
import edu.ifsp.fintech.modelo.Usuario;
import edu.ifsp.fintech.persistencia.ContaDAO;
import edu.ifsp.fintech.persistencia.UsuarioDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/alterar-usuario")
public class AlteraUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

        Usuario u = new Usuario();
        u.setNome(request.getParameter("nome"));
        u.setEmail(request.getParameter("email"));
        u.setEndereco(request.getParameter("endereco"));
        u.setTelefone(request.getParameter("telefone"));

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            int idUsuario = Integer.parseInt(request.getParameter("id"));
            
            usuarioDAO.alterar(u, idUsuario);

            Conta conta = new ContaDAO().buscarPorUsuario( idUsuario );

            if (conta == null) {
                response.sendRedirect("paginas/Erro.jsp?erro=conta");
                return;
            }

            request.getSession().setAttribute("usuarioLogado", u);
            request.getSession().setAttribute("contaLogada", conta);

            response.sendRedirect("paginas/Index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/CadastrarConta.jsp?erroMsg=" + e.getMessage());
        }
    }
}