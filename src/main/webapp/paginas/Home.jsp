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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
  html {
    scroll-behavior: smooth;
  }
</style>
</head>

<body class="bg-base-200">

<!-- NAVBAR -->
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

<!-- HERO -->
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
           <i class="fas fa-user-plus mr-2"></i> Abrir Conta
        </button>
      </a>
    </div>
  </div>
</div>

<<<<<<< HEAD
<!-- SERVIÇOS -->
<div id="servicos" class="py-24 bg-base-100">
  <div class="max-w-6xl mx-auto px-6">

    <h2 class="text-5xl font-bold mb-12 text-base-content">
=======
<section id="servicos" class="py-24 bg-base-100">
  <div class="container mx-auto px-6">

    <h2 class="text-5xl font-bold text-center text-base-content mb-12">
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
      Serviços
    </h2>

    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">

<<<<<<< HEAD
      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold">Conta Digital</h3>
=======
      <div class="card bg-base-200 shadow-xl transition transform hover:scale-[1.02] duration-300">
        <div class="card-body items-center text-center">
          <i class="fas fa-mobile-alt text-5xl text-primary mb-3"></i>
          <h3 class="text-xl font-semibold text-base-content">
            Conta Digital
          </h3>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
          <p class="text-base-content/70">
            Gerencie sua conta com total controle e praticidade.
          </p>
        </div>
      </div>

<<<<<<< HEAD
      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold">Pagamentos</h3>
=======
      <div class="card bg-base-200 shadow-xl transition transform hover:scale-[1.02] duration-300">
        <div class="card-body items-center text-center">
          <i class="fas fa-qrcode text-5xl text-accent mb-3"></i>
          <h3 class="text-xl font-semibold text-base-content">
            Pagamentos
          </h3>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
          <p class="text-base-content/70">
            Pague contas, boletos e faça PIX em segundos.
          </p>
        </div>
      </div>

<<<<<<< HEAD
      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold">Transferências</h3>
=======
      <div class="card bg-base-200 shadow-xl transition transform hover:scale-[1.02] duration-300">
        <div class="card-body items-center text-center">
          <i class="fas fa-exchange-alt text-5xl text-info mb-3"></i>
          <h3 class="text-xl font-semibold text-base-content">
            Transferências
          </h3>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
          <p class="text-base-content/70">
            Envie e receba dinheiro de forma simples e segura.
          </p>
        </div>
      </div>

<<<<<<< HEAD
      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold">Cartão Digital</h3>
=======
      <div class="card bg-base-200 shadow-xl transition transform hover:scale-[1.02] duration-300">
        <div class="card-body items-center text-center">
          <i class="fas fa-credit-card text-5xl text-warning mb-3"></i>
          <h3 class="text-xl font-semibold text-base-content">
            Cartão Digital
          </h3>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
          <p class="text-base-content/70">
            Cartão virtual para compras online com proteção total.
          </p>
        </div>
      </div>

<<<<<<< HEAD
      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold">Investimentos</h3>
=======
      <div class="card bg-base-200 shadow-xl transition transform hover:scale-[1.02] duration-300">
        <div class="card-body items-center text-center">
          <i class="fas fa-chart-line text-5xl text-secondary mb-3"></i>
          <h3 class="text-xl font-semibold text-base-content">
            Investimentos
          </h3>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
          <p class="text-base-content/70">
            Faça seu dinheiro render com inteligência.
          </p>
        </div>
      </div>

<<<<<<< HEAD
      <div class="card bg-base-200 shadow-md">
        <div class="card-body">
          <h3 class="text-xl font-semibold">Suporte 24h</h3>
=======
      <div class="card bg-base-200 shadow-xl transition transform hover:scale-[1.02] duration-300">
        <div class="card-body items-center text-center">
          <i class="fas fa-headset text-5xl text-error mb-3"></i>
          <h3 class="text-xl font-semibold text-base-content">
            Suporte 24h
          </h3>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
          <p class="text-base-content/70">
            Atendimento digital sempre disponível.
          </p>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- CONTATO -->
