<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay</title>

<link rel="icon" type="image/png" sizes="32x32"
    href="<%=request.getContextPath()%>/paginas/imgs/favicon-32x32.png">

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
    rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    crossorigin="anonymous" />
</head>

<body class="bg-base-200 min-h-screen pb-16">

<%
Usuario u = (Usuario) session.getAttribute("usuarioLogado");
Conta c = (Conta) session.getAttribute("contaLogada");

if (c == null || u == null) {
    response.sendRedirect("paginas/Login.jsp");
    return;
}

String primeiraLetra = u.getNome().substring(0, 1).toUpperCase();
String saldoFormatado = String.format("%,.2f", c.getSaldo());
%>

<div class="navbar bg-base-100 shadow sticky top-0 z-50">
    <div class="flex-1">
        <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">
            Bit Pay
        </a>
    </div>

    <div class="flex-none gap-3 font-medium items-center">
        <a class="btn btn-ghost btn-active btn-sm"
           href="<%= request.getContextPath() %>/paginas/Index.jsp">
            <i class="fas fa-home mr-1"></i> Home
        </a>

        <a class="btn btn-ghost btn-sm hidden sm:flex"
           href="<%= request.getContextPath() %>/investimentos">
            <i class="fas fa-chart-line mr-1"></i> Investimentos
        </a>

        <a class="btn btn-ghost btn-sm hidden sm:flex"
           href="<%= request.getContextPath() %>/minhas-aplicacoes">
            <i class="fas fa-hand-holding-dollar mr-1"></i> Minhas Aplicações
        </a>

        <div class="dropdown dropdown-end">
            <label tabindex="0" class="cursor-pointer">
                <div class="avatar placeholder">
                    <div class="bg-primary text-primary-content rounded-full w-10">
                        <span class="font-bold"><%=primeiraLetra%></span>
                    </div>
                </div>
            </label>

            <ul tabindex="0"
                class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-48 mt-3">
                <li class="menu-title">Conta #<%=c.getNumeroConta()%></li>
                <li><a href="AlterarDadosUsuario.jsp"><i class="fas fa-user-pen"></i> Editar dados</a></li>
                <li><a href="../logout" class="text-error"><i class="fas fa-arrow-right-from-bracket"></i> Sair</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="max-w-6xl mx-auto mt-10 px-4">

    <div class="mb-8">
        <h1 class="text-4xl font-extrabold text-primary">
            Olá, <%=u.getNome().split(" ")[0]%> 👋
        </h1>

        <span class="badge badge-outline badge-primary mt-2">
            Conta nº <%=c.getNumeroConta()%>
        </span>
    </div>

    <div class="card bg-gradient-to-r from-primary to-secondary text-primary-content shadow-2xl mb-12">
        <div class="card-body p-8 flex-row items-center justify-between">
            <div>
                <p class="uppercase tracking-widest opacity-90">Saldo disponível</p>
                <p class="text-6xl font-extrabold">R$ <%=saldoFormatado%></p>
            </div>
            <i class="fas fa-wallet text-6xl opacity-20"></i>
        </div>
    </div>

    <h2 class="text-2xl font-bold mb-6">Transações e Serviços Rápidos</h2>

    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">

        <a href="Deposito.jsp" class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition">
            <div class="card-body text-center">
                <i class="fas fa-arrow-down text-2xl text-primary mb-3"></i>
                <h2 class="font-bold">Depósito</h2>
                <p class="text-sm opacity-70">Adicionar saldo</p>
            </div>
        </a>

        <a href="Saque.jsp" class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition">
            <div class="card-body text-center">
                <i class="fas fa-arrow-up text-2xl text-primary mb-3"></i>
                <h2 class="font-bold">Saque</h2>
                <p class="text-sm opacity-70">Retirar dinheiro</p>
            </div>
        </a>

        <a href="Transferencia.jsp" class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition">
            <div class="card-body text-center">
                <i class="fas fa-arrows-rotate text-2xl text-primary mb-3"></i>
                <h2 class="font-bold">Transferência</h2>
                <p class="text-sm opacity-70">Entre contas</p>
            </div>
        </a>

        <a href="<%=request.getContextPath()%>/extrato" class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition">
            <div class="card-body text-center">
                <i class="fas fa-chart-simple text-2xl text-primary mb-3"></i>
                <h2 class="font-bold">Extrato</h2>
                <p class="text-sm opacity-70">Movimentações</p>
            </div>
        </a>

        <a href="<%=request.getContextPath()%>/emprestimos" class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition">
            <div class="card-body text-center">
                <i class="fas fa-coins text-2xl text-primary mb-3"></i>
                <h2 class="font-bold">Empréstimos</h2>
                <p class="text-sm opacity-70">Simular</p>
            </div>
        </a>

        <a href="<%=request.getContextPath()%>/faturas" class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition">
            <div class="card-body text-center">
                <i class="fas fa-receipt text-2xl text-primary mb-3"></i>
                <h2 class="font-bold">Faturas</h2>
                <p class="text-sm opacity-70">Parcelas</p>
            </div>
        </a>

        <a href="<%= request.getContextPath() %>/investimentos"
           class="card bg-base-100 shadow-lg hover:shadow-2xl hover:-translate-y-1 transition lg:col-span-2">
            <div class="card-body text-center">
                <i class="fas fa-rocket text-2xl text-primary mb-3"></i>
                <h2 class="font-bold text-lg">Acessar Investimentos</h2>
                <p class="text-sm opacity-70">Faça seu dinheiro render</p>
            </div>
        </a>

    </div>
</div>

</body>
</html>
