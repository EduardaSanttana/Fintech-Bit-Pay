package edu.ifsp.fintech.modelo;

import java.time.LocalDateTime;

public class Extrato {
    private int id;
    private int contaId;
    private String tipo;
    private double valor;
    private LocalDateTime dataHora;
    private String descricao;

    public Extrato(int id, int contaId, String tipo, double valor, LocalDateTime dataHora, String descricao) {
        this.id = id;
        this.contaId = contaId;
        this.tipo = tipo;
        this.valor = valor;
        this.dataHora = dataHora;
        this.descricao = descricao;
    }

    public Extrato(int contaId, String tipo, double valor, String descricao) {
        this.contaId = contaId;
        this.tipo = tipo;
        this.valor = valor;
        this.descricao = descricao;
    }

    public int getId() { return id; }
    public int getContaId() { return contaId; }
    public String getTipo() { return tipo; }
    public double getValor() { return valor; }
    public LocalDateTime getDataHora() { return dataHora; }
    public String getDescricao() { return descricao; }
}
