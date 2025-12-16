<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.Emprestimo"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay</title>

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

<body class="bg-base-200 min-h-screen pb-16">

	<%
	Usuario u = (Usuario) session.getAttribute("usuarioLogado");
	Conta c = (Conta) session.getAttribute("contaLogada");

	if (u == null || c == null) {
		response.sendRedirect("paginas/Login.jsp");
		return;
	}
	%>

	<div class="navbar bg-base-100 shadow sticky top-0 z-50">
		<div class="flex-1">
			<a class="btn btn-ghost normal-case text-2xl text-primary font-bold">
				Bit Pay </a>
		</div>

		<div class="flex-none gap-4 font-medium items-center">
			<a class="btn btn-ghost btn-sm"
				href="${pageContext.request.contextPath}/paginas/Index.jsp"> <i
				class="fas fa-home mr-1"></i> Home
			</a>

			<div class="dropdown dropdown-end">
				<label tabindex="0" class="cursor-pointer">
					<div class="avatar placeholder">
						<div class="bg-primary text-primary-content rounded-full w-10">
							<span class="text-sm font-bold"> <%= u.getNome().substring(0,1).toUpperCase() %>
							</span>
						</div>
					</div>
				</label>

				<ul tabindex="0"
					class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-44 mt-3">
					<li><a href="AlterarDadosUsuario.jsp">Editar dados</a></li>
					<li><a href="../logout" class="text-error">Sair</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="max-w-6xl mx-auto pt-12 px-4">

		<div class="card bg-base-100 shadow-xl rounded-2xl">
			<div class="card-body space-y-8">

				<a href="paginas/Index.jsp"
					class="btn btn-ghost btn-sm gap-2 text-primary w-fit"> <i
					class="fas fa-arrow-left"></i> Voltar
				</a>

				<h2 class="text-3xl font-bold text-primary">Empréstimos</h2>

				<%
				List<Emprestimo> emprestimos =
					(List<Emprestimo>) request.getAttribute("emprestimos");

				boolean temEmprestimos =
					emprestimos != null && !emprestimos.isEmpty();
				%>

				<div role="tablist" class="tabs tabs-bordered">

					<input type="radio" name="emprestimoTabs" role="tab"
						class="tab font-semibold" aria-label="Meus Empréstimos"
						<%= temEmprestimos ? "checked" : "" %> />

					<div role="tabpanel" class="tab-content pt-6">

						<% if (!temEmprestimos) { %>
						<div class="alert alert-info">
							<i class="fas fa-info-circle"></i> <span>Você ainda não
								possui empréstimos contratados.</span>
						</div>
						<% } else { %>

						<div class="overflow-x-auto">
							<table class="table table-zebra w-full">
								<thead>
									<tr class="text-primary">
										<th>Data</th>
										<th>Valor</th>
										<th>Parcelas</th>
										<th>Taxa</th>
										<th>Total</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<% for (Emprestimo e : emprestimos) { %>
									<tr>
										<td><%= e.getDataContratacao() %></td>
										<td>R$ <%= e.getValor() %></td>
										<td><%= e.getParcelas() %></td>
										<td><%= e.getTaxaJuros() %>%</td>
										<td class="font-semibold text-primary">R$ <%= e.getValorTotal() %>
										</td>
										<td><span class="badge badge-success badge-outline">
												<%= e.getStatus() %>
										</span></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>

						<% } %>

					</div>

					<input type="radio" name="emprestimoTabs" role="tab"
						class="tab font-semibold" aria-label="Simulação"
						<%= temEmprestimos ? "" : "checked" %> />

					<div role="tabpanel" class="tab-content pt-6">

						<form action="<%= request.getContextPath() %>/emprestimos"
							method="post"
							class="max-w-md mx-auto bg-base-200 p-8 rounded-2xl space-y-5">

							<input type="hidden" name="acao" value="simular" />

							<div>
								<label class="label font-semibold">Valor do empréstimo</label> <input
									type="number" step="0.01" name="valor"
									class="input input-bordered w-full text-lg" required>
							</div>

							<div>
								<label class="label font-semibold">Número de parcelas</label> <input
									type="number" name="parcelas"
									class="input input-bordered w-full text-lg" required>
							</div>

							<button type="submit" class="btn btn-primary w-full text-lg">
								Simular Empréstimo</button>

						</form>

					</div>

				</div>

			</div>
		</div>

	</div>

</body>
</html>
