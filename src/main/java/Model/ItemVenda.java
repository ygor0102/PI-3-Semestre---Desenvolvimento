
package Model;

 /**
 * @author Grupo 2 - Projeto Integrador
 * @since 15/04/2021
 */  
public class ItemVenda {
    private int idItem;
    private int FkIdVenda;
    private int FkIdProduto;
    private int QtdVendida;

    public ItemVenda(int FkIdVenda, int FkIdProduto, int QtdVendida) {
        this.FkIdVenda = FkIdVenda;
        this.FkIdProduto = FkIdProduto;
        this.QtdVendida = QtdVendida;
    }

    public int getQtdVendida() {
        return QtdVendida;
    }

    public void setQtdVendida(int QtdVendida) {
        this.QtdVendida = QtdVendida;
    }

   
    
    
    
    
    /**
     * Método acessor da chave estrangeira do produto.
     * @return int FkIdProduto
     */
    public int getFkIdProduto() {
        return FkIdProduto;
    }
    
    /**
     * Método modificador da chave estrangeira do produto.
     * @param FkIdProduto variável do tipo int
     */
    public void setFkIdProduto(int FkIdProduto) {
        this.FkIdProduto = FkIdProduto;
    }
     
    /**
     * Método acessor do id do item.
     * @return int idItem
     */
    public int getIdItem() {
        return idItem;
    }
    /**
     * Método modificador do id do item.
     * @param idItem variável do tipo int
     */
    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }
    
    /**
     * Método acessor da chave estrangeira do id da venda.
     * @return int FkIdVenda
     */
    public int getFkIdVenda() {
        return FkIdVenda;
    }
    
    /**
     * Método modificador da chave estrangeira do id da venda
     * @param FkIdVenda variável do tipo int
     */
    public void setFkIdVenda(int FkIdVenda) {
        this.FkIdVenda = FkIdVenda;
    }
  
    
}
