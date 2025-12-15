<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>
<%@ page import="edu.ifsp.fintech.modelo.Colaborador"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay</title>
<link rel="icon" type="image/png" sizes="32x32"
    href="<%=request.getContextPath()%>/paginas/imgs/favicon-32x32.png">

<link
    href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
    rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen pb-32">

<%

    Usuario u = (Usuario) session.getAttribute("usuarioLogado");
    Conta c = (Conta) session.getAttribute("contaLogada");

    if (c == null || u == null) {
        response.sendRedirect("paginas/Login.jsp");
        return;
    }
%>

    <div class="navbar bg-base-100 shadow">
        <div class="flex-1">
            <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">
                Bit Pay
            </a>
        </div>

        <div class="flex-none gap-4 font-medium items-center">

            <a class="btn btn-ghost btn-active" href="<%= request.getContextPath() %>/paginas/Index.jsp">
                Home
            </a>

            <a class="btn btn-ghost" href="<%= request.getContextPath() %>/investimentos">
                Investimentos
            </a>

            <a class="btn btn-ghost" href="<%= request.getContextPath() %>/minhas-aplicacoes">
                Minhas Aplicações
            </a>

            <a class="btn btn-ghost">Contato</a>

            <div class="dropdown dropdown-end">
                <label tabindex="0" class="cursor-pointer">
                    <div class="avatar placeholder">
                        <div class="bg-primary text-primary-content rounded-full w-10">
                            <span class="font-bold">
                                <%=u.getNome().substring(0, 1).toUpperCase()%>
                            </span>
                        </div>
                    </div>
                </label>

                <ul tabindex="0"
                    class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-44 mt-3">
                    <li><a href="AlterarDadosUsuario.jsp">Editar dados</a></li>
                    <li><a href="../logout" class="text-error">Sair</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="max-w-5xl mx-auto mt-10 px-4">

        <div class="mb-8">
            <h1 class="text-3xl font-bold text-primary">
                Olá, <%=u.getNome()%> 👋
            </h1>

            <div class="mt-2">
                <span class="badge badge-outline badge-primary">
                    Conta nº <%=c.getNumeroConta()%>
                </span>
            </div>
        </div>

        <div class="card bg-gradient-to-r from-primary to-secondary text-primary-content shadow-xl mb-10">
            <div class="card-body">
                <p class="text-sm uppercase tracking-wide opacity-80">Saldo disponível</p>
                <p class="text-4xl font-bold">
                    R$ <%=String.format("%.2f", c.getSaldo())%>
                </p>
            </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">

            <a href="Deposito.jsp"
                class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Depósito</h2>
                    <p class="text-sm text-gray-500">Adicionar saldo à conta</p>
                </div>
            </a> 

            <a href="Saque.jsp"
                class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Saque</h2>
                    <p class="text-sm text-gray-500">Retirar dinheiro</p>
                </div>
            </a> 

            <a href="Transferencia.jsp"
                class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Transferência</h2>
                    <p class="text-sm text-gray-500">Enviar para outra conta</p>
                </div>
            </a> 

            <a href="<%=request.getContextPath()%>/extrato"
                class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Extrato</h2>
                    <p class="text-sm text-gray-500">Histórico de movimentações</p>
                </div>
            </a> 

            <a href="<%=request.getContextPath()%>/emprestimos"
                class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Empréstimo</h2>
                    <p class="text-sm text-gray-500">Simular ou contratar</p>
                </div>
            </a> 

            <a href="<%=request.getContextPath()%>/faturas"
                class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Faturas</h2>
                    <p class="text-sm text-gray-500">Parcelas de empréstimos</p>
                </div>
            </a>

        </div>
    </div>
</div>

</body>
</html>
