<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.SimulacaoEmprestimo"%>
<%@ page
	import="edu.ifsp.fintech.modelo.Usuario,edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay</title>

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
	%>

	<div class="navbar bg-base-100 shadow sticky top-0 z-50">
		<div class="flex-1">
			<a class="btn btn-ghost normal-case text-2xl text-primary font-bold">
				Bit Pay </a>
		</div>

		<div class="flex-none gap-3 font-medium items-center">
			<a class="btn btn-ghost btn-sm"
				href="${pageContext.request.contextPath}/paginas/Index.jsp"> <i
				class="fas fa-home mr-1"></i> Home
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
					<li><a href="AlterarDadosUsuario.jsp"> <i
							class="fas fa-user-edit"></i> Editar dados
					</a></li>
					<li><a href="../logout" class="text-error"> <i
							class="fas fa-sign-out-alt"></i> Sair
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="max-w-6xl mx-auto pt-12 pb-16 px-4">

		<div class="card bg-base-100 shadow-xl">
			<div class="card-body space-y-8">

				<div class="flex flex-col gap-2">
					<a href="Index.jsp"
						class="btn btn-ghost btn-sm gap-2 text-primary w-fit"> <svg
							xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
							viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" d="M15 19l-7-7 7-7" />
          </svg> Voltar
					</a>

					<h2 class="text-3xl font-bold text-primary">Resultado da
						Simulação</h2>
				</div>

				<div
					class="stats stats-vertical md:stats-horizontal shadow bg-base-200">

					<div class="stat">
						<div class="stat-title">Total de Juros</div>
						<div class="stat-value text-error">
							R$
							<%= String.format("%.2f", request.getAttribute("totalJuros")) %>
						</div>
					</div>

					<div class="stat">
						<div class="stat-title">Total Pago</div>
						<div class="stat-value text-success">
							R$
							<%= String.format("%.2f", request.getAttribute("totalPago")) %>
						</div>
					</div>

				</div>

				<div class="overflow-x-auto">
					<table class="table table-zebra w-full">
						<thead>
							<tr class="text-primary">
								<th>Parcela</th>
								<th>Saldo Devedor</th>
								<th>Juros</th>
								<th class="text-right">Valor da Parcela</th>
							</tr>
						</thead>
						<tbody>

							<%
							List<SimulacaoEmprestimo> tabela =
								(List<SimulacaoEmprestimo>) request.getAttribute("tabela");

							if (tabela != null && !tabela.isEmpty()) {
								for (SimulacaoEmprestimo e : tabela) {
							%>
							<tr>
								<td><%= e.getParcela() %></td>
								<td>R$ <%= String.format("%.2f", e.getSaldoDevedor()) %></td>
								<td class="text-error">R$ <%= String.format("%.2f", e.getJuros()) %>
								</td>
								<td class="font-bold text-primary text-right">R$ <%= String.format("%.2f", e.getValorParcela()) %>
								</td>
							</tr>
							<%
								}
							}
							%>

						</tbody>
					</table>
				</div>

				<div class="divider"></div>

				<div class="flex flex-col md:flex-row gap-4">

					<a href="<%= request.getContextPath() %>/paginas/Emprestimo.jsp"
						class="btn btn-outline flex-1"> Nova Simulação </a>

					<form action="<%= request.getContextPath() %>/emprestimos"
						method="post" class="flex-1">

						<input type="hidden" name="acao" value="contratar" /> <input
							type="hidden" name="valor"
							value="<%= request.getAttribute("valor") %>" /> <input
							type="hidden" name="parcelas"
							value="<%= request.getAttribute("parcelas") %>" /> <input
							type="hidden" name="taxaJuros"
							value="<%= request.getAttribute("taxaJuros") %>" /> <input
							type="hidden" name="valorTotal"
							value="<%= request.getAttribute("totalPago") %>" />

						<button type="submit" class="btn btn-primary w-full">
							Finalizar Empréstimo</button>
					</form>

				</div>

			</div>
		</div>

	</div>

</body>
</html>
