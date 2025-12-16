<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.Investimento"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay - Investimentos</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%= request.getContextPath() %>/paginas/imgs/favicon-32x32.png">

<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
	rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="bg-base-200 min-h-screen">

	<%
	Usuario u = (Usuario) session.getAttribute("usuarioLogado");
	Conta c = (Conta) session.getAttribute("contaLogada");

	if (u == null || c == null) {
		response.sendRedirect("Login.jsp");
		return;
	}

	String primeiraLetra = u.getNome().substring(0, 1).toUpperCase();
	String sucesso = (String) request.getAttribute("sucesso");
	String erro = (String) request.getAttribute("erro");

	@SuppressWarnings("unchecked")
	List<Investimento> lista =
		(List<Investimento>) request.getAttribute("investimentos");
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
			</a> <a class="btn btn-ghost btn-active btn-sm hidden sm:flex"
				href="<%= request.getContextPath() %>/investimentos"> <i
				class="fas fa-chart-line mr-1"></i> Investimentos
			</a> <a class="btn btn-ghost btn-sm hidden sm:flex"
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

	<div class="max-w-md mx-auto pt-12">

		<div class="card bg-base-100 shadow-xl">
			<div class="card-body space-y-4">

				<div class="flex flex-col gap-2">
					<a href="paginas/Index.jsp"
						class="btn btn-ghost btn-sm gap-2 text-primary w-fit"> <i
						class="fas fa-arrow-left"></i> Voltar
					</a>

					<h2 class="text-3xl font-bold text-primary">Investimentos</h2>
				</div>

				<% if (sucesso != null) { %>
				<p class="text-success text-center font-medium">
					<%= sucesso %>
				</p>
				<% } %>

				<% if (erro != null) { %>
				<p class="text-error text-center font-medium">
					<%= erro %>
				</p>
				<% } %>

				<form action="<%= request.getContextPath() %>/investimentos"
					method="post" class="space-y-4">

					<div>
						<label class="label"> <span class="label-text">Escolha
								o investimento</span>
						</label> <select name="idInvestimento"
							class="select select-bordered w-full" required>
							<%
							if (lista != null && !lista.isEmpty()) {
								for (Investimento i : lista) {
							%>
							<option value="<%= i.getId() %>">
								<%= i.getNome() %> (Risco:
								<%= i.getRisco() %> | Rent:
								<%= String.format("%.2f", i.getRentabilidade()) %>% a.a.)
							</option>
							<%
								}
							} else {
							%>
							<option disabled selected>Nenhum investimento disponível
							</option>
							<%
							}
							%>
						</select>
					</div>

					<div>
						<label class="label"> <span class="label-text">Valor
								da aplicação</span>
						</label> <input type="number" step="0.01" min="0.01" name="valor"
							class="input input-bordered w-full" required />
					</div>

					<button type="submit" class="btn btn-primary w-full">
						Confirmar Aplicação</button>

					<a href="<%= request.getContextPath() %>/minhas-aplicacoes"
						class="btn btn-outline btn-primary w-full"> Ver Minhas
						Aplicações </a>

				</form>

			</div>
		</div>

	</div>

</body>
</html>
