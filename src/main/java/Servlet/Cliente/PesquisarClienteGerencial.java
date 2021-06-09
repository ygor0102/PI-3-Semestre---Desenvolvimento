/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Servlet.Cliente;

import DAO.ClienteDAO;
import DAO.ProdutoDAO;
import Model.Cliente;
import Model.Produto;
import Model.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PesquisarClienteGerencial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
         String nome = request.getParameter("nome_cliente");
        
         List<Cliente> listaClientes = ClienteDAO.listaPorNome(nome);
         request.setAttribute("listaClientes", listaClientes);
         request.getRequestDispatcher("ProdutoServlet").forward(request, response);
         
    }

}
