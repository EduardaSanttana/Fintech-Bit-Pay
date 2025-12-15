<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Recuperar Senha - Bit Pay</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen flex items-center justify-center">

<div class="card w-96 bg-base-100 shadow-xl p-6">
    <h2 class="text-2xl font-bold text-center mb-4">Recuperar Senha</h2>

    <form action="${pageContext.request.contextPath}/recuperar-senha" method="post">

        <label class="label">
            <span class="label-text">Digite seu e-mail cadastrado</span>
        </label>

        <input type="email" name="email"
               class="input input-bordered w-full mb-4"
               placeholder="email@exemplo.com" required>

        <button type="submit" class="btn btn-primary w-full">
            Enviar nova senha
        </button>
    </form>

    <div class="text-center mt-4">
        <a class="link" href="${pageContext.request.contextPath}/paginas/Login.jsp">
            Voltar ao login
        </a>
    </div>

    <% String msg = request.getParameter("msg"); %>
    <% if (msg != null) { %>
        <p class="text-center text-success mt-4"><%= msg %></p>
    <% } %>
</div>

</body>
</html>
