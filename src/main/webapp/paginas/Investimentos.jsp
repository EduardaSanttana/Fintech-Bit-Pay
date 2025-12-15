<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, edu.ifsp.fintech.modelo.Investimento" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Investimentos - Bit Pay</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen">

<div class="container mx-auto mt-10">

    <h1 class="text-3xl font-bold mb-6">Aplicar em Investimentos</h1>

    <form action="${pageContext.request.contextPath}/investimentos" method="post" class="bg-white p-6 rounded shadow-md">

        <label class="font-bold">Escolha o investimento:</label>
        <select name="idInvestimento" class="select select-bordered w-full mb-4">

            <%
                List<Investimento> lista = (List<Investimento>) request.getAttribute("investimentos");
                for (Investimento i : lista) {
            %>
                <option value="<%= i.getId() %>">
                    <%= i.getNome() %> - <%= i.getRisco() %> - <%= i.getRentabilidade() %>% ao ano
                </option>
            <% } %>

        </select>

        <label class="font-bold">Valor da Aplicação (R$):</label>
        <input type="number" name="valor" class="input input-bordered w-full mb-4" required step="0.01">

        <button type="submit" class="btn btn-primary w-full">Aplicar</button>
    </form>

</div>

</body>
</html>
