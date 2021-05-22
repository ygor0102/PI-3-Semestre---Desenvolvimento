

package DAO;

import Model.Usuario;
import Utils.GerenciarConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UsuarioDAO {
    
    public static Usuario getUsuario(String login) {
        Usuario usuario = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from usuario where login=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setLogin(login);
                usuario.setFilial(rs.getString("fk_id_filial"));
                usuario.setNome(rs.getString("nome"));
                usuario.setPerfil(rs.getString("perfil"));
                usuario.setSenha(rs.getString("senha"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
        
        
    }
    
}
