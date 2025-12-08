<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Transferência</title>
</head>
<body>
	<h2>Transferência</h2>
	<p style="color: red">${erro}</p>
	<form action="${pageContext.request.contextPath}/transferir"
		method="post">
		Conta origem: <input name="origem" required><br> Conta
		destino: <input name="destino" required><br> Valor: <input
			name="valor" type="number" step="0.01" required><br>
		<button type="submit">Transferir</button>
	</form>
</body>
</html>
