<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Aplicação Realizada</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 h-screen flex items-center justify-center">

<div class="bg-white p-8 rounded-xl shadow-xl text-center">
    <h2 class="text-3xl font-bold mb-4">Aplicação Concluída!</h2>
    <p class="mb-6">Sua aplicação foi registrada com sucesso.</p>

    <a href="<%= request.getContextPath() %>/paginas/Index.jsp" 
       class="btn btn-primary w-full mb-2">Voltar ao Início</a>

    <a href="<%= request.getContextPath() %>/investimentos" 
       class="btn w-full">Nova Aplicação</a>
</div>

</body>
</html>
