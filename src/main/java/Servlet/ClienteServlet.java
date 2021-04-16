
package Servlet;

import DAO.ClienteDAO;
import Model.Cliente;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class ClienteServlet extends HttpServlet {

     

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        // Passo 1: Recuperar dados do formulário
        String nome = request.getParameter("nome");
        Date nascimento = null;
        try {
            nascimento = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("nascimento"));
        } catch (ParseException ex) {
            Logger.getLogger(ClienteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String CPF = request.getParameter("CPF");
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");
        String UF = request.getParameter("UF");
        String logradouro = request.getParameter("logradouro");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String complemento = request.getParameter("complemento");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
   
            // Passo 2: Inserir no BD
            Cliente cliente = new Cliente(nome, nascimento, CPF, sexo, estado, 
                                            UF, logradouro, numero, complemento, telefone, celular, email);
            
            boolean ok = ClienteDAO.cadastrarCliente(cliente);
            
            // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("Sucesso.jsp");
            } else {
                System.out.println("Falha!");
            }
            
            
    }

    

}