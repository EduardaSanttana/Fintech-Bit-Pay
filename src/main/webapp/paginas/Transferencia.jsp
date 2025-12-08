<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario,edu.ifsp.fintech.modelo.Conta" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay - Transferência</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
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
    <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">Bit Pay</a>
  </div>
  <div class="flex-none gap-4 font-medium">
    <a href="Index.jsp" class="btn btn-ghost">Dashboard</a>
    <a href="../logout" class="btn btn-outline btn-primary">Sair</a>
  </div>
</div>

<div class="max-w-md mx-auto mt-12 p-6">
  <h2 class="text-3xl font-bold text-primary text-center mb-6">Transferência</h2>

  <div class="card bg-base-100 shadow-xl">
    <div class="card-body">
      <form action="../transferir" method="post" class="space-y-4">

        <label class="form-control">
          <span class="label-text">Nº Conta Destino</span>
          <input type="text" name="contaDestino" required
                 class="input input-bordered" />
        </label>

        <label class="form-control">
          <span class="label-text">Valor</span>
          <input type="number" step="0.01" name="valor" required
                 class="input input-bordered" />
        </label>

        <button type="submit" class="btn btn-primary w-full">
          Confirmar Transferência
        </button>

      </form>

      <% if ("1".equals(request.getParameter("sucesso"))) { %>
        <p class="text-success text-center mt-3">Transferência realizada com sucesso!</p>
      <% } %>

      <% if ("1".equals(request.getParameter("erroSaldo"))) { %>
        <p class="text-error text-center mt-3">Saldo insuficiente!</p>
      <% } %>

      <% if ("1".equals(request.getParameter("erroConta"))) { %>
        <p class="text-error text-center mt-3">Conta destino não encontrada!</p>
      <% } %>

      <% if ("1".equals(request.getParameter("erro"))) { %>
        <p class="text-error text-center mt-3">Erro ao realizar transferência!</p>
      <% } %>

      <div class="text-center mt-6">
        <a href="Index.jsp" class="link link-primary">Voltar</a>
      </div>

    </div>
  </div>
</div>

</body>
</html>
