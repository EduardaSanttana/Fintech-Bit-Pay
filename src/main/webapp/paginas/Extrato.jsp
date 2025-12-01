<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.ifsp.fintech.modelo.Extrato" %>
<%@ page import="edu.ifsp.fintech.modelo.Conta" %>

<html>
<head>
    <title>Extrato da Conta</title>
    <style>
        table {
            width: 70%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px;
            text-align: center;
        }
        th {
            background: #eee;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>

<%
    Conta conta = (Conta) request.getAttribute("conta");
    List<Extrato> extrato = (List<Extrato>) request.getAttribute("extrato");
%>

<h2>Extrato da Conta <%= conta.getNumeroConta() %></h2>

<table>
    <tr>
        <th>Data</th>
        <th>Tipo</th>
        <th>Valor</th>
        <th>Descrição</th>
    </tr>

    <% for (Extrato e : extrato) { %>
    <tr>
        <td><%= e.getDataHora() %></td>
        <td><%= e.getTipo() %></td>

        <% if (e.getTipo().equals("DEPOSITO")) { %>
            <td style="color: green;">+ <%= e.getValor() %></td>
        <% } else { %>
            <td style="color: red;">- <%= e.getValor() %></td>
        <% } %>

        <td><%= e.getDescricao() %></td>
    </tr>
    <% } %>
</table>

</body>
</html>
