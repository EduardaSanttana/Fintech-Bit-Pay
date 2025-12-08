<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay - Alterar dados do usuário</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-base-200 min-h-screen flex items-center justify-center">

<%
Usuario u = (Usuario) session.getAttribute("usuarioLogado");

if (u == null) {
    response.sendRedirect("paginas/Login.jsp");
    return;
}
%>

<div class="card w-full max-w-md bg-base-100 shadow-lg">

  <div class="card-body p-6">

    <h2 class="text-2xl font-bold text-center mb-4 text-primary">
      Alterar dados do usuário
    </h2>

    <form action="../alterar-usuario" method="post" class="grid grid-cols-1 gap-3">

      <label class="form-control">
        <span class="label-text">Nome</span>
        <input name="nome" value="<%= u.getNome() %>" required class="input input-bordered h-9 text-sm" />
      </label>

      <label class="form-control">
        <span class="label-text">Email</span>
        <input name="email" value="<%= u.getEmail() %>" type="email" required class="input input-bordered h-9 text-sm" />
      </label>

      <label class="form-control">
        <span class="label-text">Endereço</span>
        <input name="endereco" value="<%= u.getEndereco() %>" class="input input-bordered h-9 text-sm" />
      </label>

      <label class="form-control">
        <span class="label-text">Telefone</span>
        <input name="telefone" value="<%= u.getTelefone() %>" class="input input-bordered h-9 text-sm" />
      </label>

		
        <input type="hidden" name="id" value="<%= u.getId() %>"/>

      <button type="submit" class="btn btn-primary w-full mt-1">
        Salvar alterações
      </button>

    </form>

    <% String erroMsg = request.getParameter("erroMsg"); %>

    <% if (erroMsg != null) { %>
      <p class="text-error text-center mt-2"><%= erroMsg %></p>
    <% } %>

    <div class="text-center mt-3">
      <a href="Index.jsp" class="link link-primary">Voltar para a Home</a>
    </div>

  </div>
</div>

</body>
</html>
