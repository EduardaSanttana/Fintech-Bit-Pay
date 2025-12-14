<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="
    java.util.*, 
    java.text.SimpleDateFormat,
    edu.ifsp.fintech.modelo.Extrato
" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay - Extrato</title>
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen">

<div class="navbar bg-base-100 shadow">
  <div class="flex-1">
    <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">Bit Pay</a>
  </div>
  <div class="flex-none gap-4 font-medium">
    <a href="Index.jsp" class="btn btn-ghost">Dashboard</a>
    <a href="../logout" class="btn btn-outline btn-primary">Sair</a>
  </div>
</div>

<div class="max-w-4xl mx-auto mt-12 p-6">
  <h2 class="text-3xl font-bold text-primary mb-6">Extrato Bancário</h2>

  <div class="card bg-base-100 shadow-xl">
    <div class="card-body p-6">

      <div class="overflow-x-auto">
        <table class="table table-zebra w-full">
          <thead>
            <tr>
              <th>Data</th>
              <th>Tipo</th>
              <th>Valor</th>
              <th>Descrição</th>
            </tr>
          </thead>

          <tbody>
          <%
	      List<Extrato> lista = (List<Extrato>) request.getAttribute("extratos");
	      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

          if (lista != null && !lista.isEmpty()) {
              for (Extrato e : lista) {
          %>
                <tr>
                  <td><%= sdf.format(e.getDataHora()) %></td>
                  <td><%= e.getTipo() %></td>
                  <td>R$ <%= e.getValor() %></td>
                  <td><%= e.getDescricao() %></td>
                </tr>
          <%
              }
          } else {
          %>
                <tr>
                  <td colspan="4" class="text-error text-center">Nenhum extrato encontrado.</td>
                </tr>
          <%
          }
          %>
          </tbody>

        </table>
      </div>

      <div class="flex justify-between mt-6">
        <a href="../extrato?pdf=1" class="btn btn-primary">Baixar PDF</a>
        <a href="paginas/Index.jsp" class="btn btn-outline btn-primary">Voltar</a>
      </div>

    </div>
  </div>
</div>

</body>
</html>
