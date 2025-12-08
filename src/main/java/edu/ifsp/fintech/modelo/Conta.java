package edu.ifsp.fintech.modelo;

public class Conta {
	private int id;
	private int clienteId;
	private String numeroConta;
	private double saldo;
	private String tipo;
	private String status;

	public Conta(int id, int clienteId, String numeroConta, double saldo, String tipo) {
		this.id = id;
		this.clienteId = clienteId;
		this.numeroConta = numeroConta;
		this.saldo = saldo;
		this.tipo = tipo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getClienteId() {
		return clienteId;
	}

	public void setClienteId(int clienteId) {
		this.clienteId = clienteId;
	}

	public String getNumeroConta() {
		return numeroConta;
	}

	public void setNumeroConta(String numeroConta) {
		this.numeroConta = numeroConta;
	}

	public double getSaldo() {
		return saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
