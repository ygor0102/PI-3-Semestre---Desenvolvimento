package Model;

import java.util.Date;
     
/**
 * @author Grupo 2 - Projeto Integrador
 * @since 01/11/2020
 */ 

public class Venda {
    
     private int idVenda;
     private Date dataVenda;
     private double precoTotal;
     private int fkIdCliente;
     private String nomeCliente;

    public Venda(Date dataVenda, double precoTotal, int fkIdCliente) {
        this.dataVenda = dataVenda;
        this.precoTotal = precoTotal;
        this.fkIdCliente = fkIdCliente;
    }
    
    public Venda(int idVenda, Date dataVenda, double precoTotal, int fkIdCliente, String nomeCliente) {
        this.idVenda = idVenda;
        this.dataVenda = dataVenda;
        this.precoTotal = precoTotal;
        this.fkIdCliente = fkIdCliente;
        this.nomeCliente = nomeCliente;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }
 


    /**
     * Método acessor da chave estrangeira do cliente.
     * @return int fkIdCliente
     */
    public int getFkIdCliente() {
        return fkIdCliente;
    }
    
    /**
     * Método modificador do campo chave estrangeira do cliente.
     * @param fkIdCliente variável do tipo int
     */
    public void setFkIdCliente(int fkIdCliente) {
        this.fkIdCliente = fkIdCliente;
    }
 
    /**
     * Método acessor do id da venda.
     * @return int fkIdCliente
     */
    public int getIdVenda() {
        return idVenda;
    }
    
    /**
     * Método modificador do campo id da venda.
     * @param idVenda variável do tipo int
     */
    public void setIdVenda(int idVenda) {
        this.idVenda = idVenda;
    }
    
     /**
     * Método acessor da data de venda.
     * @return Date dataVenda
     */
    public Date getDataVenda() {
        return dataVenda;
    }
    
    /**
     * Método modificador do campo data de venda.
     * @param dataVenda variável do tipo Date
     */
    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }
    
     /**
     * Método acessor do preço da venda.
     * @return double precoTotal
     */
    public double getPrecoTotal() {
        return precoTotal;
    }
    
    /**
     * Método modificador do campo preço de venda.
     * @param precoTotal variável do tipo double
     */
    public void setPrecoTotal(double precoTotal) {
        this.precoTotal = precoTotal;
    }
 

}

