<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Abrir Conta</title>
</head>
<body>
    <div class="container">
        <h2>Abrir Conta</h2>
        <form action="${pageContext.request.contextPath}/abrir-conta" method="post">
            <label>Nome do Cliente</label>
            <input type="text" name="nome" required>

            <label>CPF do Cliente</label>
            <input type="text" name="cpf" required>

            <label>Tipo da Conta</label>
            <select name="tipoConta">
                <option value="CORRENTE">Corrente</option>
                <option value="POUPANCA">Poupança</option>
            </select>

            <button type="submit">Abrir Conta</button>
        </form>
    </div>
</body>
</html>
