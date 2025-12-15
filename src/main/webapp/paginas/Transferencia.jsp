<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="edu.ifsp.fintech.modelo.Usuario,edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/paginas/imgs/favicon-32x32.png">

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
    response.sendRedirect("Login.jsp");
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

	<div class="max-w-md mx-auto pt-12">

		<div class="card bg-base-100 shadow-xl">
			<div class="card-body space-y-6">

				<div class="flex flex-col gap-2">
					<a href="Index.jsp"
						class="btn btn-ghost btn-sm gap-2 text-primary w-fit"> <svg
							xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none"
							viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" d="M15 19l-7-7 7-7" />
          </svg> Voltar
					</a>

					<h2 class="text-3xl font-bold text-primary">Transferência</h2>
				</div>

				<form action="../transferir" method="post" class="space-y-4">

					<div>
						<label class="label"> <span class="label-text">Nº
								Conta Destino</span>
						</label> <input type="text" name="contaDestino"
							class="input input-bordered w-full" required />
					</div>

					<div>
						<label class="label"> <span class="label-text">Valor</span>
						</label> <input type="number" step="0.01" name="valor"
							class="input input-bordered w-full" required />
					</div>

					<button type="submit" class="btn btn-primary w-full">
						Confirmar Transferência</button>
				</form>

				<% if ("1".equals(request.getParameter("sucesso"))) { %>
				<p class="text-success text-center">Transferência realizada com
					sucesso!</p>
				<% } %>

				<% if ("1".equals(request.getParameter("erroSaldo"))) { %>
				<p class="text-error text-center">Saldo insuficiente!</p>
				<% } %>

				<% if ("1".equals(request.getParameter("erroConta"))) { %>
				<p class="text-error text-center">Conta destino não encontrada!
				</p>
				<% } %>

				<% if ("1".equals(request.getParameter("erro"))) { %>
				<p class="text-error text-center">Erro ao realizar
					transferência!</p>
				<% } %>

			</div>
		</div>

	</div>

</body>
</html>
