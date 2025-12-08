<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../cadastrar" method="post">
    Nome: <input name="nome" required><br>
    Email: <input name="email" required><br>
    Senha: <input name="senha" type="password" required><br>
    CPF: <input name="cpf" required><br>
    Endereço: <input name="endereco"><br>
    Telefone: <input name="telefone"><br>

    <button type="submit">Criar Conta</button>
</form>
<% String erroMsg = request.getParameter("erroMsg"); %>

<% if (erroMsg != null) { %>
    <p style="color:red"><%= erroMsg %></p>
<% } %>

</body>
</html>