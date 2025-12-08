<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay - Login</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-base-200 min-h-screen flex items-center justify-center">

<div class="card w-full max-w-sm shadow-xl bg-base-100">
  <div class="card-body">

    <h2 class="text-3xl font-bold text-center mb-4 text-primary">Login</h2>

    <form action="../login" method="post" class="space-y-4">

      <label class="form-control">
        <span class="label-text">Email</span>
        <input name="email" type="email" required class="input input-bordered" />
      </label>

      <label class="form-control">
        <span class="label-text">Senha</span>
        <input name="senha" type="password" required class="input input-bordered" />
      </label>
      <button type="submit" class="btn btn-primary w-full mt-2">
        Entrar
      </button>
    </form>

    <div class="text-center mt-4">
      <a href="CadastrarConta.jsp" class="link link-primary">
        Criar Conta
      </a>
    </div>

    <% if (request.getParameter("erro") != null) { %>
      <p class="text-error text-center mt-3">Usuário ou senha inválidos</p>
    <% } %>

    <% if (request.getParameter("sucesso") != null) { %>
      <p class="text-success text-center mt-3">Conta criada com sucesso! Faça login.</p>
    <% } %>

  </div>
</div>

</body>
</html>
