<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Criar Conta - Bit Pay</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/criarConta.css">
</head>

<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center py-5">
    <div class="card shadow p-4 auth-card w-50">
        <h3 class="text-center text-blue fw-bold mb-3">Bit Pay</h3>
        <h5 class="text-center text-orange mb-4">Criar nova conta</h5>

        <form>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Nome completo</label>
                    <input type="text" class="form-control" placeholder="Seu nome">
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">CPF</label>
                    <input type="text" class="form-control" placeholder="000.000.000-00">
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">E-mail</label>
                <input type="email" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Telefone</label>
                <input type="text" class="form-control" placeholder="(11) 99999-9999">
            </div>

            <div class="mb-3">
                <label class="form-label">Senha</label>
                <input type="password" class="form-control">
            </div>

            <button class="btn btn-orange w-100 mt-2">Criar conta</button>

            <div class="text-center mt-3">
                <a href="<%= request.getContextPath() %>/paginas/Login.jsp" class="text-blue">Já tenho conta</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
