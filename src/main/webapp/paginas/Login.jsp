<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body class="bg-base-200 min-h-screen flex items-center justify-center">

	<div
		class="card w-full max-w-sm bg-base-100 shadow-xl relative rounded-2xl">

		<!-- Header do card -->
		<div class="relative flex items-center justify-center h-14 mb-2">

			<a href="Home.jsp"
				class="absolute left-4 btn btn-ghost btn-sm btn-circle text-primary">
				<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
					viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round"
						stroke-width="2" d="M15 19l-7-7 7-7" />
      </svg>
			</a>

			<h2 class="text-3xl font-extrabold text-primary tracking-wide">
				Bit Pay</h2>

		</div>

		<div class="card-body pt-4 px-6 pb-6">

			<form action="../login" method="post" class="space-y-4">

				<label class="form-control"> <span class="label-text">Email</span>
					<input name="email" type="email" required
					class="input input-bordered h-10 text-sm" />
				</label> <label class="form-control"> <span class="label-text">Senha</span>
					<input name="senha" type="password" required
					class="input input-bordered h-10 text-sm" />
				</label> <label class="form-control"> <span class="label-text">Tipo
						de usuário</span> <select name="tipo_usuario" required
					class="select select-bordered">
						<option value="1">Cliente</option>
						<option value="2">Gerente</option>
				</select>
				</label>

				<button type="submit" class="btn btn-primary w-full mt-2">Entrar</button>

				<div class="text-center mt-3">
					<a class="link link-primary text-sm"
						href="${pageContext.request.contextPath}/paginas/RecuperarSenha.jsp">
						Esqueci minha senha </a>
				</div>
			</form>

			<div class="text-center mt-4 text-sm text-base-content/70">
				Não tem conta? <a href="CadastrarConta.jsp"
					class="link link-primary font-medium"> Criar conta </a>
			</div>

			<% if ("conta".equals(request.getParameter("erro"))) { %>
			<p class="text-error text-center mt-3">Conta pendente de
				aprovação ou inexistente</p>
			<% } else if (request.getParameter("erro") != null) { %>
			<p class="text-error text-center mt-3">Usuário ou senha inválidos</p>
			<% } %>

		</div>
	</div>

</body>
</html>
