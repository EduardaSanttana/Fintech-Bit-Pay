<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario,edu.ifsp.fintech.modelo.Conta" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay</title>
</head>
<body>
<%
Usuario u = (Usuario) session.getAttribute("usuarioLogado");
Conta c = (Conta) session.getAttribute("contaLogada");

if (u == null || c == null) {
    response.sendRedirect("Login.jsp");
    return;
}
%>

<h2>Saque</h2>

<form action="../sacar" method="post">
    Valor: <input type="number" step="0.01" name="valor" required><br><br>
    <button type="submit">Confirmar Saque</button>
</form>

<% if ("1".equals(request.getParameter("sucesso"))) { %>
    <p style="color:green">Saque realizado com sucesso!</p>
<% } %>

<% if ("1".equals(request.getParameter("erroSaldo"))) { %>
    <p style="color:red">Saldo insuficiente!</p>
<% } %>

<% if ("1".equals(request.getParameter("erro"))) { %>
    <p style="color:red">Erro ao realizar saque!</p>
<% } %>

<br>
<a href="Index.jsp">Voltar</a>

</body>
</html>