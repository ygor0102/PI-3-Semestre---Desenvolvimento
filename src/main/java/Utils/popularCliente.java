/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Model.Cliente;
import java.sql.ResultSet;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 *
 * @author ygor.oliveira
 */
public class popularCliente {
    
    
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
}
