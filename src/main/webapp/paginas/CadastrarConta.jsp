<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Bit Pay</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/paginas/imgs/favicon-32x32.png">

<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
	rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-base-200 min-h-screen flex items-center justify-center">

	<div class="card w-full max-w-md bg-base-100 shadow-xl rounded-2xl">

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
				<a href="Home.jsp">Bit Pay</a>
			</h2>
		</div>

		<div class="card-body pt-4 px-6 pb-6">

			<form action="../cadastrar" method="post" id="formCadastro"
				class="grid grid-cols-1 gap-3">

				<label class="form-control"> <span class="label-text">Nome</span>
					<input name="nome" required placeholder="Digite seu nome completo"
					class="input input-bordered h-10 text-sm" />
				</label> <label class="form-control"> <span class="label-text">Email</span>
					<input name="email" type="email" required
					placeholder="exemplo@email.com"
					class="input input-bordered h-10 text-sm" />
				</label> <label class="form-control"> <span class="label-text">Senha</span>
					<input name="senha" type="password" required
					placeholder="Crie uma senha"
					class="input input-bordered h-10 text-sm" />
				</label> <label class="form-control"> <span class="label-text">CPF</span>
					<input name="cpf" id="cpf" maxlength="14" required
					placeholder="000.000.000-00"
					class="input input-bordered h-10 text-sm" />
				</label> <label class="form-control"> <span class="label-text">Data
						de nascimento</span> <input name="dataNascimento" type="date" required
					class="input input-bordered h-10 text-sm" />
				</label>

				<div class="grid grid-cols-3 gap-3">
					<label class="form-control col-span-2"> <span
						class="label-text">Logradouro</span> <input name="logradouro"
						placeholder="Rua, avenida, etc."
						class="input input-bordered h-10 text-sm" />
					</label> <label class="form-control"> <span class="label-text">Numero</span>
						<input name="numero" maxlength="6"
						class="input input-bordered h-10 text-sm" />
					</label>
				</div>

				<label class="form-control"> <span class="label-text">Bairro</span>
					<input name="bairro" placeholder="Seu bairro"
					class="input input-bordered h-10 text-sm" />
				</label>

				<div class="grid grid-cols-3 gap-3">
					<label class="form-control col-span-2"> <span
						class="label-text">Cidade</span> <input name="cidade"
						placeholder="Sua cidade" class="input input-bordered h-10 text-sm" />
					</label> <label class="form-control"> <span class="label-text">Estado</span>
						<input name="estado" maxlength="2" placeholder="UF"
						class="input input-bordered h-10 text-sm uppercase" />
					</label>
				</div>

				<label class="form-control"> <span class="label-text">Telefone</span>
					<input name="telefone" id="telefone" maxlength="15"
					placeholder="(00) 00000-0000"
					class="input input-bordered h-10 text-sm" />
				</label>

				<button type="submit" class="btn btn-primary w-full mt-3">
					Criar Conta</button>

			</form>

		</div>
	</div>

	<%
	if ("true".equals(request.getParameter("sucesso"))) {
	%>
	<div class="toast toast-top toast-end z-50">
		<div class="alert alert-success shadow-lg">
			<span>🎉 Conta criada com sucesso! Faça login.</span>
		</div>
	</div>

	<script>
    setTimeout(() => {
        document.querySelector('.toast')?.remove();
    }, 4000);
</script>
	<%
	}
	%>


</body>
</html>
