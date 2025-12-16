<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="edu.ifsp.fintech.modelo.Usuario,edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay - Transferência</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/paginas/imgs/favicon-32x32.png">

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
				href="${pageContext.request.contextPath}/paginas/Index.jsp"> 
                <i class="fas fa-home mr-1"></i> Home
			</a>

			<div class="dropdown dropdown-end">
				<label tabindex="0" class="cursor-pointer">
					<div class="avatar placeholder">
						<div class="bg-primary text-primary-content rounded-full w-10">
							<span class="font-bold"> <%=primeiraLetra%>
							</span>
						</div>
					</div>
				</label>

				<ul tabindex="0"
					class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-48 mt-3 z-[1]">
					<li class="menu-title text-base-content/70">Conta #<%=c.getNumeroConta()%></li>
					<li><a href="AlterarDadosUsuario.jsp"><i
							class="fas fa-user-edit"></i> Editar dados</a></li>
					<li><a href="../logout" class="text-error"><i
							class="fas fa-sign-out-alt"></i> Sair</a></li>
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

					<h2 class="text-3xl font-bold text-primary">Saque</h2>
				</div>

				<form action="../sacar" method="post" class="space-y-4">

					<div>
						<label class="label"> <span class="label-text">Valor</span>
						</label> <input type="number" step="0.01" name="valor"
							class="input input-bordered w-full" required />
					</div>

					<button type="submit" class="btn btn-primary w-full">
						Confirmar Saque</button>
				</form>

				<% if ("1".equals(request.getParameter("sucesso"))) { %>
				<p class="text-success text-center">Saque realizado com sucesso!
				</p>
				<% } %>

				<% if ("1".equals(request.getParameter("erroSaldo"))) { %>
				<p class="text-error text-center">Saldo insuficiente!</p>
				<% } %>

				<% if ("1".equals(request.getParameter("erro"))) { %>
				<p class="text-error text-center">Erro ao realizar saque!</p>
				<% } %>

			</div>
		</div>

	</div>

</body>
</html>
