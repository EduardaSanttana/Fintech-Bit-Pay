<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario,edu.ifsp.fintech.modelo.Conta" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<h2>Depósito</h2>

<form action="../depositar" method="post">
    Valor: <input type="number" step="0.01" name="valor" required><br><br>
    <button type="submit">Confirmar Depósito</button>
</form>

<% if ("1".equals(request.getParameter("sucesso"))) { %>
    <p style="color:green">Depósito realizado com sucesso!</p>
<% } %>

<% if ("1".equals(request.getParameter("erro"))) { %>
    <p style="color:red">Erro ao realizar depósito!</p>
<% } %>

<br>
<a href="Index.jsp">Voltar</a>

</body>
</html>