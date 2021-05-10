/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Venda;

import DAO.ProdutoDAO;
import DAO.VendaDAO;
import Model.ItemVenda;
import Model.Produto;
import Model.Venda;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class VendaServlet extends HttpServlet {

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Date dt = new Date();
        
        SimpleDateFormat formato = new SimpleDateFormat("dd/mm/yyyy");
        formato.format(dt);

        Date dataVenda = dt;
        double PrecoTotal = ProdutoDAO.GetPrecoTotal();
        int FkIdCliente = Integer.parseInt(request.getParameter("id_cliente"));
        
        Venda venda = new Venda(dataVenda, PrecoTotal, FkIdCliente);
        boolean ok = VendaDAO.cadastrarVenda(venda);
        
        int idVenda = VendaDAO.idVenda;
        
        List<Produto> listaCarrinho = ProdutoDAO.listaCarrinho();
        boolean ok2 = false;
        
      for(Produto produto : listaCarrinho){   
         
         int idProduto = produto.getIdProduto();
         int qtdVendida = produto.getQtdEstoque();
         
         ItemVenda item = new ItemVenda(idVenda, idProduto, qtdVendida);
         ok2 = VendaDAO.cadastrarItens(item);     
      }
      
        // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("Sucesso.jsp");
            } else {
                System.out.println("Falha!");
            }
    }
 
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
         List<Produto> listaProdutos = ProdutoDAO.listaProdutos();
         request.setAttribute("listaProdutos", listaProdutos);
         request.getRequestDispatcher("/Venda.jsp").forward(request, response);
    }

}
