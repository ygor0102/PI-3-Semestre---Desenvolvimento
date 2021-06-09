/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Model;

public class Produto {

    private int idProduto;
    private String nome;
    private String modelo;
    private String tipo;
    private double preco;
    private int qtdEstoque;
    private int FKFilial;

    public Produto(String nome, String modelo, String tipo, double preco, int qtdEstoque, int FKFilial) {
        this.nome = nome;
        this.modelo = modelo;
        this.tipo = tipo;
        this.preco = preco;
        this.qtdEstoque = qtdEstoque;
        this.FKFilial = FKFilial;
    }
    
    public Produto(int idProduto, String nome, String modelo, String tipo, double preco, int qtdEstoque, int FKFilial) {
        this.idProduto = idProduto;
        this.nome = nome;
        this.modelo = modelo;
        this.tipo = tipo;
        this.preco = preco;
        this.qtdEstoque = qtdEstoque;
        this.FKFilial = FKFilial;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQtdEstoque() {
        return qtdEstoque;
    }

    public void setQtdEstoque(int qtdEstoque) {
        this.qtdEstoque = qtdEstoque;
    }

    public int getFKFilial() {
        return FKFilial;
    }

    public void setFKFilial(int FKFilial) {
        this.FKFilial = FKFilial;
    }
    
    
    
    
    
    
}
