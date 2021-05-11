
package Model;

public class ItemVenda {
    private int idItem;
    private int FkIdVenda;
    private int FkIdProduto;
    private int QtdVendida;
    private String nomeProduto;
    private double precoProduto;
    private double valorFaturado;

    public ItemVenda(int FkIdVenda, int FkIdProduto, int QtdVendida) {
        this.FkIdVenda = FkIdVenda;
        this.FkIdProduto = FkIdProduto;
        this.QtdVendida = QtdVendida;
    }
    
     public ItemVenda(int FkIdVenda, int FkIdProduto, int QtdVendida, String nomeProduto, double precoProduto, double valorFaturado) {
        this.FkIdVenda = FkIdVenda;
        this.FkIdProduto = FkIdProduto;
        this.QtdVendida = QtdVendida;
        this.nomeProduto = nomeProduto;
        this.precoProduto = precoProduto;
        this.valorFaturado = valorFaturado;
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
