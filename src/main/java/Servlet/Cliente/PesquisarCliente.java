/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

/**
 *
 * @author ygor.oliveira
 */
public class PesquisarCliente extends HttpServlet {

  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        if(usuario.isGerente()){
            List<Produto> listaCarrinho = ProdutoDAO.listaCarrinho();
            request.setAttribute("listaCarrinho", listaCarrinho);
            
            double PrecoTotal = ProdutoDAO.GetPrecoTotal();
            request.setAttribute("PrecoTotal", PrecoTotal);
         
         
        }else{
            
            List<Produto> listaCarrinho = ProdutoDAO.listaCarrinhoFilial(Integer.parseInt(usuario.getFilial()));
            request.setAttribute("listaCarrinho", listaCarrinho);
            
            double PrecoTotal = ProdutoDAO.GetPrecoTotalFilial(Integer.parseInt(usuario.getFilial()));
            request.setAttribute("PrecoTotal", PrecoTotal);
        }
        
         String nome = request.getParameter("nome_cliente");
        
         List<Cliente> listaClientes = ClienteDAO.listaPorNome(nome);
         request.setAttribute("listaClientes", listaClientes);
         request.getRequestDispatcher("/Protegido/Carrinho.jsp").forward(request, response);
         
    }
}
