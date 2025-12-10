<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario" %>
<%@ page import="edu.ifsp.fintech.modelo.Conta" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
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
    <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">Bit Pay</a>
  </div>
  <div class="flex-none gap-4 font-medium">
    <a class="btn btn-ghost">Investimentos</a>
    <a class="btn btn-ghost">Contato</a>
    <a href="AlterarDadosUsuario.jsp" class="btn btn-ghost">Dados do usuário</a>
    <a href="../logout" class="btn btn-outline btn-primary">Sair</a>
  </div>
</div>

<div class="max-w-4xl mx-auto mt-10 p-4">
  <h1 class="text-3xl font-bold text-primary mb-6">Dashboard</h1>

  <div class="card bg-base-100 shadow-xl mb-8">
    <div class="card-body">
      <p class="text-lg font-semibold text-secondary">Saldo atual</p>
      <p class="text-4xl font-bold text-primary">
        R$ <%= String.format("%.2f", c.getSaldo()) %>
      </p>
    </div>
  </div>

<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
  <a href="Deposito.jsp" class="btn btn-outline btn-primary w-full">Depósito</a>
  <a href="Saque.jsp" class="btn btn-outline btn-primary w-full">Saque</a>
  <a href="Transferencia.jsp" class="btn btn-outline btn-primary w-full">Transferência</a>
  <a href="../extrato" class="btn btn-outline btn-primary w-full">Extrato</a>
</div>

  </div>
</div>

</body>
</html>
