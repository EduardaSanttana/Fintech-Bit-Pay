<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - BitPay</title>
</head>
<body>

<h2>Login</h2>

<form action="../login" method="post">
    <label>Email:</label>
    <input name="email" required><br><br>

    <label>Senha:</label>
    <input name="senha" type="password" required><br><br>

    <button type="submit">Entrar</button>
</form>

<br>

<!-- 🔗 LINK PARA CRIAR CONTA -->
<a href="CadastrarConta.jsp">Criar Conta</a>

<br><br>

<% if (request.getParameter("erro") != null) { %>
    <p style="color:red">Usuário ou senha inválidos</p>
<% } %>

<% if (request.getParameter("sucesso") != null) { %>
    <p style="color:green">Conta criada com sucesso! Faça login.</p>
<% } %>

</body>
</html>
