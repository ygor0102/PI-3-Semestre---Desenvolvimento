/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Servlet.Produto;

import DAO.ProdutoDAO;
import Model.Produto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AlterarProduto extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idProduto = Integer.parseInt(request.getParameter("idproduto"));
        Produto produto = ProdutoDAO.getProduto(idProduto);
        
        request.setAttribute("produto", produto);
        
         request.getRequestDispatcher("/Protegido/Cadastro.jsp").forward(request, response);
        
        
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        String nome = request.getParameter("nome");
        String modelo = request.getParameter("modelo");
        String tipo = request.getParameter("tipo");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int qtdEstoque = Integer.parseInt(request.getParameter("qtdEstoque"));
        int FKFilial = Integer.parseInt(request.getParameter("filial"));
        
        Produto produto = new Produto(idProduto, nome, modelo, tipo, preco, qtdEstoque, FKFilial);
        boolean ok = ProdutoDAO.atualizarProduto(produto);
        
        // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("Sucesso.jsp");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
   
    }
       
}
