/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utils.GerenciarConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Produto;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ygor.oliveira
 */
public class ProdutoDAO {
    
     public static boolean cadastrarProduto(Produto produto) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into produto(nome, modelo, tipo, preco, qtd_estoque, fk_id_filial) values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getModelo());
            ps.setString(3, produto.getTipo());
            ps.setDouble(4, produto.getPreco());
            ps.setInt(5, produto.getQtdEstoque());
            ps.setInt(6, produto.getFKFilial());
  
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
     
      public static List<Produto> listaProdutos() {
        List<Produto> produtos = new ArrayList<>();
        String query = "select * from produto";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String nome = rs.getString("nome");
                String modelo = rs.getString("modelo");
                String tipo = rs.getString("tipo");
                double preco = rs.getDouble("preco");
                int qtdEstoque = rs.getInt("qtd_estoque");
                int FKFilial = rs.getInt("fk_id_filial");
               
                Produto produto = new Produto(nome, modelo, tipo, preco, qtdEstoque, FKFilial);
                produtos.add(produto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produtos;   
    }
   
     
    
}
