/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.ItemVenda;
import Model.Produto;
import Model.Venda;
import Utils.GerenciarConexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ygor.oliveira
 */
public class VendaDAO {
    
    public static int idVenda;
    
    public static boolean cadastrarVenda(Venda venda) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into venda(data_venda, preco_total, fk_id_cliente) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, new java.sql.Date(venda.getDataVenda().getTime()));
            ps.setDouble(2, venda.getPrecoTotal());
            ps.setInt(3, venda.getFkIdCliente());
            ps.executeUpdate();
            
             ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       venda.setIdVenda(generatedKeys.getInt(1));
                       idVenda = venda.getIdVenda();
                       
                }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static boolean cadastrarItens(ItemVenda item) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into item_venda(FK_id_venda, Fk_id_produto, qtd_vendida) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, item.getFkIdVenda());
            ps.setInt(2, item.getFkIdProduto());
            ps.setInt(3, item.getQtdVendida());
            ps.executeUpdate(); 
            String query2 = "update produto set qtd_estoque = qtd_estoque - "+item.getQtdVendida()+"  where id_produto = "+item.getFkIdProduto();
            PreparedStatement ps2 = con.prepareStatement(query2);
            ps2.executeUpdate();
            String query3 = "truncate table carrinho";
            PreparedStatement ps3 = con.prepareStatement(query3);
            ps3.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static List<Venda> reporteSintetico() {
        List<Venda> vendas = new ArrayList<>();
        String query = "select data_venda, preco_total, FK_id_cliente, cliente.nome from venda\n" +
"        inner join cliente on venda.FK_id_cliente = cliente.id_cliente";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Date dataVenda = rs.getDate("data_venda");
                double precoTotal = rs.getDouble("preco_total");
                int fkIdCliente = rs.getInt("FK_id_cliente");
                String nomeCliente = rs.getString("nome");
               
                Venda venda = new Venda(dataVenda, precoTotal, fkIdCliente, nomeCliente);
                vendas.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vendas;
    }
    
}
