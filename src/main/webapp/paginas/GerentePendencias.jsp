<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.ifsp.fintech.modelo.Conta" %>
<%@ page import="edu.ifsp.fintech.persistencia.ContaDAO" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("usuarioTipo") == null ||
        !"GERENTE".equalsIgnoreCase(sess.getAttribute("usuarioTipo").toString())) {
%>
    <h2>Acesso negado</h2>
    <p>Esta página é restrita a usuários com perfil de GERENTE.</p>
<%
        return;
    }

    ContaDAO dao = new ContaDAO();
    List<Conta> pendentes = null;
    try {
        pendentes = dao.listarContasPendentes();
    } catch (Exception e) {
        out.println("<p>Erro ao carregar contas pendentes: " + e.getMessage() + "</p>");
    }
%>
<html>
<head>
    <title>Contas Pendentes de Aprovação</title>
</head>
<body>
    <h2>Contas Pendentes de Aprovação</h2>

    <%
        String erro = request.getParameter("erro");
        String sucesso = request.getParameter("sucesso");
        if (erro != null) {
    %>
        <p style="color:red;"><%= erro %></p>
    <%
        }
        if (sucesso != null) {
    %>
        <p style="color:green;"><%= sucesso %></p>
    <%
        }
        if (pendentes == null || pendentes.isEmpty()) {
    %>
        <p>Não há contas pendentes no momento.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Cliente ID</th>
                <th>Número da Conta</th>
                <th>Saldo</th>
                <th>Tipo</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
            <%
                for (Conta c : pendentes) {
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getClienteId() %></td>
                <td><%= c.getNumeroConta() %></td>
                <td><%= c.getSaldo() %></td>
                <td><%= c.getTipo() %></td>
                <td><%= c.getStatus() %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/aprovar-conta" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= c.getId() %>"/>
                        <button type="submit">Aprovar</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <p><a href="<%= request.getContextPath() %>/paginas/Index.jsp">Voltar ao Início</a></p>
</body>
</html>
