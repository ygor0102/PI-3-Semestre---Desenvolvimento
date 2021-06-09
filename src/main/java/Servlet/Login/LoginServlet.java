/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */

package Servlet.Login;

import DAO.UsuarioDAO;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import Utils.CryptoUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senhaAberta = request.getParameter("senha");
        
        Usuario usuario = UsuarioDAO.getUsuario(login);
        if (usuario == null) {
            response.sendRedirect("Login.jsp?erroLogin=true");
        } else {
             boolean senhaOK = CryptoUtils.validarSenha(senhaAberta, usuario.getSenha());
            if (senhaOK) { // Login OK
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuario", usuario);
                response.sendRedirect("Protegido/index.jsp");
            } else { // Login falhou
                response.sendRedirect("Login.jsp?erroLogin=true");
            }
        }
       
        
        
    }

  

}
