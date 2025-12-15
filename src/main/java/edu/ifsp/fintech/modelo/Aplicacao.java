package edu.ifsp.fintech.modelo;

import java.util.Date;

public class Aplicacao {
    private int id;
    private int idConta;
    private String nomeInvestimento;
    private double valor;
    private Date dataAplicacao;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdConta() { return idConta; }
    public void setIdConta(int idConta) { this.idConta = idConta; }

    public String getNomeInvestimento() { return nomeInvestimento; }
    public void setNomeInvestimento(String nomeInvestimento) { this.nomeInvestimento = nomeInvestimento; }

    public double getValor() { return valor; }
    public void setValor(double valor) { this.valor = valor; }

    public Date getDataAplicacao() { return dataAplicacao; }
    public void setDataAplicacao(Date dataAplicacao) { this.dataAplicacao = dataAplicacao; }
}
