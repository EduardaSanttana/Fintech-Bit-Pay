<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Fintech Bit Pay</title>

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-base-200">

<div class="navbar bg-base-100 shadow">
  <div class="flex-1">
    <a class="btn btn-ghost normal-case text-2xl text-primary font-bold">Bit Pay</a>
  </div>
  <div class="flex-none gap-2">
    <a class="btn btn-ghost">Home</a>
    <a class="btn btn-ghost">Serviços</a>
    <a class="btn btn-ghost">Sobre</a>
    <a class="btn btn-primary" href="Login.jsp">Login</a>
  </div>
</div>

<div class="hero min-h-screen bg-base-200">
  <div class="hero-content flex-col lg:flex-row-reverse">
    <img src="https://cdn-icons-png.flaticon.com/512/825/825536.png" class="max-w-sm" alt="Bit Pay">
    <div>
      <h1 class="text-5xl font-bold">O Banco Digital do Futuro</h1>
      <p class="py-6 text-lg">
        Pagamentos rápidos, investimentos inteligentes e controle financeiro
        em um só lugar. Seguro, moderno e 100% digital.
      </p>
      <a href="CadastrarConta.jsp"><button class="btn btn-primary">Abrir Conta</button></a>
    </div>
  </div>
</div>

<div class="text-center py-20 bg-primary text-white">
  <h2 class="text-4xl font-bold mb-4">Comece agora</h2>
  <p class="text-lg mb-8">Crie sua conta em 5 minutos.</p>
  <a href="CadastrarConta.jsp"><button class="btn btn-secondary" href="CadastrarConta.jsp">Criar Conta</button></a>
</div>

<footer class="footer p-10 bg-base-100 text-base-content">
  <aside>
    <h2 class="font-bold text-xl">Bit Pay</h2>
    <p>Seu banco digital seguro e moderno.</p>
  </aside>
  <nav>
    <h6 class="footer-title">Links</h6>
    <a class="link link-hover">Sobre</a>
    <a class="link link-hover">Produtos</a>
    <a class="link link-hover">Termos</a>
  </nav>
</footer>

</body>
</html>
