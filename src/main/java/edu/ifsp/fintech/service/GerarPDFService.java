package edu.ifsp.fintech.service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import edu.ifsp.fintech.modelo.Extrato;

import java.io.ByteArrayOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

public class GerarPDFService {

    public static byte[] gerarPDF(List<Extrato> lista, String inicio, String fim) {

        try {
            ByteArrayOutputStream saida = new ByteArrayOutputStream();

            Document documento = new Document(PageSize.A4);
            PdfWriter.getInstance(documento, saida);

            documento.open();

            // =============================
            //     TÍTULO
            // =============================
            Font titulo = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph pTitulo = new Paragraph("Extrato Bancário - Fintech Bit Pay", titulo);
            pTitulo.setAlignment(Element.ALIGN_CENTER);
            documento.add(pTitulo);
            documento.add(new Paragraph(" ")); // Espaço


            // =============================
            //     PERÍODO SELECIONADO
            // =============================
            Font normal = new Font(Font.FontFamily.HELVETICA, 12);

            documento.add(new Paragraph(
                    "Período: " + inicio + " até " + fim,
                    normal
            ));
            documento.add(new Paragraph(" "));


            // =============================
            //     SE NÃO EXISTE MOVIMENTAÇÃO
            // =============================
            if (lista == null || lista.isEmpty()) {
                Font semMov = new Font(Font.FontFamily.HELVETICA, 14, Font.ITALIC);
                Paragraph aviso = new Paragraph("Nenhuma movimentação encontrada para o período selecionado.", semMov);
                aviso.setAlignment(Element.ALIGN_CENTER);
                documento.add(aviso);
                documento.close();
                return saida.toByteArray();
            }


            // =============================
            //     TABELA DO EXTRATO
            // =============================
            PdfPTable tabela = new PdfPTable(4);
            tabela.setWidthPercentage(100);
            tabela.setWidths(new float[]{2f, 2f, 2f, 4f});

            // Cabeçalho
            Font cabecalho = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            tabela.addCell(new PdfPCell(new Phrase("Data", cabecalho)));
            tabela.addCell(new PdfPCell(new Phrase("Tipo", cabecalho)));
            tabela.addCell(new PdfPCell(new Phrase("Valor (R$)", cabecalho)));
            tabela.addCell(new PdfPCell(new Phrase("Descrição", cabecalho)));

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            DecimalFormat df = new DecimalFormat("0.00");

            for (Extrato e : lista) {

                tabela.addCell(sdf.format(e.getDataHora()));
                tabela.addCell(e.getTipo() != null ? e.getTipo() : "-");
                tabela.addCell(df.format(e.getValor()));
                tabela.addCell(e.getDescricao() != null ? e.getDescricao() : "-");
            }

            documento.add(tabela);
            documento.close();

            return saida.toByteArray();

        } catch (Exception e) {
            throw new RuntimeException("Erro ao gerar PDF: " + e.getMessage(), e);
        }
    }
}
