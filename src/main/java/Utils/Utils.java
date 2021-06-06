/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Model.Cliente;
import Model.Produto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author ygor.oliveira
 */
public class Utils {
    
    
      public static Cliente popularCliente(ResultSet rs) throws SQLException {
             String nome = rs.getString("nome");
             Date nascimento = rs.getDate("nascimento");
             String CPF = rs.getString("CPF");
             String sexo = rs.getString("sexo");
             String estado = rs.getString("estado");
             String UF = rs.getString("UF");
             String logradouro = rs.getString("logradouro");
             int numero = rs.getInt("numero_residencia");
             String complemento = rs.getString("complemento");
             String telefone = rs.getString("telefone");
             String celular = rs.getString("celular");
             String email = rs.getString("email");
          
        
        Cliente cliente = new Cliente(nome, nascimento, CPF, sexo, estado, UF, logradouro,
                                               numero, complemento, telefone, celular, email);
        return cliente;
    }
      
        public static Produto popularProduto(ResultSet rs) throws SQLException {
                int idProduto = rs.getInt("id_produto");
                String nome = rs.getString("nome");
                String modelo = rs.getString("modelo");
                String tipo = rs.getString("tipo");
                double preco = rs.getDouble("preco");
                int qtdEstoque = rs.getInt("qtd_estoque");
                int FKFilial = rs.getInt("fk_id_filial");
               
                Produto produto = new Produto(idProduto, nome, modelo, tipo, preco, qtdEstoque, FKFilial);
                
        return produto;
    }
}
