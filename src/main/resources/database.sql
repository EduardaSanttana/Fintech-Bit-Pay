-- ============================================================
--  BANCO DE DADOS DO PROJETO FINTECH BITPAY
--  Script oficial de criação do banco e das tabelas
-- ============================================================

-- Criar o banco
CREATE DATABASE IF NOT EXISTS BITPAY;
USE BITPAY;

-- ============================================================
--  TABELA: CLIENTES
-- ============================================================
CREATE TABLE IF NOT EXISTS CLIENTES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    SENHA VARCHAR(100) NOT NULL,
    CPF VARCHAR(20) NOT NULL UNIQUE,
    ENDERECO VARCHAR(255),
    TELEFONE VARCHAR(20)
);

-- ============================================================
--  TABELA: COLABORADORES (ex: gerente)
-- ============================================================
CREATE TABLE IF NOT EXISTS COLABORADORES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    SENHA VARCHAR(100) NOT NULL,
    CPF VARCHAR(20) NOT NULL UNIQUE,
    ENDERECO VARCHAR(255),
    TELEFONE VARCHAR(20),
    FUNCAO VARCHAR(50)
);

-- ============================================================
--  TABELA: CONTAS
-- ============================================================
CREATE TABLE IF NOT EXISTS CONTAS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	CLIENTE_ID INT NOT NULL,
	NUMERO_CONTA VARCHAR(20) UNIQUE NOT NULL,
    SALDO DECIMAL(10,2) DEFAULT 0,
    TIPO VARCHAR(20) DEFAULT 'CORRENTE',

    FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTES(ID)
);

-- ============================================================
--  TABELA: TRANSFERÊNCIAS
-- ============================================================
CREATE TABLE IF NOT EXISTS TRANSFERENCIAS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	CONTA_ORIGEM INT NOT NULL,
    CONTA_DESTINO INT NOT NULL,
	VALOR DECIMAL (10,2) NOT NULL,
    DATA_HORA DATETIME,

    FOREIGN KEY (CONTA_ORIGEM) REFERENCES CONTAS(ID),
    FOREIGN KEY (CONTA_DESTINO) REFERENCES CONTAS(ID)
);

-- ============================================================
--  TABELA: INVESTIMENTOS
-- ============================================================
CREATE TABLE IF NOT EXISTS INVESTIMENTOS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CONTA_ID INT NOT NULL,
	VALOR DECIMAL(10,2) NOT NULL,
    DATA_APLICACAO DATETIME NOT NULL,

    FOREIGN KEY (CONTA_ID) REFERENCES CONTAS(ID)
);

-- ============================================================
--  TABELA: EMPRÉSTIMOS
-- ============================================================
CREATE TABLE IF NOT EXISTS EMPRESTIMOS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    CONTA_ID INT NOT NULL,
	VALOR_TOTAL DECIMAL(10,2) NOT NULL,
	JUROS_ANUAL DECIMAL(5,2) NOT NULL,
    MESES INT NOT NULL,
    DATA_SOLICITACAO DATETIME,

    FOREIGN KEY (CONTA_ID) REFERENCES CONTAS(ID)
);