<div id="contato" class="py-24 bg-base-200">
<<<<<<< HEAD
  <div class="max-w-5xl mx-auto px-6">

    <div class="text-center mb-16">
      <h2 class="text-5xl font-extrabold mb-4">
        FALE CONOSCO
      </h2>
      <p class="text-xl text-base-content/70 max-w-2xl mx-auto">
        Seja para suporte, dúvidas ou sugestões, estamos prontos para te atender.
      </p>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 mb-20">

      <div class="card bg-base-100 shadow-lg hover:shadow-xl transition p-6 text-center">
        <div class="mx-auto w-12 h-12 rounded-full bg-primary/20 text-primary flex items-center justify-center mb-4">
          ✉️
        </div>
        <h3 class="font-bold text-lg mb-1">Email</h3>
        <a href="mailto:suporte.bitpay@gmail.com" class="link link-hover text-sm">
          suporte.bitpay@gmail.com
        </a>
      </div>

      <div class="card bg-base-100 shadow-lg hover:shadow-xl transition p-6 text-center">
        <div class="mx-auto w-12 h-12 rounded-full bg-primary/20 text-primary flex items-center justify-center mb-4">
          📞
        </div>
        <h3 class="font-bold text-lg mb-1">Telefone / WhatsApp</h3>
        <p class="text-sm">(16) 3000-0000</p>
        <p class="text-sm">(16) 9 9999-9999</p>
      </div>

      <div class="card bg-base-100 shadow-lg hover:shadow-xl transition p-6 text-center">
        <div class="mx-auto w-12 h-12 rounded-full bg-primary/20 text-primary flex items-center justify-center mb-4">
          ⏰
        </div>
        <h3 class="font-bold text-lg mb-1">Atendimento</h3>
        <p class="text-sm">Segunda à Sexta: 08h às 18h</p>
        <p class="text-sm">Sábado: 08h às 12h</p>
      </div>

    </div>

<div class="card bg-base-100 shadow-2xl p-10">
  <h3 class="text-3xl font-bold text-primary text-center mb-4">
    Atendimento Digital Seguro
  </h3>

  <p class="text-base-content/70 text-center max-w-3xl mx-auto mb-10">
    Envie sua dúvida, sugestão ou solicitação. Nosso time analisará
    sua mensagem com total segurança e confidencialidade.
  </p>

  <form class="space-y-6 max-w-3xl mx-auto">

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div class="form-control">
        <label class="label">
          <span class="label-text">Nome</span>
        </label>
        <input
          type="text"
          placeholder="Seu nome completo"
          class="input input-bordered w-full"
          required>
      </div>

      <div class="form-control">
        <label class="label">
          <span class="label-text">E-mail</span>
        </label>
        <input
          type="email"
          placeholder="email@exemplo.com"
          class="input input-bordered w-full"
          required>
      </div>
    </div>

    <div class="form-control">
      <label class="label">
        <span class="label-text">Assunto</span>
      </label>
      <select class="select select-bordered w-full">
        <option disabled selected>Selecione o motivo do contato</option>
        <option>Dúvida geral</option>
        <option>Suporte técnico</option>
        <option>Problemas com conta</option>
        <option>Sugestão ou feedback</option>
      </select>
    </div>

    <div class="form-control">
      <label class="label">
        <span class="label-text">Mensagem</span>
      </label>
      <textarea
        class="textarea textarea-bordered h-32"
        placeholder="Descreva sua solicitação com detalhes..."
        required></textarea>
    </div>

    <div class="text-center pt-4">
      <button class="btn btn-primary btn-wide">
        Enviar Mensagem
      </button>
    </div>

  </form>
</div>
=======
  <div class="container mx-auto px-6 max-w-xl">

    <h2 class="text-4xl font-bold text-base-content text-center mb-4">
      Contato
    </h2>
    <p class="text-lg text-base-content/70 text-center mb-10">
        Entre em contato com nossa equipe para tirar suas dúvidas ou começar hoje mesmo!
    </p>

    <div class="card bg-base-100 shadow-xl p-8 border-t-4 border-primary">
      <form class="flex flex-col gap-4">
        
        <label class="form-control w-full">
            <div class="label">
                <span class="label-text font-medium text-base-content">Seu Nome Completo:</span>
            </div>
            <input
                type="text"
                placeholder="Ex: Maria da Silva"
                class="input input-bordered w-full"
                required />
        </label>

        <label class="form-control w-full">
            <div class="label">
                <span class="label-text font-medium text-base-content">Seu Melhor Email:</span>
            </div>
            <input
                type="email"
                placeholder="email@gmail.com"
                class="input input-bordered w-full"
                required />
        </label>

        <label class="form-control w-full">
            <div class="label">
                <span class="label-text font-medium text-base-content">Mensagem ou Dúvida:</span>
            </div>
            <textarea
                class="textarea textarea-bordered w-full h-32"
                placeholder="Gostaria de saber mais sobre investimentos..."
                required></textarea>
        </label>

        <button type="submit" class="btn btn-primary btn-lg mt-4 transition transform hover:scale-[1.01]">
          <i class="fas fa-paper-plane mr-2"></i> Enviar Mensagem
        </button>
      </form>
    </div>

  </div>
</div>

<footer class="footer p-10 bg-base-100 text-base-content">
  <aside>
    <h2 class="font-bold text-xl text-primary">
      Bit Pay
    </h2>
    <p>Seu banco digital seguro e moderno.</p>
  </aside>

</footer>

</body>
</html>
>>>>>>> 9d5d8cd (style: Melhorias no layout geral.)
