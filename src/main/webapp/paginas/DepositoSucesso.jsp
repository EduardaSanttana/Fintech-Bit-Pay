<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Depósito Realizado</title>
</head>
<body>
<h2>Sucesso</h2>
<p>${mensagem}</p>
<p>Conta: ${numeroConta}</p>
<p>Valor: R$ ${valor}</p>

<a href="${pageContext.request.contextPath}/paginas/deposito.jsp">Fazer outro depósito</a>
</body>
</html>
