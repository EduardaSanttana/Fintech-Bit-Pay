<!DOCTYPE html>
<html>
<head>
    <title>Realizar Saque</title>
</head>
<body>

<h2>Realizar Saque</h2>

<form action="../saque" method="post">

    <label>Número da Conta:</label>
    <input type="text" name="numeroConta" required><br><br>

    <label>Valor do Saque:</label>
    <input type="number" name="valor" step="0.01" required><br><br>

    <button type="submit">Sacar</button>
</form>

</body>
</html>
