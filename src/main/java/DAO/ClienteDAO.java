
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Cliente;
import Utils.Conexao;

/**
 *
 * @author ygor.oliveira
 */
public class ClienteDAO {
    
     public static boolean cadastrarCliente(Cliente cliente) {
        boolean ok = true;
        try {
            Connection con = Conexao.getConexao();
            String query = "insert into cliente(nome, nascimento, CPF, sexo, estado, UF, logradouro,"
                    + "                         numero_residencia, complemento, telefone, celular, email) "
                    + "                         values (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cliente.getNome());
            ps.setDate(2, new java.sql.Date(cliente.getNascimento().getTime()));
            ps.setString(3, cliente.getCPF());
            ps.setString(4, cliente.getSexo());
            ps.setString(5, cliente.getEstado());
            ps.setString(6, cliente.getUF());
            ps.setString(7, cliente.getLogradouro());
            ps.setInt(8, cliente.getNumero());
            ps.setString(9, cliente.getComplemento());
            ps.setString(10, cliente.getTelefone());
            ps.setString(11, cliente.getCelular());
            ps.setString(12, cliente.getEmail());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
}
