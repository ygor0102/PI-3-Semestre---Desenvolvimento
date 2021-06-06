/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Produto;

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
public class PesquisarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        String nome = request.getParameter("nome_produto");
        
        if(usuario.isGerente()){
            List<Produto> listaProdutos = ProdutoDAO.listaProdutosNome(nome);
            request.setAttribute("listaProdutos", listaProdutos);
        }else{
            
            List<Produto> listaProdutos = ProdutoDAO.listaProdutosFilialNome(Integer.parseInt(usuario.getFilial()),nome);
            request.setAttribute("listaProdutos", listaProdutos);  
        }
        
        List<Cliente> listaClientes = ClienteDAO.listaClientes();
        request.setAttribute("listaClientes", listaClientes);
        
         request.getRequestDispatcher("/Protegido/Pesquisa.jsp").forward(request, response);
    }
}
