package edu.ifsp.fintech.modelo;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Parcela {

	private int id;
	private int emprestimoId;
	private int numero;
	private BigDecimal valor;
	private LocalDate dataVencimento;
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmprestimoId() {
		return emprestimoId;
	}

	public void setEmprestimoId(int emprestimoId) {
		this.emprestimoId = emprestimoId;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public LocalDate getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(LocalDate dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
