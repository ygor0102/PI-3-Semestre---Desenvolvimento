/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Venda;

import DAO.ClienteDAO;
import DAO.ProdutoDAO;
import Model.Cliente;
import Model.Produto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class CarrinhoServlet extends HttpServlet {
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         List<Produto> listaCarrinho = ProdutoDAO.listaCarrinho();
         request.setAttribute("listaCarrinho", listaCarrinho);
         
         List<Cliente> listaClientes = ClienteDAO.listaClientesComID();
         request.setAttribute("listaClientes", listaClientes);
         
         double PrecoTotal = ProdutoDAO.GetPrecoTotal();
         request.setAttribute("PrecoTotal", PrecoTotal);
         request.getRequestDispatcher("/Protegido/Carrinho.jsp").forward(request, response);

    }
    
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
                
        int idProduto = Integer.parseInt(request.getParameter("id_produto"));
        int QtdProduto = Integer.parseInt(request.getParameter("qtd_produto"));
        
        Produto produto = ProdutoDAO.getProduto(idProduto);

        produto.setQtdEstoque(QtdProduto);
       
        boolean ok = ProdutoDAO.addCarrinho(produto);
        
        // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("CarrinhoServlet");
            } else {
                System.out.println("Falha!");
            }
   
    }

}
