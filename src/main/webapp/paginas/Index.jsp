<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<html>
<head>
<title>Dashboard</title>
</head>
<body>
	<h2>Bem-vindo, ${sessionScope.usuarioNome}</h2>
	<ul>
		<li><a
			href="${pageContext.request.contextPath}/paginas/Deposito.jsp">Depósito</a></li>
		<li><a
			href="${pageContext.request.contextPath}/paginas/Saque.jsp">Saque</a></li>
		<li><a
			href="${pageContext.request.contextPath}/paginas/Transferencia.jsp">Transferência</a></li>
		<li><a
			href="${pageContext.request.contextPath}/paginas/Extrato.jsp">Extrato</a></li>
		<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
	</ul>

<%
    HttpSession sess = request.getSession(false);
    if (sess != null && sess.getAttribute("usuarioTipo") != null &&
        "GERENTE".equalsIgnoreCase(sess.getAttribute("usuarioTipo").toString())) {
%>
    <p><a href="<%= request.getContextPath() %>/paginas/GerentePendencias.jsp">Aprovar contas pendentes</a></p>
<%
    }
%>
</body>
</html>
