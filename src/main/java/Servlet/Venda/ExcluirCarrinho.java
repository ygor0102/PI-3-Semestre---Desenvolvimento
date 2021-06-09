/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Servlet.Venda;

import DAO.ProdutoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcluirCarrinho extends HttpServlet {
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int idProduto = Integer.parseInt(request.getParameter("id_produto"));
        boolean ok = ProdutoDAO.excluirCarrinho(idProduto);
        
          if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("CarrinhoServlet");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
  
}
}
