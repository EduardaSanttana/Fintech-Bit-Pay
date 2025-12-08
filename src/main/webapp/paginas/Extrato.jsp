<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, edu.ifsp.fintech.modelo.Extrato" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay</title>
</head>
<body>

<h2>Extrato Bancário</h2>

<table border="1">
<tr>
    <th>Data</th>
    <th>Tipo</th>
    <th>Valor</th>
    <th>Descrição</th>
</tr>

<%
List<Extrato> lista = (List<Extrato>) request.getAttribute("extratos");

if (lista != null) {
    for (Extrato e : lista) {
%>
<tr>
    <td><%= e.getDataHora() %></td>
    <td><%= e.getTipo() %></td>
    <td>R$ <%= e.getValor() %></td>
    <td><%= e.getDescricao() %></td>
</tr>

<%
    }
} else {
%>
<tr>
    <td colspan="4" style="color:red;">Nenhum extrato encontrado.</td>
</tr>
<%
}
%>

</table>

<br>

<a href="../extrato?pdf=1">Baixar PDF</a>
<br><br>

<a href="Index.jsp">Voltar</a>

</body>
</html>
