package edu.ifsp.fintech.modelo;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Emprestimo {

	private int id;
	private int contaId;
	private BigDecimal valor;
	private int parcelas;
	private BigDecimal taxaJuros;
	private BigDecimal valorTotal;
	private String status;
	private LocalDate dataContratacao;

	public Emprestimo(int contaId, BigDecimal valor, int parcelas, BigDecimal taxaJuros, BigDecimal valorTotal) {
		this.contaId = contaId;
		this.valor = valor;
		this.parcelas = parcelas;
		this.taxaJuros = taxaJuros;
		this.valorTotal = valorTotal;
		this.status = "ATIVO";
		this.dataContratacao = LocalDate.now();
	}

	public int getId() {
		return id;
	}

	public int getContaId() {
		return contaId;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public int getParcelas() {
		return parcelas;
	}

	public BigDecimal getTaxaJuros() {
		return taxaJuros;
	}

	public BigDecimal getValorTotal() {
		return valorTotal;
	}

	public String getStatus() {
		return status;
	}

	public LocalDate getDataContratacao() {
		return dataContratacao;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDataContratacao(LocalDate dataContratacao) {
		this.dataContratacao = dataContratacao;
	}
}
