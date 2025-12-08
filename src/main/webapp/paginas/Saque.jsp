<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Saque</title>
</head>
<body>
	<h2>Saque</h2>
	<p style="color: red">${erro}</p>
	<form action="${pageContext.request.contextPath}/sacar" method="post">
		Número da conta: <input name="numeroConta" required><br>
		Valor: <input name="valor" type="number" step="0.01" required><br>
		<button type="submit">Sacar</button>
	</form>
</body>
</html>
