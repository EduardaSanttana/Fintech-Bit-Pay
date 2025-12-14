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

@WebServlet("/login")
public class LoginUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try {
            Usuario usuario = new UsuarioDAO().login(email, senha);

            if (usuario != null) {

                Conta conta = new ContaDAO().buscarPorUsuario(usuario.getId());

                if (conta == null) {
                    response.sendRedirect("paginas/Erro.jsp?erro=conta");
                    return;
                }

                // SALVAR NA SESSÃO
                request.getSession().setAttribute("usuarioLogado", usuario);
                request.getSession().setAttribute("contaLogada", conta);

                // ⭐ ESSA LINHA É O QUE FALTAVA !!!
                request.getSession().setAttribute("idConta", conta.getId());

                response.sendRedirect("paginas/Index.jsp");
            } else {
                response.sendRedirect("paginas/Login.jsp?erro=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("paginas/Erro.jsp");
        }
    }
}
