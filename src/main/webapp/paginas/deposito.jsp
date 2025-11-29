<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Realizar Depósito</title>
</head>
<body>
<h2>Realizar Depósito</h2>

<form action="${pageContext.request.contextPath}/realizar-deposito" method="post">
    <label for="numeroConta">Número da Conta:</label>
    <input type="text" id="numeroConta" name="numeroConta" required />
    <br/>

    <label for="valor">Valor (ex: 100.50):</label>
    <input type="text" id="valor" name="valor" required />
    <br/>

    <button type="submit">Depositar</button>
</form>

<a href="${pageContext.request.contextPath}/">Voltar</a>
</body>
</html>