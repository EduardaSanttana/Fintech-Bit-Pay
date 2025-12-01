<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login - Bit Pay</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/login.css">
</head>

<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4 auth-card">
        <h3 class="text-center text-blue fw-bold mb-3">Bit Pay</h3>
        <h5 class="text-center text-orange mb-4">Acesse sua conta</h5>

        <form>
            <div class="mb-3">
                <label class="form-label">E-mail</label>
                <input type="email" class="form-control" placeholder="exemplo@email.com">
            </div>

            <div class="mb-3">
                <label class="form-label">Senha</label>
                <input type="password" class="form-control" placeholder="********">
            </div>

            <button class="btn btn-orange w-100 mt-3">Entrar</button>

            <div class="text-center mt-3">
                <a href="<%= request.getContextPath() %>/paginas/RecuperarSenha.jsp" class="text-blue">Esqueci minha senha</a>
            </div>

            <div class="text-center mt-2">
                <a href="<%= request.getContextPath() %>/paginas/CriarConta.jsp" class="text-orange fw-bold">Criar uma conta</a>
            </div>
        </form>
    </div>
</div>

<footer class="py-3 bg-blue text-center text-white">
    <p class="mb-0">© 2025 Bit Pay - Todos os direitos reservados</p>
</footer>

</body>
</html>
