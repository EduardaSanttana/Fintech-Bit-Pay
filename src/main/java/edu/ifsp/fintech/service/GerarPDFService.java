package edu.ifsp.fintech.service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import edu.ifsp.fintech.modelo.Extrato;

import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

public class GerarPDFService {

    public static byte[] gerarPDF(List<Extrato> lista, String inicio, String fim) {

        try {
            ByteArrayOutputStream saida = new ByteArrayOutputStream();

            Document documento = new Document();
            PdfWriter.getInstance(documento, saida);

            documento.open();

            // Título
            Font titulo = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            documento.add(new Paragraph("Extrato Bancário - Fintech Bit Pay", titulo));
            documento.add(new Paragraph(" "));

            // Período
            Font normal = new Font(Font.FontFamily.HELVETICA, 12);
            documento.add(new Paragraph("Período selecionado: " + inicio + " até " + fim, normal));
            documento.add(new Paragraph(" "));

            // Tabela do extrato
            PdfPTable tabela = new PdfPTable(4);
            tabela.setWidthPercentage(100);

            tabela.addCell("Data");
            tabela.addCell("Tipo");
            tabela.addCell("Valor (R$)");
            tabela.addCell("Descrição");

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

            for (Extrato e : lista) {
                tabela.addCell(sdf.format(e.getDataHora()));
                tabela.addCell(e.getTipo());
                tabela.addCell(String.valueOf(e.getValor()));
                tabela.addCell(e.getDescricao());
            }

            documento.add(tabela);
            documento.close();

            return saida.toByteArray();

        } catch (Exception e) {
            throw new RuntimeException("Erro ao gerar PDF: " + e.getMessage(), e);
        }
    }
}
