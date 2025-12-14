<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen flex justify-center pt-10 pb-10">

<%
Usuario u = (Usuario) session.getAttribute("usuarioLogado");
if (u == null) {
    response.sendRedirect("paginas/Login.jsp");
    return;
}
%>

<div class="card w-full max-w-md bg-base-100 shadow-xl relative rounded-2xl">

  <div class="relative flex items-center justify-center h-14 mb-2">
    <a href="Index.jsp"
       class="absolute left-4 text-primary text-2xl p-2 transition hover:opacity-70 focus:outline-none">
      ←
    </a>

    <h2 class="text-3xl font-extrabold text-primary tracking-wide">
      <a href="Index.jsp">Bit Pay</a>
    </h2>
  </div>

  <div class="card-body pt-4 px-6 pb-6">

    <form action="../alterar-usuario" method="post" class="grid grid-cols-1 gap-3">

      <label class="form-control">
        <span class="label-text">Nome</span>
        <input name="nome" value="<%= u.getNome() %>" required class="input input-bordered h-10 text-sm" />
      </label>

      <label class="form-control">
        <span class="label-text">Email</span>
        <input name="email" value="<%= u.getEmail() %>" type="email" required class="input input-bordered h-10 text-sm" />
      </label>

      <div class="grid grid-cols-3 gap-3">
        <label class="form-control col-span-2">
          <span class="label-text">Logradouro</span>
          <input name="logradouro" value="<%= u.getLogradouro() %>" class="input input-bordered h-10 text-sm" />
        </label>

        <label class="form-control">
          <span class="label-text">Número</span>
          <input name="numero" value="<%= u.getNumero() %>" class="input input-bordered h-10 text-sm" />
        </label>
      </div>

      <label class="form-control">
        <span class="label-text">Bairro</span>
        <input name="bairro" value="<%= u.getBairro() %>" class="input input-bordered h-10 text-sm" />
      </label>

      <div class="grid grid-cols-3 gap-3">
        <label class="form-control col-span-2">
          <span class="label-text">Cidade</span>
          <input name="cidade" value="<%= u.getCidade() %>" class="input input-bordered h-10 text-sm" />
        </label>

        <label class="form-control">
          <span class="label-text">Estado</span>
          <input name="estado" value="<%= u.getEstado() %>" maxlength="2"
                 class="input input-bordered h-10 text-sm uppercase" />
        </label>
      </div>

      <label class="form-control">
        <span class="label-text">Telefone</span>
        <input name="telefone" value="<%= u.getTelefone() %>" class="input input-bordered h-10 text-sm" />
      </label>

      <input type="hidden" name="id" value="<%= u.getId() %>" />

      <button type="submit" class="btn btn-primary w-full mt-3">
        Salvar
      </button>

    </form>

    <% String erroMsg = request.getParameter("erroMsg"); %>
    <% if (erroMsg != null) { %>
      <p class="text-error text-center mt-3"><%= erroMsg %></p>
    <% } %>

  </div>
</div>

</body>
</html>
