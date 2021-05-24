/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.ItemVenda;
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
        String query = "select id_venda, data_venda, preco_total, FK_id_cliente, cliente.nome from venda\n" +
"        inner join cliente on venda.FK_id_cliente = cliente.id_cliente";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idVenda = rs.getInt("id_venda");
                Date dataVenda = rs.getDate("data_venda");
                double precoTotal = rs.getDouble("preco_total");
                int fkIdCliente = rs.getInt("FK_id_cliente");
                String nomeCliente = rs.getString("nome");
               
                Venda venda = new Venda(idVenda, dataVenda, precoTotal, fkIdCliente, nomeCliente);
                vendas.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vendas;
    }
    
    public static List<Venda> reporteSinteticoPorDatas(String dataIni, String dataFim) {
        List<Venda> vendas = new ArrayList<>();
        PreparedStatement ps = null;
        String query = "select id_venda, data_venda, preco_total, FK_id_cliente, cliente.nome from venda\n" +
"        inner join cliente on venda.FK_id_cliente = cliente.id_cliente\n"
                + "where data_venda between ? and ?";
        
        Connection con;
        try {
            
            
            con = GerenciarConexao.getConexao();
            ps = con.prepareStatement(query);
            ps.setString(1, dataIni);
            ps.setString(2, dataFim);
            
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idVenda = rs.getInt("id_venda");
                Date dataVenda = rs.getDate("data_venda");
                double precoTotal = rs.getDouble("preco_total");
                int fkIdCliente = rs.getInt("FK_id_cliente");
                String nomeCliente = rs.getString("nome");
               
                Venda venda = new Venda(idVenda, dataVenda, precoTotal, fkIdCliente, nomeCliente);
                vendas.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vendas;
    }
    
    public static List<ItemVenda> reporteAnalitico() {
        List<ItemVenda> itens = new ArrayList<>();
        String query = "select venda.data_venda, Fk_id_venda, FK_id_produto, qtd_vendida, produto.nome, produto.tipo, produto.preco, (preco*qtd_vendida), produto.FK_ID_FILIAL from item_venda\n" +
"       inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"       inner join venda on item_venda.FK_id_venda = venda.id_venda";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                 Date dataVenda = rs.getDate("data_venda");
                int FkIdVenda = rs.getInt("Fk_id_venda");
                int FkIdProduto = rs.getInt("FK_id_produto");      
                int QtdVendida = rs.getInt("qtd_vendida");
                String nomeProduto = rs.getString("nome");
                String tipoProduto = rs.getString("tipo");
                double precoProduto = rs.getDouble("preco");
                double valorFaturado = rs.getDouble(8);
                int FkIdFilial = rs.getInt("FK_id_filial");
                
                ItemVenda venda = new ItemVenda(dataVenda, FkIdVenda, FkIdProduto, QtdVendida, nomeProduto, tipoProduto, precoProduto, valorFaturado, FkIdFilial);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
    
    public static List<ItemVenda> reporteAnaliticoFilial(int filialUser) {
        List<ItemVenda> itens = new ArrayList<>();
        String query = "select venda.data_venda, Fk_id_venda, FK_id_produto, qtd_vendida, produto.nome, produto.tipo, produto.preco, (preco*qtd_vendida), produto.FK_ID_FILIAL from item_venda\n" +
"       inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"       inner join venda on item_venda.FK_id_venda = venda.id_venda\n"+ 
                "where produto.FK_ID_FILIAL = ?";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, filialUser);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                 Date dataVenda = rs.getDate("data_venda");
                int FkIdVenda = rs.getInt("Fk_id_venda");
                int FkIdProduto = rs.getInt("FK_id_produto");      
                int QtdVendida = rs.getInt("qtd_vendida");
                String nomeProduto = rs.getString("nome");
                String tipoProduto = rs.getString("tipo");
                double precoProduto = rs.getDouble("preco");
                double valorFaturado = rs.getDouble(8);
                int FkIdFilial = rs.getInt("FK_id_filial");
                
                ItemVenda venda = new ItemVenda(dataVenda, FkIdVenda, FkIdProduto, QtdVendida, nomeProduto, tipoProduto, precoProduto, valorFaturado, FkIdFilial);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
    
    public static List<ItemVenda> reporteAnaliticoPorDatas(String dataIni, String dataFim) {
        List<ItemVenda> itens = new ArrayList<>();
        PreparedStatement ps = null;
        String query = "select venda.data_venda, Fk_id_venda, FK_id_produto, qtd_vendida, produto.nome, produto.tipo, produto.preco, (preco*qtd_vendida), produto.FK_ID_FILIAL from item_venda\n" +
"       inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"       inner join venda on item_venda.FK_id_venda = venda.id_venda\n" +
"       where data_venda between ? and ?";
        Connection con;
        try {
            
            
            con = GerenciarConexao.getConexao();
            ps = con.prepareStatement(query);
            ps.setString(1, dataIni);
            ps.setString(2, dataFim);
            
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Date dataVenda = rs.getDate("data_venda");
                int FkIdVenda = rs.getInt("Fk_id_venda");
                int FkIdProduto = rs.getInt("FK_id_produto");      
                int QtdVendida = rs.getInt("qtd_vendida");
                String nomeProduto = rs.getString("nome");
                String tipoProduto = rs.getString("tipo");
                double precoProduto = rs.getDouble("preco");
                double valorFaturado = rs.getDouble(8);
                int FkIdFilial = rs.getInt("FK_id_filial");
                
                ItemVenda venda = new ItemVenda(dataVenda, FkIdVenda, FkIdProduto, QtdVendida, nomeProduto, tipoProduto, precoProduto, valorFaturado, FkIdFilial);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
    
    public static List<ItemVenda> reporteAnaliticoPorDatasFilial(String dataIni, String dataFim, int filialUser) {
        List<ItemVenda> itens = new ArrayList<>();
        PreparedStatement ps = null;
        String query = "select venda.data_venda, Fk_id_venda, FK_id_produto, qtd_vendida, produto.nome, produto.tipo, produto.preco, (preco*qtd_vendida), produto.FK_ID_FILIAL from item_venda\n" +
"       inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"       inner join venda on item_venda.FK_id_venda = venda.id_venda\n" +
"       where produto.FK_ID_FILIAL = ? and data_venda between ? and ?";
        Connection con;
        try {
            
            
            con = GerenciarConexao.getConexao();
            ps = con.prepareStatement(query);
            ps.setInt(1, filialUser);
            ps.setString(2, dataIni);
            ps.setString(3, dataFim);
            
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Date dataVenda = rs.getDate("data_venda");
                int FkIdVenda = rs.getInt("Fk_id_venda");
                int FkIdProduto = rs.getInt("FK_id_produto");      
                int QtdVendida = rs.getInt("qtd_vendida");
                String nomeProduto = rs.getString("nome");
                String tipoProduto = rs.getString("tipo");
                double precoProduto = rs.getDouble("preco");
                double valorFaturado = rs.getDouble(8);
                int FkIdFilial = rs.getInt("FK_id_filial");
                
                ItemVenda venda = new ItemVenda(dataVenda, FkIdVenda, FkIdProduto, QtdVendida, nomeProduto, tipoProduto, precoProduto, valorFaturado, FkIdFilial);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
    
    public static List<ItemVenda> reporteFiliais() {
        List<ItemVenda> itens = new ArrayList<>();
        String query = "select filial.nome, sum(preco*qtd_vendida) from item_venda\n" +
"     inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"     inner join filial on produto.FK_ID_FILIAL = filial.ID_FILIAL\n" +
"     group by filial.nome";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String nomeProduto = rs.getString("nome");
                double valorFaturado = rs.getDouble(2);
               
                ItemVenda venda = new ItemVenda();
                venda.setNomeProduto(nomeProduto);
                venda.setValorFaturado(valorFaturado);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
    
    public static List<ItemVenda> reporteFiliaisAdmin(int filialUser) {
        List<ItemVenda> itens = new ArrayList<>();
        String query = "select filial.nome, sum(preco*qtd_vendida) from item_venda\n" +
"     inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"     inner join filial on produto.FK_ID_FILIAL = filial.ID_FILIAL\n" +
"     where filial.ID_FILIAL = ?"+
"     group by filial.nome";

        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, filialUser);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String nomeProduto = rs.getString("nome");
                double valorFaturado = rs.getDouble(2);
               
                ItemVenda venda = new ItemVenda();
                venda.setNomeProduto(nomeProduto);
                venda.setValorFaturado(valorFaturado);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
    
     public static List<ItemVenda> reporteCategorias() {
        List<ItemVenda> itens = new ArrayList<>();
        String query = "select produto.tipo, sum(preco*qtd_vendida) from item_venda\n" +
"        inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"        group by produto.tipo";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String nomeProduto = rs.getString("tipo");
                double valorFaturado = rs.getDouble(2);
               
                ItemVenda venda = new ItemVenda();
                venda.setNomeProduto(nomeProduto);
                venda.setValorFaturado(valorFaturado);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
     
     public static List<ItemVenda> reporteCategoriasFilial(int filialUser) {
        List<ItemVenda> itens = new ArrayList<>();
        String query = "select produto.tipo, sum(preco*qtd_vendida) from item_venda\n" +
"        inner join produto on item_venda.FK_id_produto = produto.id_produto\n" +
"        where produto.FK_id_filial = ?"+
"        group by produto.tipo";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, filialUser);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                String nomeProduto = rs.getString("tipo");
                double valorFaturado = rs.getDouble(2);
               
                ItemVenda venda = new ItemVenda();
                venda.setNomeProduto(nomeProduto);
                venda.setValorFaturado(valorFaturado);
                itens.add(venda);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;
    }
}
