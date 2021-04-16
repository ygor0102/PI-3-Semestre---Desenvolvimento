
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Cliente;
import Utils.Conexao;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
     
     public static List<Cliente> listaClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String query = "select * from cliente";
        Connection con;
        try {
            con = Conexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
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
                clientes.add(cliente);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;   
    }
    
}
