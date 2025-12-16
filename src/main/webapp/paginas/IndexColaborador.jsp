<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.ifsp.fintech.modelo.Usuario"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>
<%@ page import="edu.ifsp.fintech.modelo.Colaborador"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Bit Pay</title>
    <link rel="icon" type="image/png" sizes="32x32"href="<%=request.getContextPath()%>/paginas/imgs/favicon-32x32.png">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen pb-32">

    <%
        Colaborador u = (Colaborador) session.getAttribute("usuarioLogado");

        if (u == null) {
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

                <ul tabindex="0" class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-44 mt-3">
                    <li><a href="AlterarDadosColaborador.jsp">Editar dados</a></li>
                    <li><a href="<%=request.getContextPath()%>/logout" class="text-error">Sair</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="max-w-5xl mx-auto mt-10 px-4">

        <div class="mb-8">
            <h1 class="text-3xl font-bold text-primary">
                Olá, <%=u.getNome()%> 👋
            </h1>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">

            <a href="../aprovar-contas" class="card bg-base-100 shadow hover:shadow-lg transition">
                <div class="card-body text-center">
                    <h2 class="font-bold text-primary text-lg">Contas pendentes</h2>
                    <p class="text-sm text-gray-500">Contas pendentes de aprovação/reprovação</p>
                </div>
            </a>

        </div>
    </div>

</div>

</body>
</html>