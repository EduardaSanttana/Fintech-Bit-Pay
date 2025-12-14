<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay - Empréstimos</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen m-0 p-0">

<div class="max-w-6xl mx-auto pt-12">

    <div class="card bg-base-100 shadow-xl">
        <div class="card-body">

            <h2 class="card-title text-2xl text-primary">Empréstimos</h2>

            <%
                String erro = (String) request.getAttribute("erro");
                if (erro != null) {
            %>
                <div class="alert alert-error mt-4">
                    <span><%= erro %></span>
                </div>
            <%
                }
            %>

            <div role="tablist" class="tabs tabs-lifted mt-6">

                <input type="radio" name="emprestimoTabs" role="tab"
                       class="tab" aria-label="Simulação" checked />

                <div role="tabpanel"
                     class="tab-content bg-base-100 p-6 rounded-box">

                    <form action="<%= request.getContextPath() %>/simular-emprestimo"
                          method="post" class="space-y-4 max-w-xl">

                        <div>
                            <label class="label">
                                <span class="label-text">Valor</span>
                            </label>
                            <input type="number" step="0.01" name="valor"
                                   class="input input-bordered w-full" required>
                        </div>

                        <div>
                            <label class="label">
                                <span class="label-text">Parcelas</span>
                            </label>
                            <input type="number" name="parcelas"
                                   class="input input-bordered w-full" required>
                        </div>

                        <div class="pt-4">
                            <button type="submit"
                                    class="btn btn-primary w-full">
                                Simular Empréstimo
                            </button>
                        </div>

                    </form>

                </div>

                <input type="radio" name="emprestimoTabs" role="tab"
                       class="tab" aria-label="Meus Empréstimos" />

                <div role="tabpanel"
                     class="tab-content bg-base-100 p-6 rounded-box">

                    <div class="alert alert-info">
                        <span>
                            Você ainda não possui empréstimos contratados.
                        </span>
                    </div>

                </div>

            </div>

        </div>
    </div>

</div>

</body>
</html>
