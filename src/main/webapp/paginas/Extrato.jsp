<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.Extrato"%>
<html>
<head>
<title>Extrato</title>
</head>
<body>
	<h2>Extrato</h2>
	<form action="${pageContext.request.contextPath}/extrato" method="get">
		ID da conta: <input type="number" name="id" required><br>
		<button type="submit">Gerar</button>
	</form>
	<%
	List<Extrato> lista = (List<Extrato>) request.getAttribute("extratos");
	if (lista != null) {
	%>
	<table border="1" cellpadding="6">
		<tr>
			<th>Data</th>
			<th>Tipo</th>
			<th>Valor</th>
			<th>Descrição</th>
		</tr>
		<%
		for (Extrato e : lista) {
		%>
		<tr>
			<td><%=e.getDataHora()%></td>
			<td><%=e.getTipo()%></td>
			<td><%=e.getValor()%></td>
			<td><%=e.getDescricao()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<% } %>
</body>
</html>
