<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<body class="bg-base-200 min-h-screen m-0 p-0">

	<div class="max-w-xl mx-auto pt-12">
		<div class="card bg-base-100 shadow-xl">
			<div class="card-body">

				<h2 class="card-title text-2xl text-primary">Simulação de
					Empréstimo</h2>

				<%
                    String erro = (String) request.getAttribute("erro");
                    if (erro != null) {
                %>
				<div class="alert alert-error mt-4">
					<span><%= erro %></span>
				</div>
				<%
                    }
                %>

				<form action="<%= request.getContextPath() %>/simular-emprestimo"
					method="post" class="space-y-4 mt-4">

					<div>
						<label class="label"> <span class="label-text">Valor
								do Empréstimo</span>
						</label> <input type="number" step="0.01" name="valor"
							class="input input-bordered w-full" required>
					</div>

					<div>
						<label class="label"> <span class="label-text">Parcelas</span>
						</label> <input type="number" name="parcelas"
							class="input input-bordered w-full" required>
					</div>

					<div class="mt-6">
						<button type="submit" class="btn btn-primary w-full">
							Simular Empréstimo</button>
					</div>
				</form>


			</div>
		</div>
	</div>

</body>
</html>
