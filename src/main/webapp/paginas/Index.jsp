<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario" %>
<%@ page import="edu.ifsp.fintech.modelo.Conta" %>

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
    response.sendRedirect("paginas/Login.jsp");
    return;
}
%>

<h2>Bem-vindo, <%= u.getNome() %>!</h2>

<p>Conta: <%= c.getNumeroConta() %></p>
<p>Saldo: R$ <%= String.format("%.2f", c.getSaldo()) %></p>

<hr>

<ul>
    <li><a href="Deposito.jsp">Depósito</a></li>
    <li><a href="Saque.jsp">Saque</a></li>
    <li><a href="Transferencia.jsp">Transferência</a></li>
    <li><a href="Extrato.jsp">Extrato</a></li>
    <li><a href="../logout">Sair</a></li>
</ul>

</body>
</html>
