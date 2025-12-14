package edu.ifsp.fintech.modelo;

public class Emprestimo {

    private int parcela;
    private double saldoDevedor;
    private double juros;
    private double amortizacao;
    private double valorParcela;

    public Emprestimo(int parcela, double saldoDevedor, double juros,
                      double amortizacao, double valorParcela) {
        this.parcela = parcela;
        this.saldoDevedor = saldoDevedor;
        this.juros = juros;
        this.amortizacao = amortizacao;
        this.valorParcela = valorParcela;
    }

    public int getParcela() {
        return parcela;
    }

    public double getSaldoDevedor() {
        return saldoDevedor;
    }

    public double getJuros() {
        return juros;
    }

    public double getAmortizacao() {
        return amortizacao;
    }

    public double getValorParcela() {
        return valorParcela;
    }
}
