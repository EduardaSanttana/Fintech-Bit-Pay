<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bit Pay - Internet Banking</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    
<nav class="navbar navbar-expand-lg navbar-dark bg-blue fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-orange" href="#">Bit Pay</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/paginas/CriarConta.jsp">Criar Conta</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/paginas/Login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/paginas/Contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="hero d-flex align-items-center text-center text-white">
    <div class="container">
        <h1 class="fw-bold">Bem-vindo à Bit Pay</h1>
        <p class="lead">Seu banco digital simples, seguro e rápido.</p>
        <a href="<%= request.getContextPath() %>/paginas/CriarConta.jsp" class="btn btn-orange btn-lg mt-3">Abrir Conta</a>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-4 fw-bold text-blue">Funcionalidades</h2>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card feature-card text-center p-3">
                    <h5  class="text-orange">Depósitos</h5>
                    <p>Realize depósitos rapidamente e acompanhe tudo pelo extrato.</p>
                </div>
            </div>

            <div  class="col-md-4">
                <div class="card feature-card text-center p-3">
                    <h5 class="text-orange">Transferências</h5>
                    <p>Transfira para qualquer banco com segurança total.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card feature-card text-center p-3">
                    <h5 class="text-orange">Investimentos</h5>
                    <p>Simule e aplique seu dinheiro com rentabilidade garantida.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="py-3 bg-blue text-center text-white">
    <p class="mb-0">© 2025 Bit Pay - Todos os direitos reservados</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
