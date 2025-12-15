<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Bit Pay</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/paginas/imgs/favicon-32x32.png">

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

<style>
  html {
    scroll-behavior: smooth;
  }
</style>
</head>

<body class="bg-base-200">

<div class="navbar bg-base-100 shadow fixed top-0 z-50">
  <div class="flex-1">
    <a class="btn btn-ghost normal-case text-2xl text-primary font-bold" href="#top">
      Bit Pay
    </a>
  </div>
  <div class="flex-none gap-2">
    <a class="btn btn-ghost" href="#top">Home</a>
    <a class="btn btn-ghost" href="#servicos">Serviços</a>
    <a class="btn btn-ghost" href="#contato">Contato</a>
    <a class="btn btn-primary" href="Login.jsp">Login</a>
  </div>
</div>

<div id="top" class="pt-24"></div>

<div class="hero min-h-screen bg-base-200">
  <div class="hero-content flex-col lg:flex-row-reverse">
    <img
      src="https://cdn-icons-png.flaticon.com/512/825/825536.png"
      class="max-w-sm"
      alt="Bit Pay">

    <div>
      <h1 class="text-5xl font-bold text-base-content">
        O Banco Digital do Futuro
      </h1>

      <p class="py-6 text-lg text-base-content/70">
        Pagamentos rápidos, investimentos inteligentes e controle financeiro
        em um só lugar. Seguro, moderno e 100% digital.
      </p>

      <a href="CadastrarConta.jsp">
        <button class="btn btn-primary">
          Abrir Conta
        </button>
      </a>
    </div>
  </div>
</div>

<div id="servicos" class="py-24 bg-base-100">
  <div class="container mx-auto px-6">

    <h2 class="text-5xl font-bold text-base-content mb-12">
      Serviços
    </h2>

    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">

      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold text-base-content">
            Conta Digital
          </h3>
          <p class="text-base-content/70">
            Gerencie sua conta com total controle e praticidade.
          </p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold text-base-content">
            Pagamentos
          </h3>
          <p class="text-base-content/70">
            Pague contas, boletos e faça PIX em segundos.
          </p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold text-base-content">
            Transferências
          </h3>
          <p class="text-base-content/70">
            Envie e receba dinheiro de forma simples e segura.
          </p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold text-base-content">
            Cartão Digital
          </h3>
          <p class="text-base-content/70">
            Cartão virtual para compras online com proteção total.
          </p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold text-base-content">
            Investimentos
          </h3>
          <p class="text-base-content/70">
            Faça seu dinheiro render com inteligência.
          </p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold text-base-content">
            Suporte 24h
          </h3>
          <p class="text-base-content/70">
            Atendimento digital sempre disponível.
          </p>
        </div>
      </div>

    </div>
  </div>
</div>

<div id="contato" class="py-24 bg-base-200">
  <div class="container mx-auto px-6 max-w-lg">

    <h2 class="text-4xl font-bold text-base-content text-center mb-8">
      Contato
    </h2>

    <form class="card bg-base-100 shadow-md p-6 gap-4">
      <input
        type="text"
        placeholder="Nome"
        class="input input-bordered w-full" />

      <input
        type="email"
        placeholder="Email"
        class="input input-bordered w-full" />

      <textarea
        class="textarea textarea-bordered w-full"
        placeholder="Mensagem"></textarea>

      <button class="btn btn-primary">
        Enviar
      </button>
    </form>

  </div>
</div>

<footer class="footer p-10 bg-base-100 text-base-content">
  <aside>
    <h2 class="font-bold text-xl text-primary">
      Bit Pay
    </h2>
    <p>Seu banco digital seguro e moderno.</p>
  </aside>

  <nav>
    <h6 class="footer-title">Links</h6>
    <a class="link link-hover" href="#servicos">Serviços</a>
    <a class="link link-hover" href="#contato">Contato</a>
    <a class="link link-hover">Termos</a>
  </nav>
</footer>

</body>
</html>
