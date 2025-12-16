<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.Aplicacao"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay - Minhas Aplicações</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/paginas/imgs/favicon-32x32.png">

<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
	rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="bg-base-200 min-h-screen pb-16">

	<%
	Usuario u = (Usuario) session.getAttribute("usuarioLogado");
	Conta c = (Conta) session.getAttribute("contaLogada");

	if (u == null || c == null) {
		response.sendRedirect("paginas/Login.jsp");
		return;
	}

	String primeiraLetra = u.getNome().substring(0, 1).toUpperCase();

	@SuppressWarnings("unchecked")
	List<Aplicacao> aplicacoes =
		(List<Aplicacao>) request.getAttribute("aplicacoes");

	boolean temAplicacoes =
		aplicacoes != null && !aplicacoes.isEmpty();
	%>

	<div class="navbar bg-base-100 shadow sticky top-0 z-50">
		<div class="flex-1">
			<a class="btn btn-ghost normal-case text-2xl text-primary font-bold">
				Bit Pay </a>
		</div>

		<div class="flex-none gap-3 font-medium items-center">
			<a class="btn btn-ghost btn-sm"
				href="<%= request.getContextPath() %>/paginas/Index.jsp"> <i
				class="fas fa-home mr-1"></i> Home
			</a> <a class="btn btn-ghost btn-sm hidden sm:flex"
				href="<%= request.getContextPath() %>/investimentos"> <i
				class="fas fa-chart-line mr-1"></i> Investimentos
			</a> <a class="btn btn-ghost btn-active btn-sm hidden sm:flex"
				href="<%= request.getContextPath() %>/minhas-aplicacoes"> <i
				class="fas fa-hand-holding-usd mr-1"></i> Minhas Aplicações
			</a>

			<div class="dropdown dropdown-end">
				<label tabindex="0" class="cursor-pointer">
					<div class="avatar placeholder">
						<div class="bg-primary text-primary-content rounded-full w-10">
							<span class="font-bold"><%= primeiraLetra %></span>
						</div>
					</div>
				</label>

				<ul tabindex="0"
					class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-48 mt-3 z-[1]">
					<li class="menu-title text-base-content/70">Conta #<%= c.getNumeroConta() %>
					</li>
					<li><a href="paginas/AlterarDadosUsuario.jsp"> <i
							class="fas fa-user-edit"></i> Editar dados
					</a></li>
					<li><a href="../logout" class="text-error"> <i
							class="fas fa-sign-out-alt"></i> Sair
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="max-w-5xl mx-auto mt-10 px-4">

		<div
			class="card bg-gradient-to-br from-base-100 to-base-200 shadow-xl rounded-2xl">
			<div class="card-body space-y-6 p-6">

				<a href="<%= request.getContextPath() %>/paginas/Index.jsp"
					class="text-primary font-semibold flex items-center gap-2 w-fit">
					<i class="fas fa-arrow-left"></i> <span>Voltar</span>
				</a>

				<h2 class="text-3xl font-bold text-primary">Minhas aplicações</h2>

				<% if (!temAplicacoes) { %>
				<div role="alert" class="alert alert-info shadow-lg">
					<i class="fas fa-info-circle"></i> <span>Você ainda não
						possui aplicações realizadas.</span> <a
						href="<%= request.getContextPath() %>/investimentos"
						class="btn btn-info btn-sm"> <i class="fas fa-rocket mr-1"></i>
						Aplicar Agora
					</a>
				</div>
				<% } else { %>

				<div class="overflow-x-auto">
					<table class="table table-zebra w-full">
						<thead>
							<tr class="text-primary uppercase text-sm">
								<th>Investimento</th>
								<th>Valor Aplicado</th>
								<th>Data</th>
							</tr>
						</thead>
						<tbody>
							<% for (Aplicacao ap : aplicacoes) { %>
							<tr>
								<td class="font-semibold text-base-content"><%= ap.getNomeInvestimento() %>
								</td>
								<td class="text-success font-extrabold">R$ <%= String.format("%,.2f", ap.getValor()) %>
								</td>
								<td class="text-sm text-base-content/70"><%= ap.getDataAplicacao() %>
								</td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>

				<div class="mt-4 text-center">
					<a href="<%= request.getContextPath() %>/investimentos"
						class="btn btn-primary"> Realizar Nova Aplicação </a>
				</div>

				<% } %>

			</div>
		</div>

	</div>

</body>
</html>
