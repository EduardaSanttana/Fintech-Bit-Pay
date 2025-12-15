<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.Aplicacao"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>

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

    if (u == null || c == null) {
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

        <a class="btn btn-ghost"
           href="<%= request.getContextPath() %>/paginas/Index.jsp">
            Home
        </a>

        <a class="btn btn-ghost"
           href="<%= request.getContextPath() %>/investimentos">
            Investimentos
        </a>

        <a class="btn btn-ghost btn-active"
           href="<%= request.getContextPath() %>/minhas-aplicacoes">
            Minhas Aplicações
        </a>

        <a class="btn btn-ghost">Contato</a>

        <div class="dropdown dropdown-end">
            <label tabindex="0" class="cursor-pointer">
                <div class="avatar placeholder">
                    <div class="bg-primary text-primary-content rounded-full w-10">
                        <span class="font-bold">
                            <%= u.getNome().substring(0,1).toUpperCase() %>
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

    <div class="card bg-base-100 border border-base-300 rounded-2xl">
        <div class="card-body space-y-6">

            <div class="flex items-center gap-4">
                <a href="<%= request.getContextPath() %>/paginas/Index.jsp"
                   class="btn btn-ghost btn-sm gap-2 text-primary">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="h-4 w-4" fill="none"
                         viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round"
                              stroke-linejoin="round"
                              stroke-width="2"
                              d="M15 19l-7-7 7-7" />
                    </svg>
                    Voltar
                </a>
            </div>

            <h2 class="text-3xl font-bold text-primary">
                Minhas Aplicações
            </h2>

            <%
                List<Aplicacao> aplicacoes =
                    (List<Aplicacao>) request.getAttribute("aplicacoes");

                boolean temAplicacoes =
                    aplicacoes != null && !aplicacoes.isEmpty();
            %>

            <% if (!temAplicacoes) { %>
                <div class="alert alert-info">
                    <span>Você ainda não possui aplicações realizadas.</span>
                </div>
            <% } else { %>

                <div class="overflow-x-auto">
                    <table class="table table-zebra w-full">
                        <thead>
                            <tr>
                                <th>Investimento</th>
                                <th>Valor Aplicado</th>
                                <th>Data</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Aplicacao ap : aplicacoes) { %>
                            <tr>
                                <td class="font-medium">
                                    <%= ap.getNomeInvestimento() %>
                                </td>
                                <td class="text-primary font-semibold">
                                    R$ <%= String.format("%.2f", ap.getValor()) %>
                                </td>
                                <td>
                                    <%= ap.getDataAplicacao() %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

            <% } %>

        </div>
    </div>

</div>

</body>
</html>
