<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="
    java.util.*, 
    java.text.SimpleDateFormat,
    edu.ifsp.fintech.modelo.Conta,
    edu.ifsp.fintech.modelo.Colaborador
" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Fintech Bit Pay - Aprovar contas</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200 min-h-screen">

<%
    Colaborador u = (Colaborador) session.getAttribute("usuarioLogado");
    if (u == null) {
        response.sendRedirect("paginas/Login.jsp");
        return;
    }
%>

<div class="navbar bg-base-100 shadow">
    <div class="flex-1">
        <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">Bit Pay </a>
    </div>

    <div class="flex-none gap-4 font-medium items-center">

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
                <li><a href="AlterarDadosUsuario.jsp">Editar dados</a></li>
                <li><a href="<%=request.getContextPath()%>/logout" class="text-error">Sair</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="max-w-4xl mx-auto mt-12 p-6">
  <h2 class="text-3xl font-bold text-primary mb-6">Contas pendentes de aprovação</h2>

  <div class="card bg-base-100 shadow-xl">
    <div class="card-body p-6">

      <div class="overflow-x-auto">
        <table class="table table-zebra w-full">
          <thead>
            <tr>
              <th>Nome</th>
              <th>CPF</th>
              <th>Conta</th>
              <th>Ação</th>
            </tr>
          </thead>

          <tbody>
          <%
	      	List<Map<String, Object>> lista = (List<Map<String, Object>>) request.getAttribute("contasPendentes");

          	if (lista != null && !lista.isEmpty()) {
              for (Map<String, Object> c : lista) {
          %>
                <tr>
				    <td><%= c.get("nome") %></td>
				    <td><%= c.get("cpf") %></td>
				    <td><%= c.get("numeroConta") %></td>
				    <td class="flex gap-2">
				
				        <form action="${pageContext.request.contextPath}/alterar-situacao-conta" method="post">
					        <input type="hidden" name="idConta" value="<%= c.get("id") %>">
					        <input type="hidden" name="acao" value="aprovar">
					        <button class="btn btn-success btn-sm">Aprovar</button>
				        </form>
				    
				        <form action="${pageContext.request.contextPath}/alterar-situacao-conta" method="post">
					        <input type="hidden" name="idConta" value="<%= c.get("id") %>">
					        <input type="hidden" name="acao" value="reprovar">
					        <button class="btn btn-error btn-sm">Reprovar</button>
				        </form>
				
				    </td>
				</tr>
          <%
              }
          	} else {
          %>
             <tr>
               <td colspan="4" class="text-error text-center">Nenhuma conta pendente encontrada.</td>
             </tr>
          <%
          	}
          %>
          </tbody>

        </table>
      </div>

      <div class="flex justify-between mt-6">
        <a href="${pageContext.request.contextPath}/paginas/IndexColaborador.jsp" class="btn btn-outline btn-primary">Voltar</a>
      </div>

    </div>
  </div>
</div>

</body>
</html>