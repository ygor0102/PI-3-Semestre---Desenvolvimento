
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ygor.oliveira
 */
public class GerenciarConexao {
   
    static {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GerenciarConexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    public static Connection getConexao() throws SQLException {
        String url = "jdbc:derby://localhost:1527/DBLis";
        String user = "root";
        String pass = "root";
        return DriverManager.getConnection(url, user, pass);
    }
    
}
