<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
    java.util.*, 
    java.text.SimpleDateFormat,
    edu.ifsp.fintech.modelo.Extrato,
    edu.ifsp.fintech.modelo.Usuario,
    edu.ifsp.fintech.modelo.Conta
"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay - Extrato</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css"
      rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen">

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
        <a class="btn btn-ghost">Investimentos</a>
        <a class="btn btn-ghost">Contato</a>

        <div class="dropdown dropdown-end">
            <label tabindex="0"
                   class="cursor-pointer hover:opacity-80 transition">
                <div class="avatar placeholder">
                    <div class="bg-primary text-primary-content rounded-full w-10">
                        <span class="text-sm font-bold">
                            <%= u.getNome().substring(0,1).toUpperCase() %>
                        </span>
                    </div>
                </div>
            </label>

            <ul tabindex="0"
                class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-44 mt-3">
                <li>
                    <a href="AlterarDadosUsuario.jsp">Editar dados</a>
                </li>
                <li>
                    <a href="../logout" class="text-error">Sair</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="max-w-5xl mx-auto pt-12">

    <div class="card bg-base-100 shadow-xl">
        <div class="card-body space-y-8">

            <div class="flex flex-col gap-2">
                <a href="<%= request.getContextPath() %>/paginas/Index.jsp"
                   class="btn btn-ghost btn-sm gap-2 text-primary w-fit">
                    <svg xmlns="http://www.w3.org/2000/svg"
                         class="h-4 w-4"
                         fill="none"
                         viewBox="0 0 24 24"
                         stroke="currentColor">
                        <path stroke-linecap="round"
                              stroke-linejoin="round"
                              stroke-width="2"
                              d="M15 19l-7-7 7-7" />
                    </svg>
                    Voltar
                </a>

                <h2 class="text-3xl font-bold text-primary">
                    Extrato Bancário
                </h2>
            </div>

            <form action="${pageContext.request.contextPath}/extrato"
                  method="get"
                  class="grid grid-cols-1 md:grid-cols-3 gap-4">

                <div>
                    <label class="label font-semibold">Data inicial</label>
                    <input type="date" name="inicio"
                           class="input input-bordered w-full"
                           value="<%= request.getParameter("inicio") != null ? request.getParameter("inicio") : "" %>"
                           required>
                </div>

                <div>
                    <label class="label font-semibold">Data final</label>
                    <input type="date" name="fim"
                           class="input input-bordered w-full"
                           value="<%= request.getParameter("fim") != null ? request.getParameter("fim") : "" %>"
                           required>
                </div>

                <div class="flex items-end">
                    <button class="btn btn-primary w-full">
                        Filtrar
                    </button>
                </div>

            </form>

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
                        List<Extrato> lista =
                            (List<Extrato>) request.getAttribute("extratos");

                        SimpleDateFormat sdf =
                            new SimpleDateFormat("dd/MM/yyyy HH:mm");

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
                            <td colspan="4" class="text-center text-error">
                                Nenhum extrato encontrado.
                            </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <div class="flex justify-end">
                <form action="${pageContext.request.contextPath}/extrato/pdf"
                      method="get">
                    <input type="hidden" name="inicio"
                           value="<%= request.getParameter("inicio") %>">
                    <input type="hidden" name="fim"
                           value="<%= request.getParameter("fim") %>">
                    <button class="btn btn-primary">
                        Baixar PDF
                    </button>
                </form>
            </div>

        </div>
    </div>

</div>

</body>
</html>
