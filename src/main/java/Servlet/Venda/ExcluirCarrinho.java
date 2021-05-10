/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Venda;

import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
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
            }
  
}
}
