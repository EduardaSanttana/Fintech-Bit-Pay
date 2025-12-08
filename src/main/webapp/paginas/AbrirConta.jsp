<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Abrir Conta</title>
</head>
<body>
	<h2>Abrir Conta</h2>
	<p style="color: red">${erro}</p>
	<form action="${pageContext.request.contextPath}/abrir-conta"
		method="post">
		Nome: <input type="text" name="nome"><br> CPF: <input
			type="text" name="cpf" required><br> Email: <input
			type="email" name="email"><br> Senha: <input
			type="password" name="senha"><br> Telefone: <input
			type="text" name="telefone"><br> Endereço: <input
			type="text" name="endereco"><br> Tipo: <select
			name="tipo"><option>CORRENTE</option>
			<option>POUPANCA</option></select><br>
		<button type="submit">Criar</button>
	</form>
</body>
</html>
