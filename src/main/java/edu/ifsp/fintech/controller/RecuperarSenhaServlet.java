package edu.ifsp.fintech.controller;

import java.io.IOException;
import java.util.Properties;

import edu.ifsp.fintech.persistencia.UsuarioDAO;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/recuperar-senha")
public class RecuperarSenhaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ⚠️ CONFIGURE COM SEU GMAIL
    private static final String EMAIL_REMETENTE = "guilhermesiqueira088@gmail.com";
    private static final String SENHA_APP = "kauudbiopkwtorsq";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        UsuarioDAO dao = new UsuarioDAO();

        try {
            // 1️⃣ Verifica se o e-mail existe
            if (!emailExiste(dao, email)) {
                response.sendRedirect(request.getContextPath()
                        + "/paginas/RecuperarSenha.jsp?msg=E-mail não encontrado");
                return;
            }

            // 2️⃣ Gera nova senha
            String novaSenha = gerarSenhaAleatoria();

            // 3️⃣ Atualiza no banco (MD5 acontece no DAO)
            dao.atualizarSenhaPorEmail(email, novaSenha);

            // 4️⃣ Envia e-mail
            enviarEmail(email, novaSenha);

            response.sendRedirect(request.getContextPath()
                    + "/paginas/RecuperarSenha.jsp?msg=Nova senha enviada para seu e-mail");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/paginas/RecuperarSenha.jsp?msg=Erro ao recuperar senha");
        }
    }

    // 🔐 Gera senha simples de 8 caracteres
    private String gerarSenhaAleatoria() {
        String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder senha = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            int pos = (int) (Math.random() * caracteres.length());
            senha.append(caracteres.charAt(pos));
        }
        return senha.toString();
    }

    // 📧 Envio de e-mail
    private void enviarEmail(String destinatario, String novaSenha) throws Exception {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_REMETENTE, SENHA_APP);
                }
            }
        );

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(EMAIL_REMETENTE));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
        msg.setSubject("Nova senha - Bit Pay");

        msg.setText(
            "Sua senha foi redefinida.\n\n"
          + "Nova senha: " + novaSenha + "\n\n"
          + "Recomendamos alterar após o login."
        );

        Transport.send(msg);
    }

    // 🔎 Verifica se o e-mail existe
    private boolean emailExiste(UsuarioDAO dao, String email) throws Exception {	
        // Reaproveitando login: tenta buscar com qualquer senha inválida
        return dao.login(email, "senha_invalida") != null
                || dao.existeEmailOuCpf(email, "cpf_fake");
    }
}
