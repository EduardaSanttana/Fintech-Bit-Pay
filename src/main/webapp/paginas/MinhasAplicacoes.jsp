<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, edu.ifsp.fintech.modelo.Aplicacao" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Minhas Aplicações - Bit Pay</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen">

<div class="container mx-auto mt-10">
    <h1 class="text-3xl font-bold mb-6">Minhas Aplicações</h1>

    <table class="table table-zebra w-full">
        <thead>
            <tr>
                <th>Investimento</th>
                <th>Valor aplicado</th>
                <th>Data</th>
            </tr>
        </thead>
        <tbody>

        <%
            List<Aplicacao> lista = (List<Aplicacao>) request.getAttribute("aplicacoes");

            if (lista != null && !lista.isEmpty()) {
                for (Aplicacao ap : lista) {
        %>
        <tr>
            <td><%= ap.getNomeInvestimento() %></td>
            <td>R$ <%= String.format("%.2f", ap.getValor()) %></td>
            <td><%= ap.getDataAplicacao() %></td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="3" class="text-center">Nenhuma aplicação encontrada.</td>
        </tr>
        <% } %>

        </tbody>
    </table>
</div>

</body>
</html>
