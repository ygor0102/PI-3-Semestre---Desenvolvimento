/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Model;
import java.util.Date;

public class ItemVenda {
    private int idItem;
    private int FkIdVenda;
    private int FkIdProduto;
    private int QtdVendida;
    private String nomeProduto;
    private String tipoProduto;
    private double precoProduto;
    private double valorFaturado;
    private int FkIdFilial;
    private Date dataVenda;

    public ItemVenda(int FkIdVenda, int FkIdProduto, int QtdVendida) {
        this.FkIdVenda = FkIdVenda;
        this.FkIdProduto = FkIdProduto;
        this.QtdVendida = QtdVendida;
    }
    
     public ItemVenda(Date dataVenda, int FkIdVenda, int FkIdProduto, int QtdVendida, String nomeProduto, String tipoProduto, double precoProduto, double valorFaturado, int FkIdFilial) {
        this.FkIdVenda = FkIdVenda;
        this.FkIdProduto = FkIdProduto;
        this.QtdVendida = QtdVendida;
        this.nomeProduto = nomeProduto;
        this.tipoProduto = tipoProduto;
        this.precoProduto = precoProduto;
        this.valorFaturado = valorFaturado;
        this.FkIdFilial = FkIdFilial;
        this.dataVenda = dataVenda;
    }

    public ItemVenda() {
    }

    public Date getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }
    
    

    public String getTipoProduto() {
        return tipoProduto;
    }

    public void setTipoProduto(String tipoProduto) {
        this.tipoProduto = tipoProduto;
    }
    
    
     
     

    public int getFkIdFilial() {
        return FkIdFilial;
    }

    public void setFkIdFilial(int FkIdFilial) {
        this.FkIdFilial = FkIdFilial;
    }
     
     

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public int getFkIdVenda() {
        return FkIdVenda;
    }

    public void setFkIdVenda(int FkIdVenda) {
        this.FkIdVenda = FkIdVenda;
    }

    public int getFkIdProduto() {
        return FkIdProduto;
    }

    public void setFkIdProduto(int FkIdProduto) {
        this.FkIdProduto = FkIdProduto;
    }

    public int getQtdVendida() {
        return QtdVendida;
    }

    public void setQtdVendida(int QtdVendida) {
        this.QtdVendida = QtdVendida;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public double getPrecoProduto() {
        return precoProduto;
    }

    public void setPrecoProduto(double precoProduto) {
        this.precoProduto = precoProduto;
    }

    public double getValorFaturado() {
        return valorFaturado;
    }

    public void setValorFaturado(double valorFaturado) {
        this.valorFaturado = valorFaturado;
    }
    

  
    
}
