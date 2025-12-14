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
<title>Fintech Bit Pay</title>

<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
	rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen">

	<%
Usuario u = (Usuario) session.getAttribute("usuarioLogado");
Conta c = (Conta) session.getAttribute("contaLogada");

if (u == null || c == null) {
    response.sendRedirect("paginas/Login.jsp");
    return;
}
%>

	<div class="navbar bg-base-100 shadow">
		<div class="flex-1">
			<a class="btn btn-ghost normal-case text-2xl text-primary font-bold">
				Bit Pay </a>
		</div>

		<div class="flex-none gap-4 font-medium items-center">
			<a href="${pageContext.request.contextPath}/paginas/Index.jsp"
				class="btn btn-ghost">Home</a>

			<div class="dropdown dropdown-end">
				<label tabindex="0"
					class="cursor-pointer hover:opacity-80 transition">
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

	<div class="max-w-6xl mx-auto pt-12">

		<div class="card bg-base-100 border border-base-300 rounded-2xl">
			<div class="card-body space-y-6">

				<div class="flex items-center gap-4">
					<a href="<%= request.getContextPath() %>/paginas/Index.jsp"
						class="btn btn-ghost btn-sm gap-2 text-primary"> <svg
							xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
							viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                    </svg> Voltar
					</a>
				</div>

				<h2 class="text-3xl font-bold text-primary">Empréstimos</h2>

				<%
                List<Emprestimo> emprestimos =
                    (List<Emprestimo>) request.getAttribute("emprestimos");

                boolean temEmprestimos =
                    emprestimos != null && !emprestimos.isEmpty();
            %>

				<div role="tablist" class="tabs tabs-bordered">

					<input type="radio" name="emprestimoTabs" role="tab"
						class="tab font-medium" aria-label="Meus Empréstimos"
						<%= temEmprestimos ? "checked" : "" %> />

					<div role="tabpanel" class="tab-content pt-6">

						<%
                        if (!temEmprestimos) {
                    %>
						<div class="alert alert-info">
							<span>Você ainda não possui empréstimos contratados.</span>
						</div>
						<%
                        } else {
                    %>

						<div class="overflow-x-auto">
							<table class="table table-zebra">
								<thead>
									<tr>
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
										<td><%= e.getTaxaJuros() %></td>
										<td class="font-semibold text-primary">R$ <%= e.getValorTotal() %>
										</td>
										<td><span class="badge badge-success"> <%= e.getStatus() %>
										</span></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>

						<%
                        }
                    %>

					</div>

					<input type="radio" name="emprestimoTabs" role="tab"
						class="tab font-medium" aria-label="Simulação"
						<%= temEmprestimos ? "" : "checked" %> />

					<div role="tabpanel" class="tab-content pt-6">

						<form action="<%= request.getContextPath() %>/emprestimos"
							method="post" class="space-y-4 max-w-md">

							<input type="hidden" name="acao" value="simular" />

							<div>
								<label class="label"> <span class="label-text">Valor</span>
								</label> <input type="number" step="0.01" name="valor"
									class="input input-bordered w-full" required>
							</div>

							<div>
								<label class="label"> <span class="label-text">Parcelas</span>
								</label> <input type="number" name="parcelas"
									class="input input-bordered w-full" required>
							</div>

							<button type="submit" class="btn btn-primary w-full">
								Simular Empréstimo</button>

						</form>

					</div>

				</div>

			</div>
		</div>

	</div>

</body>
</html>
