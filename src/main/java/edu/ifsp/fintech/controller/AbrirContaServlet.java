package edu.ifsp.fintech.controller;

import edu.ifsp.fintech.persistencia.ClienteDAO;
import edu.ifsp.fintech.persistencia.ContaDAO;
import edu.ifsp.fintech.modelo.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/abrir-conta")
public class AbrirContaServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");

            String nome = req.getParameter("nome");
            String cpf = req.getParameter("cpf");
            String email = req.getParameter("email");
            String senha = req.getParameter("senha");
            String telefone = req.getParameter("telefone");
            String endereco = req.getParameter("endereco");
            String tipo = req.getParameter("tipo");

            if (tipo == null || tipo.trim().isEmpty()) {
                tipo = "CORRENTE";
            }

            if (cpf == null || cpf.trim().isEmpty()) {
                req.setAttribute("erro", "CPF é obrigatório.");
                req.getRequestDispatcher("/paginas/AbrirConta.jsp").forward(req, resp);
                return;
            }

            ClienteDAO clienteDAO = new ClienteDAO();
            ContaDAO contaDAO = new ContaDAO();

            Cliente cliente = clienteDAO.buscarPorCpf(cpf);

            if (cliente == null) {

                if (nome == null || nome.trim().isEmpty() ||
                    email == null || email.trim().isEmpty() ||
                    senha == null || senha.trim().isEmpty()) {

                    req.setAttribute("erro", "Cliente não encontrado. Para criar cliente, informe nome, email e senha.");
                    req.getRequestDispatcher("/paginas/AbrirConta.jsp").forward(req, resp);
                    return;
                }

                Cliente novo = new Cliente(nome, cpf, email, senha, telefone, endereco);
                novo = clienteDAO.criar(novo);
                cliente = novo;
            }

            // Agora pega o número da conta criada
            String numeroContaCriada = contaDAO.abrirConta(cliente.getId(), tipo);

            req.setAttribute("mensagem",
                "Conta criada com sucesso para " + cliente.getNome() +
                ". Número da conta: " + numeroContaCriada);

            req.setAttribute("numeroConta", numeroContaCriada);

            req.getRequestDispatcher("/paginas/Sucesso.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Erro ao abrir conta: ", e);
        }
    }
}
