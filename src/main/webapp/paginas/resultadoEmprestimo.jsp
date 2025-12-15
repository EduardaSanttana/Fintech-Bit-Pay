<%@ page import="java.util.List"%>
<%@ page import="edu.ifsp.fintech.modelo.SimulacaoEmprestimo"%>
<%@ page import="edu.ifsp.fintech.modelo.Conta"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Bit Pay</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/paginas/imgs/favicon-32x32.png">

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen m-0 p-0">

<div class="max-w-6xl mx-auto pt-12">

    <div class="card bg-base-100 shadow-xl">
        <div class="card-body">

            <h2 class="card-title text-2xl text-primary">Resultado da Simulação</h2>

            <div class="overflow-x-auto mt-6">
                <table class="table table-zebra w-full">
                    <thead>
                        <tr>
                            <th>Parcela</th>
                            <th>Saldo Devedor</th>
                            <th>Juros</th>
                            <th>Amortização</th>
                            <th>Valor da Parcela</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            List<SimulacaoEmprestimo> tabela =
                                (List<SimulacaoEmprestimo>) request.getAttribute("tabela");

                            if (tabela != null) {
                                for (SimulacaoEmprestimo e : tabela) {
                        %>
                        <tr>
                            <td><%= e.getParcela() %></td>
                            <td>R$ <%= String.format("%.2f", e.getSaldoDevedor()) %></td>
                            <td>R$ <%= String.format("%.2f", e.getJuros()) %></td>
                            <td>R$ <%= String.format("%.2f", e.getAmortizacao()) %></td>
                            <td class="font-bold text-primary">R$ <%= String.format("%.2f", e.getValorParcela()) %></td>
                        </tr>
                        <%
                                }
                            }
                        %>

                    </tbody>
                </table>
            </div>

            <div class="divider"></div>

            <div class="stats stats-vertical md:stats-horizontal shadow">

                <div class="stat">
                    <div class="stat-title">Total de Juros</div>
                    <div class="stat-value text-error">
                        R$ <%= String.format("%.2f", request.getAttribute("totalJuros")) %>
                    </div>
                </div>

                <div class="stat">
                    <div class="stat-title">Total Pago</div>
                    <div class="stat-value text-success">
                        R$ <%= String.format("%.2f", request.getAttribute("totalPago")) %>
                    </div>
                </div>

            </div>

            <div class="mt-8 flex flex-col md:flex-row gap-4">

                <a href="<%= request.getContextPath() %>/paginas/Emprestimo.jsp" class="btn btn-outline flex-1"> Nova Simulação </a>

                <form action="<%= request.getContextPath() %>/emprestimos" method="post" class="flex-1">

                    <input type="hidden" name="acao" value="contratar" />
                    <input type="hidden" name="valor" value="<%= request.getAttribute("valor") %>" />
                    <input type="hidden" name="parcelas" value="<%= request.getAttribute("parcelas") %>" />
                    <input type="hidden" name="taxaJuros" value="<%= request.getAttribute("taxaJuros") %>" />
                    <input type="hidden" name="valorTotal" value="<%= request.getAttribute("totalPago") %>" />

                    <button type="submit" class="btn btn-primary w-full">
                        Finalizar Empréstimo
                    </button>
                </form>

            </div>

        </div>
    </div>

</div>

</body>
</html>
