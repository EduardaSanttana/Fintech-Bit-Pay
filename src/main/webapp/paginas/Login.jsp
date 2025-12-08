<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<h2>Login</h2>
	<p style="color: red">${erro}</p>
	<form action="${pageContext.request.contextPath}/login" method="post">
		Email: <input type="email" name="email" required><br>
		Senha: <input type="password" name="senha" required><br>
		<button type="submit">Entrar</button>
	</form>
	<a href="${pageContext.request.contextPath}/paginas/RecuperarSenha.jsp">Recuperar
		senha</a>
	<br />
	<a href="${pageContext.request.contextPath}/paginas/AbrirConta.jsp">Abrir
		conta</a>
</body>
</html>
