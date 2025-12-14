package edu.ifsp.fintech.persistencia;

import java.util.ArrayList;
import java.util.List;

import edu.ifsp.fintech.modelo.Emprestimo;

public class EmprestimoDAO {

    private double round2(double valor) {
        return Math.round(valor * 100.0) / 100.0;
    }

    public List<Emprestimo> simularSAC(double valor, double taxa, int parcelas) {

        List<Emprestimo> lista = new ArrayList<>();

        double amortizacao = round2(valor / parcelas);
        double saldo = round2(valor);

        for (int i = 1; i <= parcelas; i++) {

            double juros = round2(saldo * taxa);
            double valorParcela = round2(amortizacao + juros);

            lista.add(new Emprestimo(
                    i,
                    saldo,
                    juros,
                    amortizacao,
                    valorParcela
            ));

            saldo = round2(saldo - amortizacao);
        }

        return lista;
    }

    public List<Emprestimo> listarPorUsuario(int usuarioId) {
        return new ArrayList<>();
    }
}
