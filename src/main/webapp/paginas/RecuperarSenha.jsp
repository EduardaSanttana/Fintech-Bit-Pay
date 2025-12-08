<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<body>
	<h2>Recuperar Senha</h2>
	<p style="color: green">${mensagem}</p>
	<form action="${pageContext.request.contextPath}/recuperar-senha"
		method="post">
		Email: <input type="email" name="email" required><br>
		<button type="submit">Enviar</button>
	</form>
</body>
</html>
