<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>Bit Pay</title>

<link rel="icon" type="image/png" sizes="32x32"
      href="<%= request.getContextPath() %>/paginas/imgs/favicon-32x32.png">

<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      crossorigin="anonymous" />

<style>
  html { scroll-behavior: smooth; }
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
    <a class="btn btn-primary btn-sm" href="Login.jsp">
      <i class="fas fa-user-circle mr-1"></i> Login
    </a>
  </div>
</div>

<div id="top" class="pt-24"></div>

<section class="hero min-h-screen bg-base-200">
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
        em um só lugar.
      </p>

      <a href="CadastrarConta.jsp" class="btn btn-primary">
        <i class="fas fa-user-plus mr-2"></i> Abrir Conta
      </a>
    </div>
  </div>
</section>

<section id="servicos" class="py-24 bg-base-100">
  <div class="max-w-6xl mx-auto px-6">

    <h2 class="text-5xl font-bold text-center text-base-content mb-12">
      Serviços
    </h2>

    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">

      <div class="card bg-base-200 shadow-xl hover:scale-[1.02] transition">
        <div class="card-body items-center text-center">
          <i class="fas fa-mobile-alt text-5xl text-primary mb-3"></i>
          <h3 class="text-xl font-semibold">Conta Digital</h3>
          <p class="text-base-content/70">Controle total da sua conta.</p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-xl hover:scale-[1.02] transition">
        <div class="card-body items-center text-center">
          <i class="fas fa-qrcode text-5xl text-accent mb-3"></i>
          <h3 class="text-xl font-semibold">Pagamentos</h3>
          <p class="text-base-content/70">Boletos, PIX e contas.</p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-xl hover:scale-[1.02] transition">
        <div class="card-body items-center text-center">
          <i class="fas fa-exchange-alt text-5xl text-info mb-3"></i>
          <h3 class="text-xl font-semibold">Transferências</h3>
          <p class="text-base-content/70">Envios rápidos e seguros.</p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-xl hover:scale-[1.02] transition">
        <div class="card-body items-center text-center">
          <i class="fas fa-credit-card text-5xl text-warning mb-3"></i>
          <h3 class="text-xl font-semibold">Cartão Digital</h3>
          <p class="text-base-content/70">Compras online protegidas.</p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-xl hover:scale-[1.02] transition">
        <div class="card-body items-center text-center">
          <i class="fas fa-chart-line text-5xl text-secondary mb-3"></i>
          <h3 class="text-xl font-semibold">Investimentos</h3>
          <p class="text-base-content/70">Faça seu dinheiro render.</p>
        </div>
      </div>

      <div class="card bg-base-200 shadow-xl hover:scale-[1.02] transition">
        <div class="card-body items-center text-center">
          <i class="fas fa-headset text-5xl text-error mb-3"></i>
          <h3 class="text-xl font-semibold">Suporte 24h</h3>
          <p class="text-base-content/70">Atendimento sempre disponível.</p>
        </div>
      </div>

    </div>
  </div>
</section>

<section id="contato" class="py-24 bg-base-200">
  <div class="container mx-auto px-6 max-w-xl">

    <h2 class="text-4xl font-bold text-base-content text-center mb-4">
      Contato
    </h2>

    <p class="text-lg text-base-content/70 text-center mb-10">
      Entre em contato com nossa equipe para tirar suas dúvidas ou começar hoje mesmo!
    </p>

    <div class="card bg-base-100 shadow-xl p-8 border-t-4 border-primary">
      <form class="flex flex-col gap-4">

        <label class="form-control">
          <span class="label-text font-medium">Seu Nome Completo</span>
          <input type="text" class="input input-bordered" required>
        </label>

        <label class="form-control">
          <span class="label-text font-medium">Seu Melhor Email</span>
          <input type="email" class="input input-bordered" required>
        </label>

        <label class="form-control">
          <span class="label-text font-medium">Mensagem ou Dúvida</span>
          <textarea class="textarea textarea-bordered h-32" required></textarea>
        </label>

        <button class="btn btn-primary btn-lg mt-4">
          <i class="fas fa-paper-plane mr-2"></i> Enviar Mensagem
        </button>

      </form>
    </div>

  </div>
</section>

<footer class="footer p-10 bg-base-100 text-base-content">
  <aside>
    <h2 class="font-bold text-xl text-primary">Bit Pay</h2>
    <p>Seu banco digital seguro e moderno.</p>
  </aside>
</footer>

</body>
</html>
