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

	<div class="card w-full max-w-sm bg-base-100 shadow-xl rounded-2xl">

		<div class="relative flex items-center justify-center h-14 mb-2">
			<a href="<%= request.getContextPath() %>/paginas/Login.jsp"
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

			<form action="<%= request.getContextPath() %>/recuperar-senha"
				method="post" class="space-y-4">

				<label class="form-control"> <span class="label-text">Digite
						seu e-mail cadastrado</span> <input type="email" name="email" required
					placeholder="email@exemplo.com"
					class="input input-bordered h-10 text-sm" />
				</label>

				<button type="submit" class="btn btn-primary w-full">
					Enviar nova senha</button>

			</form>

		</div>
	</div>

	<% if (request.getParameter("msg") != null) { %>
	<div class="toast toast-top toast-end z-50">
		<div class="alert alert-success shadow-lg">
			<span><%= request.getParameter("msg") %></span>
		</div>
	</div>

	<script>
		setTimeout(() => {
			document.querySelector('.toast')?.remove();
		}, 4000);
	</script>
	<% } %>

</body>
</html>
